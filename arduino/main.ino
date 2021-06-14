// Basic demo for accelerometer readings from Adafruit MPU6050

#include <Adafruit_MPU6050.h>
#include <Wire.h>

#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEServer.h>

#include "driver/pcnt.h"

float err_gx, err_gy, err_gz;
float angle_target = -0.02;

volatile float throttle_p = 35;
volatile float throttle_d = 6;
volatile float pitch_speed_target = 0;
volatile float angle_p = 7200;
volatile float angle_d = 6400;
volatile float yaw_speed_target = 0;
volatile float yaw_speed_p = 10;
volatile float yaw_speed_d = 2;
volatile float max_throttle = 0;

#define SERVICE_UUID        "844316a2-e638-49c3-b667-32462548b173"
#define CHARACTERISTIC_UUID "5a2ca845-0661-488e-beed-83c3a4a5b4d8"

#define TARGET_LIMIT 100
#define TARGET_RATE 1.0

BLECharacteristic *pCharacteristic;
bool bleConnected = false;

class BleServerCallbacks: public BLEServerCallbacks {
    void onConnect(BLEServer* pServer, esp_ble_gatts_cb_param_t* param) {
      bleConnected = true;
      Serial.println("connected");
    };

    void onDisconnect(BLEServer* pServer) {
      bleConnected = false;
      Serial.println("disconnected");
      
      uint8_t initValue[] = {TARGET_LIMIT, TARGET_LIMIT};
      pCharacteristic->setValue(initValue, 2);
    }
};

void setupBle() {
  BLEDevice::init("BalanceCar");
  BLEServer *pServer = BLEDevice::createServer();
  pServer->setCallbacks(new BleServerCallbacks());

  BLEService *pService = pServer->createService(SERVICE_UUID);
  
  pCharacteristic = pService->createCharacteristic(
                                         CHARACTERISTIC_UUID,
                                         BLECharacteristic::PROPERTY_READ |
                                         BLECharacteristic::PROPERTY_WRITE
                                       );
  uint8_t initValue[] = {TARGET_LIMIT, TARGET_LIMIT};
  pCharacteristic->setValue(initValue, 2);
  pService->start();

  BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
  pAdvertising->addServiceUUID(SERVICE_UUID);
  pAdvertising->setScanResponse(true);
  pAdvertising->setMinPreferred(0x06);  // functions that help with iPhone connections issue
  pAdvertising->setMinPreferred(0x12);
  BLEDevice::startAdvertising();
}

void updateTargets() {
  uint8_t* data = pCharacteristic->getData();
  pitch_speed_target = float(data[0] - TARGET_LIMIT) * TARGET_RATE;
  yaw_speed_target = float(data[1] - TARGET_LIMIT) * TARGET_RATE;
}


/*
 * ************* Motor Encoder ****************
 */
#define PCNT_UNIT_A PCNT_UNIT_0
#define PCNT_UNIT_B PCNT_UNIT_1

#define PCNT_H_LIM_VAL      30000
#define PCNT_L_LIM_VAL     -30000

#define ENCODER_A1 34
#define ENCODER_A2 35
#define ENCODER_B1 33
#define ENCODER_B2 32

// One round encoder pulse count = 341.2
// RPM = 210
// pulse per second = 341.2 * 210 / 60 = 1194.2
// filter value is APB_CLK 80Mhz
// 80M / 1200 = 66666.667
#define PCNT_FILTER_VALUE 1023 // maximum possible value

void setupMotorEncoder(pcnt_unit_t unit, int pin1, int pin2) {
    /* Prepare configuration for the PCNT unit */
  pcnt_config_t pcnt_config;

  // ch0
  pcnt_config.pulse_gpio_num = pin1;
  pcnt_config.ctrl_gpio_num = pin2;
  pcnt_config.channel = PCNT_CHANNEL_0;
  pcnt_config.pos_mode = PCNT_COUNT_INC; // Count up on the positive edge
  pcnt_config.neg_mode = PCNT_COUNT_DEC; // Keep the counter value on the negative edg

  pcnt_config.lctrl_mode = PCNT_MODE_REVERSE; // Reverse counting direction if low
  pcnt_config.hctrl_mode = PCNT_MODE_KEEP; // Keep the primary counter mode if high
  pcnt_config.counter_h_lim = PCNT_H_LIM_VAL;
  pcnt_config.counter_l_lim = PCNT_L_LIM_VAL;
  pcnt_config.unit = unit;
  pcnt_unit_config(&pcnt_config);

  // ch1
  pcnt_config.pulse_gpio_num = pin2;
  pcnt_config.ctrl_gpio_num = pin1;
  pcnt_config.channel = PCNT_CHANNEL_1;
  pcnt_config.pos_mode = PCNT_COUNT_DEC; // Count up on the positive edge
  pcnt_config.neg_mode = PCNT_COUNT_INC; // Keep the counter value on the negative edge
  pcnt_unit_config(&pcnt_config);

  /* Configure and enable the input filter */
  pcnt_set_filter_value(unit, PCNT_FILTER_VALUE);
  pcnt_filter_enable(unit);

  /* Initialize PCNT's counter */
  pcnt_counter_pause(unit);
  pcnt_counter_clear(unit);

  /* Everything is set up, now go to counting */
  pcnt_counter_resume(unit);
}

void setupMotorEncoders() {
  setupMotorEncoder(PCNT_UNIT_A, ENCODER_A1, ENCODER_A2);
  setupMotorEncoder(PCNT_UNIT_B, ENCODER_B1, ENCODER_B2);
}

/*
 * ************* MOTOR Control ****************
 */
#define APWM 19
#define AIN2 17
#define AIN1 18
#define STBY 16
#define BIN1 26
#define BIN2 27
#define BPWM 25
// v0
//#define BIN1 26
//#define BIN2 25
//#define BPWM 27

// use first channel of 16 channels (started from zero)
#define APWM_LEDC_CHANNEL 0
#define BPWM_LEDC_CHANNEL 1

// use 13 bit precission for LEDC timer
#define LEDC_TIMER_BITS 13

// use 5000 Hz as a LEDC base frequency
#define LEDC_BASE_FREQ     5000

// Arduino like analogWrite
// value has to be between 0 and valueMax
void ledcAnalogWrite(uint8_t channel, uint32_t value, uint32_t valueMax = 255) {
  // calculate duty, 8191 from 2 ^ 13 - 1
  uint32_t duty = (8191 / valueMax) * min(value, valueMax);

  // write duty to LEDC
  ledcWrite(channel, duty);
}

void setupMotors() {
  // Setup timer and attach timer to a pwm pin
  ledcSetup(APWM_LEDC_CHANNEL, LEDC_BASE_FREQ, LEDC_TIMER_BITS);
  ledcAttachPin(APWM, APWM_LEDC_CHANNEL);
  ledcSetup(BPWM_LEDC_CHANNEL, LEDC_BASE_FREQ, LEDC_TIMER_BITS);
  ledcAttachPin(BPWM, BPWM_LEDC_CHANNEL);
  
  pinMode(AIN1, OUTPUT);
  pinMode(AIN2, OUTPUT);
  pinMode(BIN1, OUTPUT);
  pinMode(BIN2, OUTPUT);
  pinMode(STBY, OUTPUT);

  updateMotors(0, 0);
  digitalWrite(STBY, 1);
}

void updateMotor(uint8_t in1_pin, uint8_t in2_pin, uint8_t channel, float value) {
  if (value < 0) {
    digitalWrite(in1_pin, 0);
    digitalWrite(in2_pin, 1);
    ledcAnalogWrite(channel, (uint32_t)(-value));
  } else if (value > 0) {
    digitalWrite(in1_pin, 1);
    digitalWrite(in2_pin, 0);
    ledcAnalogWrite(channel, (uint32_t)value);
  } else {
    digitalWrite(in1_pin, 1);
    digitalWrite(in2_pin, 1);
    ledcAnalogWrite(channel, 0);
  }
}

inline void updateMotors(float value1, float value2) {
  updateMotor(AIN1, AIN2, APWM_LEDC_CHANNEL, value1);
  updateMotor(BIN1, BIN2, BPWM_LEDC_CHANNEL, value2);
}

/*
 * ************** MPU Control ***************
 */

Adafruit_MPU6050 mpu;

void setupMPU() {
  if (!mpu.begin()) {
    Serial.println("failed to start MPU");
    while (1) {
      delay(10);
    }
  }

  mpu.setAccelerometerRange(MPU6050_RANGE_2_G);
  mpu.setGyroRange(MPU6050_RANGE_500_DEG);
  mpu.setFilterBandwidth(MPU6050_BAND_260_HZ);
}

#define ERROR_ITERS 400

void calibrateMPU() {
  int i = 0;
  sensors_event_t a, g, t;
  float ax, ay, az;
  float egx, egy, egz;
  float eax, eay;
   
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, 1);

  while (i < ERROR_ITERS) {
    mpu.getEvent(&a, &g, &t);
    ax = a.acceleration.x;
    ay = a.acceleration.y;
    az = a.acceleration.z;
    
    eax += atan(ay / sqrt(pow(ax, 2) + pow(az, 2)));
    eay += atan(-1 * ax / sqrt(pow(ay, 2) + pow(az, 2)));
    
    egx += g.gyro.x;
    egy += g.gyro.y;
    egz += g.gyro.z;
    
    i++;
  }

//  angle_target = eax / ERROR_ITERS;
  angle_target = eay / ERROR_ITERS;
  err_gx = egx / ERROR_ITERS;
  err_gy = egy / ERROR_ITERS;
  err_gz = egz / ERROR_ITERS;

  digitalWrite(LED_BUILTIN, 0);
}

#define ALPHA 0.98
#define CONTROL_INTERVAL_MS 10
uint32_t next_control_time;

float ax, ay, az, gx, gy;
float angle_x, angle_y;
float dt;

uint32_t current_time, previous_time; // microseconds;

inline void calculateOrientation() {
  sensors_event_t a, g, t;
  float accel_angle_x, accel_angle_y;
  
  previous_time = current_time;
  current_time = micros();
  dt = ((float)(current_time - previous_time)) / 1000000.0; // convert to seconds
  
  mpu.getEvent(&a, &g, &t);

  ax = a.acceleration.x;
  ay = a.acceleration.y;
  az = a.acceleration.z;
  gx = g.gyro.x - err_gx;
  gy = g.gyro.y - err_gy;

  accel_angle_x = atan(ay / sqrt(pow(ax, 2) + pow(az, 2)));
  accel_angle_y = atan(-1 * ax / sqrt(pow(ay, 2) + pow(az, 2)));

  if (isnan(accel_angle_x)) accel_angle_x = angle_x;
  if (isnan(accel_angle_y)) accel_angle_y = angle_y;

  angle_x = ALPHA * (angle_x + gx * dt) + (1.0 - ALPHA) * accel_angle_x;
  angle_y = ALPHA * (angle_y + gy * dt) + (1.0 - ALPHA) * accel_angle_y;
}

/*
 * ****************** PID Control ********************
 */
float throttle;
float prev_angle_error;
float prev_yaw_speed_error;

inline void control() {
  float throttle_error, throttle_derror;
  float angle_error, angle_derror, angle_delta;
  int16_t speed_a, speed_b;
  float pitch_speed;
  float yaw_speed, yaw_speed_error, yaw_speed_derror, throttle_diff;
  float left, right;
  
  calculateOrientation();
  updateTargets();
  
  Serial.printf("%.0f, %.0f\n", pitch_speed_target, yaw_speed_target);

  ESP_ERROR_CHECK(pcnt_get_counter_value(PCNT_UNIT_A, &speed_a));
  ESP_ERROR_CHECK(pcnt_counter_clear(PCNT_UNIT_A));
  ESP_ERROR_CHECK(pcnt_get_counter_value(PCNT_UNIT_B, &speed_b));
  ESP_ERROR_CHECK(pcnt_counter_clear(PCNT_UNIT_B));
  pitch_speed = float(speed_a + speed_b) / 2.0;

//  Serial.print(angle_x);
//  Serial.print(",");
//  Serial.print(angle_y);
//  Serial.println();

  throttle_error = angle_y - angle_target;
  throttle_derror = gy;

  // FIXME: the following calucation of acceleration of throttle is wrong,
  // should be replaced with a PID of throttle with angle as the error,
  // so the new throttle_i is the current throttle_p and new throttle_p is the current throttle_d.
  //
  // NOTE: this controls the acceleration of throttle, not the throttle itself
  throttle += throttle_p * throttle_error + throttle_d * throttle_derror; // PD control for balance
  if (abs(throttle) > max_throttle) max_throttle = throttle;
  if (abs(throttle) > 1000) {
    while (1) { updateMotors(0, 0); }
  }
  
  angle_error = pitch_speed - pitch_speed_target;
  angle_derror = angle_error - prev_angle_error; // sort of acceleration
  prev_angle_error = angle_error;
  angle_target = -1 * (angle_p * angle_error + angle_d * angle_derror) / 1000000.0; // PD control for speed

  yaw_speed = speed_a - speed_b;
  yaw_speed_error = yaw_speed - yaw_speed_target;
  yaw_speed_derror = prev_yaw_speed_error - yaw_speed_error;
  prev_yaw_speed_error = yaw_speed_error;
  throttle_diff = yaw_speed_p * yaw_speed_error + yaw_speed_d * yaw_speed_derror; // PD control for yaw

  left = throttle - throttle_diff / 2.0;
  right = throttle + throttle_diff / 2.0;

//  Serial.printf("%.2f, %.2f, %d, %d, %.0f\n", angle_y, angle_target, speed_a, speed_b, throttle);

  updateMotors(left, right);
}

pcnt_config_t pcnt_config;

void setup(void) {
  Serial.begin(115200);
  while (!Serial) {
    delay(10); // will pause Zero, Leonardo, etc until serial console opens
  }

  setupBle();
  Serial.println("Ble is initialized");
  
  setupMPU();
  Serial.println("MPU is initialized");

  delay(2000);
  calibrateMPU();
  Serial.println("MPU is calibrated");

  delay(100);
  setupMotors();
  Serial.println("motors are initialized");

  delay(100);
  setupMotorEncoders();
  Serial.println("encoders are initialized");
}

void loop() {
  uint32_t now_ms;
  now_ms = millis();
  
  if (now_ms > next_control_time) {
    next_control_time = ((now_ms / CONTROL_INTERVAL_MS) + 1) * CONTROL_INTERVAL_MS;
    control();
  }
}

package com.example.balancecar

import android.Manifest
import android.app.Activity
import android.bluetooth.*
import android.bluetooth.le.BluetoothLeScanner
import android.bluetooth.le.ScanCallback
import android.bluetooth.le.ScanResult
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.View
import androidx.activity.result.ActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import io.github.controlwear.virtual.joystick.android.JoystickView
import java.util.*
import kotlin.math.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val joystick = findViewById<View>(R.id.joystick_view_id) as JoystickView
        joystick.setOnMoveListener { angle, strength ->
            val a = 90 - angle
            val x = (sin(a.toFloat() * PI / 180) * strength.toFloat()).toInt()
            val y = (cos(a.toFloat() * PI / 180) * strength.toFloat()).toInt()
            // do whatever you want
            Log.i("joystick", String.format("angle: %d, strength: %d, a: %d, x: %d, y: %d", angle, strength, a, x, y))

            writePitchYaw(y, x)
        }
    }

    override fun onStart() {
        super.onStart()

        initializeBle()
    }

    override fun onStop() {
        super.onStop()

        bleGatt?.disconnect()
        bleGatt = null
        characteristic = null
    }

    private fun initializeBle() {
        requestFeaturesPermissions()
        scanBleDevice()
    }

    // Initializes Bluetooth variables.
    private val bluetoothManager
        get() = getSystemService(BluetoothManager::class.java)

    private val bluetoothAdapter
        get() = bluetoothManager.adapter

    private val requestEnableBT =
        registerForActivityResult(
            ActivityResultContracts.StartActivityForResult()
        ) { result: ActivityResult ->
            if (result.resultCode == Activity.RESULT_OK) {
                requestFeaturesPermissions()
            }
        }

    private val requestPermissionLauncher =
        registerForActivityResult(
            ActivityResultContracts.RequestPermission()
        ) { isGranted: Boolean ->
            if (isGranted) {
                requestFeaturesPermissions()
            }
        }

    private fun requestFeaturesPermissions() {
        // Ensures Bluetooth is available on the device and it is enabled. If not,
        // displays a dialog requesting user permission to enable Bluetooth.
        if (!bluetoothAdapter.isEnabled) {
            val enableBtIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
            requestEnableBT.launch(enableBtIntent)
            return
        }

        if(ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_DENIED) {
            requestPermissionLauncher.launch(Manifest.permission.ACCESS_FINE_LOCATION)
            return
        }
    }

    private var scanning = false
    private val handler = Handler(Looper.getMainLooper())

    // Stops scanning after 10 seconds.
    private val SCAN_PERIOD: Long = 10000

    private fun scanBleDevice() {
        val bluetoothLeScanner: BluetoothLeScanner? = bluetoothAdapter?.bluetoothLeScanner
        bluetoothLeScanner?.let { scanner ->
            if (!scanning) { // Stops scanning after a pre-defined scan period.
                handler.postDelayed({
                    scanning = false
                    scanner.stopScan(bleScanCallback)
                }, SCAN_PERIOD)
                scanning = true
                scanner.startScan(bleScanCallback)
            } else {
                scanning = false
                scanner.stopScan(bleScanCallback)
            }
        }
    }

    private val SERVICE_UUID: UUID = UUID.fromString("844316a2-e638-49c3-b667-32462548b173")
    private val CHARACTERISTIC_UUID: UUID = UUID.fromString("5a2ca845-0661-488e-beed-83c3a4a5b4d8")
    private var characteristic: BluetoothGattCharacteristic? = null

    private val bleScanCallback: ScanCallback = object : ScanCallback() {
        override fun onScanResult(callbackType: Int, result: ScanResult) {
            super.onScanResult(callbackType, result)
            val found = result.scanRecord?.serviceUuids?.find { uuid -> SERVICE_UUID == uuid.uuid } != null
            if (found) {
                Log.i("ble","found device:"+result.device.address)

                connectBLEDevice(result.device)
            }
        }
    }

    private var bleGatt: BluetoothGatt? = null
    private fun connectBLEDevice(device: BluetoothDevice) {
        bleGatt = device.connectGatt(this, false, gattCallback)
    }

    private val gattCallback: BluetoothGattCallback = object : BluetoothGattCallback() {
        override fun onConnectionStateChange(gatt: BluetoothGatt, status: Int, newState: Int) {
            super.onConnectionStateChange(gatt, status, newState)

            if (newState == BluetoothProfile.STATE_CONNECTED) {
                gatt.requestConnectionPriority(BluetoothGatt.CONNECTION_PRIORITY_HIGH)

                gatt.discoverServices()
            }
        }

        override fun onServicesDiscovered(gatt: BluetoothGatt, status: Int) {
            super.onServicesDiscovered(gatt, status)

            characteristic = gatt.getService(SERVICE_UUID)?.getCharacteristic(CHARACTERISTIC_UUID)
        }

        override fun onCharacteristicWrite(
            gatt: BluetoothGatt?,
            characteristic: BluetoothGattCharacteristic?,
            status: Int
        ) {
            super.onCharacteristicWrite(gatt, characteristic, status)

            writing = false;
            writePending()
        }
    }

    private var pendingWriteData: ByteArray? = null;
    private var writing = false;

    private fun writePending() {
        if (writing) return;

        pendingWriteData?.let { it ->
            characteristic?.apply {
                value = it
            }?.let { c ->
                bleGatt?.writeCharacteristic(c)
            }?.let { sent ->
                if (sent) {
                    writing = true;
                }
            }
        }
    }

    private fun writePitchYaw(pitch: Int, yaw: Int) {
        val pitch = mapValue(pitch).toByte()
        val yaw = mapValue(yaw).toByte()
        pendingWriteData = byteArrayOf(pitch, yaw)

        writePending()
    }

    private val LIMIT = 100;

    // [-LIMIT, LIMIT] -> [0, 2 * LIMIT]
    private fun mapValue(v: Int): Int {
        return min(max(v, -LIMIT), LIMIT) + LIMIT
    }
}
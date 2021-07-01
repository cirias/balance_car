EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L symbol_L6234:L6234 U1
U 1 1 60CEF01D
P 2250 2900
F 0 "U1" H 2250 1977 50  0000 C CNN
F 1 "L6234" H 2250 1886 50  0000 C CNN
F 2 "Package_SO:HSOP-20-1EP_11.0x15.9mm_P1.27mm_SlugDown_ThermalVias" H 2200 3000 50  0001 C CNN
F 3 "" H 2200 3000 50  0001 C CNN
	1    2250 2900
	1    0    0    -1  
$EndComp
$Comp
L Diode:BAT54S BAT1
U 1 1 60CF0B7C
P 2150 1600
F 0 "BAT1" V 1850 1350 50  0000 L CNN
F 1 "BAT54S" V 1950 1250 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2225 1725 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 2030 1600 50  0001 C CNN
	1    2150 1600
	0    -1   1    0   
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 60CF5D93
P 3000 1050
F 0 "#PWR01" H 3000 900 50  0001 C CNN
F 1 "VCC" H 3015 1223 50  0000 C CNN
F 2 "" H 3000 1050 50  0001 C CNN
F 3 "" H 3000 1050 50  0001 C CNN
	1    3000 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 60CFCE7E
P 1700 1550
F 0 "C4" H 1792 1596 50  0000 L CNN
F 1 "220nF" H 1792 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1700 1550 50  0001 C CNN
F 3 "~" H 1700 1550 50  0001 C CNN
F 4 "C1857" H 1700 1550 50  0001 C CNN "LCSC"
	1    1700 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 60D01B13
P 2550 1800
F 0 "C2" H 2642 1846 50  0000 L CNN
F 1 "10nF" H 2642 1755 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 2550 1800 50  0001 C CNN
F 3 "~" H 2550 1800 50  0001 C CNN
F 4 "C152841" H 2550 1800 50  0001 C CNN "LCSC"
	1    2550 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1050 2150 1050
Wire Wire Line
	1700 1450 1700 1300
Wire Wire Line
	1700 1300 2150 1300
Wire Wire Line
	2150 1050 2150 1300
Connection ~ 2150 1300
Wire Wire Line
	1700 1650 1700 1900
Wire Wire Line
	1700 1900 2150 1900
Wire Wire Line
	2150 1900 2150 2000
Connection ~ 2150 1900
Wire Wire Line
	3000 1050 3000 1250
Wire Wire Line
	3000 2300 2800 2300
Connection ~ 3000 1050
Connection ~ 3000 2200
Wire Wire Line
	3000 2200 3000 2300
Wire Wire Line
	2300 2000 2550 2000
Wire Wire Line
	2550 2000 2550 1900
Wire Wire Line
	2350 1600 2550 1600
Wire Wire Line
	2550 1600 2550 1700
Wire Wire Line
	2800 2200 3000 2200
$Comp
L Device:C_Small C1
U 1 1 60D1715F
P 3350 1250
F 0 "C1" V 3121 1250 50  0000 C CNN
F 1 "100nF" V 3212 1250 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 3350 1250 50  0001 C CNN
F 3 "~" H 3350 1250 50  0001 C CNN
F 4 "C24497" V 3350 1250 50  0001 C CNN "LCSC"
	1    3350 1250
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 60D1785A
P 3350 2400
F 0 "C3" V 3121 2400 50  0000 C CNN
F 1 "1uF" V 3212 2400 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 3350 2400 50  0001 C CNN
F 3 "~" H 3350 2400 50  0001 C CNN
F 4 "C1848" V 3350 2400 50  0001 C CNN "LCSC"
	1    3350 2400
	0    1    1    0   
$EndComp
$Comp
L Device:CP1 CAP1
U 1 1 60D199AF
P 3350 1700
F 0 "CAP1" V 3500 1700 50  0000 C CNN
F 1 "100uF" V 3200 1700 50  0000 C CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 3350 1700 50  0001 C CNN
F 3 "~" H 3350 1700 50  0001 C CNN
F 4 "C127971" V 3350 1700 50  0001 C CNN "LCSC"
	1    3350 1700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 60D1B58B
P 3700 1800
F 0 "#PWR03" H 3700 1550 50  0001 C CNN
F 1 "GND" H 3705 1627 50  0000 C CNN
F 2 "" H 3700 1800 50  0001 C CNN
F 3 "" H 3700 1800 50  0001 C CNN
	1    3700 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 60D1BB3F
P 3700 2500
F 0 "#PWR04" H 3700 2250 50  0001 C CNN
F 1 "GND" H 3705 2327 50  0000 C CNN
F 2 "" H 3700 2500 50  0001 C CNN
F 3 "" H 3700 2500 50  0001 C CNN
	1    3700 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1250 3250 1250
Connection ~ 3000 1250
Wire Wire Line
	3000 1250 3000 1700
Wire Wire Line
	3000 1700 3200 1700
Connection ~ 3000 1700
Wire Wire Line
	3000 1700 3000 2200
Wire Wire Line
	3500 1700 3700 1700
Wire Wire Line
	3700 1700 3700 1800
Wire Wire Line
	2800 2400 3250 2400
Wire Wire Line
	3450 2400 3700 2400
Wire Wire Line
	3700 2400 3700 2500
Wire Wire Line
	3450 1250 3700 1250
$Comp
L power:GND #PWR02
U 1 1 60D1AB11
P 3700 1350
F 0 "#PWR02" H 3700 1100 50  0001 C CNN
F 1 "GND" H 3705 1177 50  0000 C CNN
F 2 "" H 3700 1350 50  0001 C CNN
F 3 "" H 3700 1350 50  0001 C CNN
	1    3700 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1250 3700 1350
$Comp
L power:GND #PWR07
U 1 1 60D23804
P 2950 3750
F 0 "#PWR07" H 2950 3500 50  0001 C CNN
F 1 "GND" H 2955 3577 50  0000 C CNN
F 2 "" H 2950 3750 50  0001 C CNN
F 3 "" H 2950 3750 50  0001 C CNN
	1    2950 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3050 2800 3050
Wire Wire Line
	2800 3150 2950 3150
Connection ~ 2950 3150
Wire Wire Line
	2950 3150 2950 3050
Wire Wire Line
	2800 3250 2950 3250
Connection ~ 2950 3250
Wire Wire Line
	2950 3250 2950 3150
Wire Wire Line
	2800 3350 2950 3350
Connection ~ 2950 3350
Wire Wire Line
	2950 3350 2950 3250
$Comp
L power:GND #PWR06
U 1 1 60D27787
P 1600 3250
F 0 "#PWR06" H 1600 3000 50  0001 C CNN
F 1 "GND" H 1605 3077 50  0000 C CNN
F 2 "" H 1600 3250 50  0001 C CNN
F 3 "" H 1600 3250 50  0001 C CNN
	1    1600 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 3250 1600 3150
Wire Wire Line
	1600 3050 1700 3050
Connection ~ 1600 3150
Wire Wire Line
	1600 3150 1600 3050
$Comp
L Amplifier_Current:INA240A1PW INA1
U 1 1 60D2A652
P 5550 1650
F 0 "INA1" H 5650 1900 50  0000 L CNN
F 1 "INA240A1" H 5650 1800 50  0000 L CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 5550 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina240.pdf" H 5700 1800 50  0001 C CNN
	1    5550 1650
	1    0    0    -1  
$EndComp
Text Label 2800 2600 0    50   ~ 0
PH_A_CS
Text Label 2800 2700 0    50   ~ 0
PH_B_CS
Text Label 2800 2800 0    50   ~ 0
PH_C
Text Label 4950 2050 2    50   ~ 0
PH_A
Text Label 4950 1250 2    50   ~ 0
PH_A_CS
$Comp
L Device:R RCS1
U 1 1 60D33333
P 5000 1650
F 0 "RCS1" H 4750 1700 50  0000 L CNN
F 1 "10mOhm" H 4600 1600 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.40x3.35mm_HandSolder" V 4930 1650 50  0001 C CNN
F 3 "~" H 5000 1650 50  0001 C CNN
	1    5000 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 60D493BE
P 5450 2050
F 0 "#PWR010" H 5450 1800 50  0001 C CNN
F 1 "GND" H 5455 1877 50  0000 C CNN
F 2 "" H 5450 2050 50  0001 C CNN
F 3 "" H 5450 2050 50  0001 C CNN
	1    5450 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 60D496B6
P 5650 2050
F 0 "#PWR011" H 5650 1800 50  0001 C CNN
F 1 "GND" H 5655 1877 50  0000 C CNN
F 2 "" H 5650 2050 50  0001 C CNN
F 3 "" H 5650 2050 50  0001 C CNN
	1    5650 2050
	1    0    0    -1  
$EndComp
Text Label 5450 1200 0    50   ~ 0
INA_VCC
Text Label 5800 2000 0    50   ~ 0
INA_VCC
Text Label 6450 1350 0    50   ~ 0
INA_VCC
$Comp
L power:GND #PWR012
U 1 1 60D4B8A8
P 6450 1900
F 0 "#PWR012" H 6450 1650 50  0001 C CNN
F 1 "GND" H 6455 1727 50  0000 C CNN
F 2 "" H 6450 1900 50  0001 C CNN
F 3 "" H 6450 1900 50  0001 C CNN
	1    6450 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small CBY1
U 1 1 60D4BF85
P 6450 1650
F 0 "CBY1" H 6542 1696 50  0000 L CNN
F 1 "100nF" H 6542 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 6450 1650 50  0001 C CNN
F 3 "~" H 6450 1650 50  0001 C CNN
	1    6450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 1350 6450 1550
Wire Wire Line
	6450 1750 6450 1900
Wire Wire Line
	5450 1200 5450 1350
Wire Wire Line
	5450 1950 5450 2050
Wire Wire Line
	5650 1950 5650 2050
Wire Wire Line
	5550 1950 5550 2000
Wire Wire Line
	5550 2000 5800 2000
Wire Wire Line
	5150 1550 5250 1550
Wire Wire Line
	5150 1750 5250 1750
Wire Wire Line
	4950 1250 5000 1250
Wire Wire Line
	5000 2050 4950 2050
Text Label 7300 1250 2    50   ~ 0
PH_B
Text Label 7300 2050 2    50   ~ 0
PH_B_CS
$Comp
L Device:R RCS2
U 1 1 60D60A57
P 7350 1650
F 0 "RCS2" H 7050 1700 50  0000 L CNN
F 1 "10mOhm" H 6950 1600 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.40x3.35mm_HandSolder" V 7280 1650 50  0001 C CNN
F 3 "~" H 7350 1650 50  0001 C CNN
	1    7350 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 60D60A5D
P 7800 2050
F 0 "#PWR013" H 7800 1800 50  0001 C CNN
F 1 "GND" H 7805 1877 50  0000 C CNN
F 2 "" H 7800 2050 50  0001 C CNN
F 3 "" H 7800 2050 50  0001 C CNN
	1    7800 2050
	1    0    0    -1  
$EndComp
Text Label 7800 1200 0    50   ~ 0
INA_VCC
Wire Wire Line
	7800 1200 7800 1350
Wire Wire Line
	7800 1950 7800 2050
Wire Wire Line
	7500 1550 7600 1550
Wire Wire Line
	7500 1750 7600 1750
Wire Wire Line
	7300 1250 7350 1250
Wire Wire Line
	7350 2050 7300 2050
Text Label 5850 1650 0    50   ~ 0
C1_OUT
Text Label 8200 1650 0    50   ~ 0
C2_OUT
Wire Wire Line
	1700 3150 1600 3150
$Comp
L Device:R R2
U 1 1 60D7C974
P 1200 3150
F 0 "R2" H 1270 3196 50  0000 L CNN
F 1 "4.7k" H 1270 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 1130 3150 50  0001 C CNN
F 3 "~" H 1200 3150 50  0001 C CNN
F 4 "C17936" H 1200 3150 50  0001 C CNN "LCSC"
	1    1200 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 60D7DA2A
P 1200 3300
F 0 "#PWR05" H 1200 3050 50  0001 C CNN
F 1 "GND" H 1205 3127 50  0000 C CNN
F 2 "" H 1200 3300 50  0001 C CNN
F 3 "" H 1200 3300 50  0001 C CNN
	1    1200 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2650 1200 2650
Wire Wire Line
	1200 2650 1200 2750
Wire Wire Line
	1200 2750 1700 2750
Connection ~ 1200 2750
Wire Wire Line
	1200 2750 1200 2850
Wire Wire Line
	1200 2850 1700 2850
Connection ~ 1200 2850
Wire Wire Line
	1200 2850 1200 3000
Text Label 1050 2650 2    50   ~ 0
EN_PIN
Wire Wire Line
	1050 2650 1200 2650
Connection ~ 1200 2650
Text Label 1700 2200 2    50   ~ 0
IN1_PIN
Text Label 1700 2300 2    50   ~ 0
IN2_PIN
Text Label 1700 2400 2    50   ~ 0
IN3_PIN
$Comp
L Regulator_Linear:L7808 L1
U 1 1 60DA2032
P 5050 3200
F 0 "L1" H 5050 3442 50  0000 C CNN
F 1 "L78M08" H 5050 3351 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 5050 3400 50  0001 C CNN
F 3 "" H 5050 3400 50  0001 C CNN
	1    5050 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 60DA3160
P 5050 3600
F 0 "#PWR09" H 5050 3350 50  0001 C CNN
F 1 "GND" H 5055 3427 50  0000 C CNN
F 2 "" H 5050 3600 50  0001 C CNN
F 3 "" H 5050 3600 50  0001 C CNN
	1    5050 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 CAP2
U 1 1 60DA3B5F
P 5500 3450
F 0 "CAP2" H 5615 3496 50  0000 L CNN
F 1 "10uF" H 5615 3405 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_5x5.4" H 5500 3450 50  0001 C CNN
F 3 "~" H 5500 3450 50  0001 C CNN
F 4 "" H 5500 3450 50  0001 C CNN "LCSC"
	1    5500 3450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR08
U 1 1 60DA4DE1
P 4600 3100
F 0 "#PWR08" H 4600 2950 50  0001 C CNN
F 1 "VCC" H 4615 3273 50  0000 C CNN
F 2 "" H 4600 3100 50  0001 C CNN
F 3 "" H 4600 3100 50  0001 C CNN
	1    4600 3100
	1    0    0    -1  
$EndComp
Text Label 5650 3200 0    50   ~ 0
VIN
Wire Wire Line
	4600 3100 4600 3200
Wire Wire Line
	4600 3200 4750 3200
Wire Wire Line
	5050 3500 5050 3600
Wire Wire Line
	5050 3600 5500 3600
Connection ~ 5050 3600
Wire Wire Line
	5350 3200 5500 3200
Wire Wire Line
	5500 3200 5500 3300
Connection ~ 5500 3200
Wire Wire Line
	5500 3200 5650 3200
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 60DF6342
P 9250 850
F 0 "J1" H 9330 842 50  0000 L CNN
F 1 "Conn_01x02" H 9330 751 50  0000 L CNN
F 2 "digikey-footprints:Term_Block_1x2_P5mm" H 9250 850 50  0001 C CNN
F 3 "~" H 9250 850 50  0001 C CNN
	1    9250 850 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR015
U 1 1 60DF85FB
P 8900 800
F 0 "#PWR015" H 8900 650 50  0001 C CNN
F 1 "VCC" H 8915 973 50  0000 C CNN
F 2 "" H 8900 800 50  0001 C CNN
F 3 "" H 8900 800 50  0001 C CNN
	1    8900 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 60DF8B03
P 8900 1050
F 0 "#PWR016" H 8900 800 50  0001 C CNN
F 1 "GND" H 8905 877 50  0000 C CNN
F 2 "" H 8900 1050 50  0001 C CNN
F 3 "" H 8900 1050 50  0001 C CNN
	1    8900 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 800  8900 850 
Wire Wire Line
	8900 850  9050 850 
Wire Wire Line
	8900 1050 8900 950 
Wire Wire Line
	8900 950  9050 950 
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 60E026E9
P 10550 950
F 0 "J3" H 10630 992 50  0000 L CNN
F 1 "Conn_01x03" H 10630 901 50  0000 L CNN
F 2 "digikey-footprints:Term_Block_1x3_P5mm" H 10550 950 50  0001 C CNN
F 3 "~" H 10550 950 50  0001 C CNN
	1    10550 950 
	1    0    0    -1  
$EndComp
Text Label 10350 850  2    50   ~ 0
PH_A
Text Label 10350 950  2    50   ~ 0
PH_B
Text Label 10350 1050 2    50   ~ 0
PH_C
Text Label 9500 2650 2    50   ~ 0
EN_PIN
Text Label 9500 2750 2    50   ~ 0
IN1_PIN
Text Label 9500 2850 2    50   ~ 0
IN2_PIN
Text Label 9500 2950 2    50   ~ 0
IN3_PIN
Text Label 9500 3050 2    50   ~ 0
C1_OUT
Text Label 9500 3150 2    50   ~ 0
C2_OUT
Text Label 9500 2550 2    50   ~ 0
VIN
$Comp
L power:PWR_FLAG #FLG01
U 1 1 60E17029
P 9050 700
F 0 "#FLG01" H 9050 775 50  0001 C CNN
F 1 "PWR_FLAG" H 9050 873 50  0000 C CNN
F 2 "" H 9050 700 50  0001 C CNN
F 3 "~" H 9050 700 50  0001 C CNN
	1    9050 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 700  9050 850 
Connection ~ 9050 850 
$Comp
L power:PWR_FLAG #FLG02
U 1 1 60E19B30
P 9050 1200
F 0 "#FLG02" H 9050 1275 50  0001 C CNN
F 1 "PWR_FLAG" H 9050 1373 50  0000 C CNN
F 2 "" H 9050 1200 50  0001 C CNN
F 3 "~" H 9050 1200 50  0001 C CNN
	1    9050 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	9050 950  9050 1200
Connection ~ 9050 950 
$Comp
L Connector_Generic:Conn_01x10 J2
U 1 1 60E2063B
P 9700 2850
F 0 "J2" H 9780 2892 50  0000 L CNN
F 1 "Conn_01x10" H 9780 2801 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x10_P2.54mm_Vertical" H 9700 2850 50  0001 C CNN
F 3 "~" H 9700 2850 50  0001 C CNN
	1    9700 2850
	1    0    0    -1  
$EndComp
Text Label 8850 3250 2    50   ~ 0
INA_VCC
$Comp
L power:PWR_FLAG #FLG03
U 1 1 60E2EE57
P 9000 3250
F 0 "#FLG03" H 9000 3325 50  0001 C CNN
F 1 "PWR_FLAG" H 9000 3423 50  0000 C CNN
F 2 "" H 9000 3250 50  0001 C CNN
F 3 "~" H 9000 3250 50  0001 C CNN
	1    9000 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1500 5150 1500
Wire Wire Line
	5150 1500 5150 1550
Wire Wire Line
	5000 1800 5150 1800
Wire Wire Line
	5150 1800 5150 1750
Wire Wire Line
	5000 1800 5000 2050
Connection ~ 5000 1800
Wire Wire Line
	5000 1250 5000 1500
Connection ~ 5000 1500
Wire Wire Line
	7350 1500 7500 1500
Wire Wire Line
	7500 1500 7500 1550
Wire Wire Line
	7350 1800 7500 1800
Wire Wire Line
	7500 1800 7500 1750
Wire Wire Line
	7350 1250 7350 1500
Connection ~ 7350 1500
Wire Wire Line
	7350 1800 7350 2050
Connection ~ 7350 1800
Wire Wire Line
	2950 3350 2950 3450
Wire Wire Line
	2800 3450 2950 3450
Connection ~ 2950 3450
Wire Wire Line
	2950 3450 2950 3750
$Comp
L power:GND #PWR017
U 1 1 60D277A5
P 9000 3400
F 0 "#PWR017" H 9000 3150 50  0001 C CNN
F 1 "GND" H 9005 3227 50  0000 C CNN
F 2 "" H 9000 3400 50  0001 C CNN
F 3 "" H 9000 3400 50  0001 C CNN
	1    9000 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 3400 9000 3350
Wire Wire Line
	9000 3350 9500 3350
Wire Wire Line
	8850 3250 9000 3250
Connection ~ 9000 3250
Wire Wire Line
	9000 3250 9500 3250
$Comp
L Amplifier_Current:INA240A1PW INA2
U 1 1 60D60A4F
P 7900 1650
F 0 "INA2" H 8000 1900 50  0000 L CNN
F 1 "INA240A1" H 8000 1800 50  0000 L CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 7900 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina240.pdf" H 8050 1800 50  0001 C CNN
	1    7900 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2000 8150 2000
Text Label 8150 2000 0    50   ~ 0
INA_VCC
Wire Wire Line
	7900 1950 7900 2000
Wire Wire Line
	8000 1950 8000 2050
$Comp
L power:GND #PWR014
U 1 1 60DC1452
P 8000 2050
F 0 "#PWR014" H 8000 1800 50  0001 C CNN
F 1 "GND" H 8005 1877 50  0000 C CNN
F 2 "" H 8000 2050 50  0001 C CNN
F 3 "" H 8000 2050 50  0001 C CNN
	1    8000 2050
	1    0    0    -1  
$EndComp
Text Label 9500 2450 2    50   ~ 0
VIN
$EndSCHEMATC
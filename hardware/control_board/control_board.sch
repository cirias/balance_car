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
Wire Wire Line
	3450 2300 3450 2400
Text Label 3800 2800 2    39   ~ 0
P34
Text Label 3800 2900 2    39   ~ 0
P35
Text Label 3800 3000 2    39   ~ 0
P32
Text Label 3800 3100 2    39   ~ 0
P33
Text Label 3800 3200 2    39   ~ 0
P25
Text Label 3800 3300 2    39   ~ 0
P26
Text Label 3800 3400 2    39   ~ 0
P27
Text Label 3800 2400 2    39   ~ 0
VCC
Text Label 4850 2600 0    39   ~ 0
P22
Text Label 4850 2900 0    39   ~ 0
P21
Text Label 4850 3100 0    39   ~ 0
P19
Text Label 4850 3200 0    39   ~ 0
P18
Text Label 4850 3400 0    39   ~ 0
P17
Text Label 4850 3500 0    39   ~ 0
P16
Text Label 4850 2400 0    39   ~ 0
GND
Text Label 5500 3650 2    39   ~ 0
VCC
Text Label 5500 3750 2    39   ~ 0
GND
Text Label 5500 3850 2    39   ~ 0
A1
Text Label 5500 3950 2    39   ~ 0
A2
Text Label 5500 4050 2    39   ~ 0
B2
Text Label 5500 4150 2    39   ~ 0
B1
Text Label 5500 4250 2    39   ~ 0
GND
Text Label 6400 4150 0    39   ~ 0
P25
Text Label 6400 4250 0    39   ~ 0
GND
Text Label 5500 2450 2    39   ~ 0
VCC
Text Label 5500 2550 2    39   ~ 0
GND
Text Label 5550 1600 2    39   ~ 0
A2
Text Label 5550 1200 2    39   ~ 0
GND
Text Label 5550 1500 2    39   ~ 0
VCC
Text Label 5550 1100 2    39   ~ 0
A1
Text Label 6250 1600 0    39   ~ 0
B1
Text Label 6250 1200 0    39   ~ 0
GND
Text Label 6250 1500 0    39   ~ 0
VCC
Text Label 6250 1100 0    39   ~ 0
B2
$Comp
L power:+6V #PWR02
U 1 1 609612C8
P 3850 1200
F 0 "#PWR02" H 3850 1050 50  0001 C CNN
F 1 "+6V" H 3865 1373 50  0000 C CNN
F 2 "" H 3850 1200 50  0001 C CNN
F 3 "" H 3850 1200 50  0001 C CNN
	1    3850 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 60961629
P 3850 1300
F 0 "#PWR03" H 3850 1050 50  0001 C CNN
F 1 "GND" H 3855 1127 50  0000 C CNN
F 2 "" H 3850 1300 50  0001 C CNN
F 3 "" H 3850 1300 50  0001 C CNN
	1    3850 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 1300 4050 1300
Wire Wire Line
	3850 1200 4050 1200
$Comp
L power:PWR_FLAG #FLG01
U 1 1 60970945
P 4050 1050
F 0 "#FLG01" H 4050 1125 50  0001 C CNN
F 1 "PWR_FLAG" H 4050 1223 50  0000 C CNN
F 2 "" H 4050 1050 50  0001 C CNN
F 3 "~" H 4050 1050 50  0001 C CNN
	1    4050 1050
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 609716D9
P 4050 1450
F 0 "#FLG02" H 4050 1525 50  0001 C CNN
F 1 "PWR_FLAG" H 4050 1623 50  0000 C CNN
F 2 "" H 4050 1450 50  0001 C CNN
F 3 "~" H 4050 1450 50  0001 C CNN
	1    4050 1450
	1    0    0    1   
$EndComp
Wire Wire Line
	4050 1050 4050 1200
Connection ~ 4050 1200
Wire Wire Line
	4050 1200 4150 1200
Wire Wire Line
	4050 1300 4050 1450
Connection ~ 4050 1300
Wire Wire Line
	4050 1300 4150 1300
$Comp
L power:GND #PWR06
U 1 1 609A6B50
P 7200 1450
F 0 "#PWR06" H 7200 1200 50  0001 C CNN
F 1 "GND" H 7205 1277 50  0000 C CNN
F 2 "" H 7200 1450 50  0001 C CNN
F 3 "" H 7200 1450 50  0001 C CNN
	1    7200 1450
	1    0    0    -1  
$EndComp
Text Notes 5800 1300 0    39   ~ 0
C2
Text Notes 5800 1400 0    39   ~ 0
C1
Text Notes 6000 1400 2    39   ~ 0
C1
Text Notes 6000 1300 2    39   ~ 0
C2
$Comp
L power:+6V #PWR05
U 1 1 60A1C147
P 5400 3450
F 0 "#PWR05" H 5400 3300 50  0001 C CNN
F 1 "+6V" H 5415 3623 50  0000 C CNN
F 2 "" H 5400 3450 50  0001 C CNN
F 3 "" H 5400 3450 50  0001 C CNN
	1    5400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3450 5400 3550
Wire Wire Line
	5400 3550 5500 3550
$Comp
L power:+6V #PWR01
U 1 1 60A1D605
P 3300 4200
F 0 "#PWR01" H 3300 4050 50  0001 C CNN
F 1 "+6V" H 3315 4373 50  0000 C CNN
F 2 "" H 3300 4200 50  0001 C CNN
F 3 "" H 3300 4200 50  0001 C CNN
	1    3300 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4200 3800 4200
Text Notes 6600 1050 0    50   ~ 0
C1, C2 have pull up resistor built in
Text Notes 2500 2400 0    50   ~ 0
P34, P35 are input only
Text Label 5550 1300 2    39   ~ 0
P34
Text Label 5550 1400 2    39   ~ 0
P35
Text Label 6250 1300 0    39   ~ 0
P32
Text Label 6250 1400 0    39   ~ 0
P33
Text Label 5500 2650 2    39   ~ 0
P22
Text Label 5500 2750 2    39   ~ 0
P21
NoConn ~ 4850 2500
NoConn ~ 4850 2700
NoConn ~ 4850 2800
NoConn ~ 4850 3300
NoConn ~ 4850 3600
NoConn ~ 4850 3700
NoConn ~ 4850 3800
NoConn ~ 4850 3900
NoConn ~ 4850 4000
NoConn ~ 4850 4100
NoConn ~ 4850 4200
NoConn ~ 3800 2500
NoConn ~ 3800 2600
NoConn ~ 3800 2700
NoConn ~ 3800 3500
NoConn ~ 3800 3600
NoConn ~ 3800 3800
NoConn ~ 3800 3900
NoConn ~ 3800 4000
NoConn ~ 3800 4100
$Comp
L power:VCC #PWR04
U 1 1 608DBADC
P 3450 2300
F 0 "#PWR04" H 3450 2150 50  0001 C CNN
F 1 "VCC" H 3465 2473 50  0000 C CNN
F 2 "" H 3450 2300 50  0001 C CNN
F 3 "" H 3450 2300 50  0001 C CNN
	1    3450 2300
	1    0    0    -1  
$EndComp
NoConn ~ 5500 2850
NoConn ~ 5500 2950
NoConn ~ 5500 3050
NoConn ~ 5500 3150
Wire Wire Line
	3450 2400 3800 2400
Text Label 6400 4050 0    39   ~ 0
P26
Text Label 6400 3950 0    39   ~ 0
P27
Text Label 6400 3850 0    39   ~ 0
P16
Text Label 6400 3750 0    39   ~ 0
P17
Text Label 6400 3650 0    39   ~ 0
P18
Text Label 6400 3550 0    39   ~ 0
P19
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 609453FB
P 4350 1200
F 0 "J1" H 4430 1192 50  0000 L CNN
F 1 "POWER" H 4430 1101 50  0000 L CNN
F 2 "Connector_JST:JST_VH_B2PS-VH_1x02_P3.96mm_Horizontal" H 4350 1200 50  0001 C CNN
F 3 "~" H 4350 1200 50  0001 C CNN
	1    4350 1200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 60919C1B
P 5750 1400
F 0 "J2" H 5800 850 50  0000 R CNN
F 1 "MOTOR_A" H 5800 950 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B6B-XH-A_1x06_P2.50mm_Vertical" H 5750 1400 50  0001 C CNN
F 3 "~" H 5750 1400 50  0001 C CNN
	1    5750 1400
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J3
U 1 1 6091E7CB
P 6050 1400
F 0 "J3" H 6100 850 50  0000 R CNN
F 1 "MOTOR_B" H 6100 950 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B6B-XH-A_1x06_P2.50mm_Vertical" H 6050 1400 50  0001 C CNN
F 3 "~" H 6050 1400 50  0001 C CNN
	1    6050 1400
	-1   0    0    1   
$EndComp
$Comp
L control_board:GY521 U2
U 1 1 60AAD07D
P 5850 2800
F 0 "U2" H 6080 2842 39  0000 L CNN
F 1 "GY521" H 6080 2767 39  0000 L CNN
F 2 "control_board:GY521" H 5850 3300 39  0001 C CNN
F 3 "" H 5850 3300 39  0001 C CNN
	1    5850 2800
	1    0    0    -1  
$EndComp
$Comp
L control_board:TB6612FNG U3
U 1 1 60B35ACD
P 5950 3850
F 0 "U3" H 5950 4351 39  0000 C CNN
F 1 "TB6612FNG" H 5950 4276 39  0000 C CNN
F 2 "control_board:TB6612FNG" H 5950 4150 39  0001 C CNN
F 3 "" H 5950 4150 39  0001 C CNN
	1    5950 3850
	1    0    0    -1  
$EndComp
$Comp
L control_board:NodeMCU-32S U1
U 1 1 60AD438D
P 4300 3300
F 0 "U1" H 4325 4401 39  0000 C CNN
F 1 "NodeMCU-32S" H 4325 4326 39  0000 C CNN
F 2 "control_board:NodeMCU-32S_20Pins" H 4150 4350 39  0001 C CNN
F 3 "" H 4150 4350 39  0001 C CNN
	1    4300 3300
	1    0    0    -1  
$EndComp
Text Label 7200 1450 0    39   ~ 0
GND
Text Notes 7400 2700 0    39   ~ 0
1. USB port facing issue\n2. Widen NodeMCU 5V track width\n3. Pull down resistors
$EndSCHEMATC

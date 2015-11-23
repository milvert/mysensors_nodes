EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:nRF24L01+
LIBS:ArduProMiniTKB
LIBS:dht11
LIBS:temp_hum_sensor-cache
EELAYER 25 0
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
L nRF24L01+ U1
U 1 1 564E3265
P 3650 4700
F 0 "U1" H 3650 4400 50  0000 C CNN
F 1 "nRF24L01+" H 3650 5000 50  0000 C CNN
F 2 "MODULE" H 3650 4800 50  0001 C CNN
F 3 "DOCUMENTATION" H 3650 4650 50  0001 C CNN
	1    3650 4700
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 564E32F0
P 1950 4450
F 0 "C1" H 1975 4550 50  0000 L CNN
F 1 "4.7uF" H 1975 4350 50  0000 L CNN
F 2 "" H 1988 4300 30  0000 C CNN
F 3 "" H 1950 4450 60  0000 C CNN
	1    1950 4450
	1    0    0    -1  
$EndComp
$Comp
L DHT11 U3
U 1 1 564E3529
P 6600 2300
F 0 "U3" H 6600 2350 60  0000 C CNN
F 1 "DHT11" H 6600 2450 60  0000 C CNN
F 2 "" H 6600 2350 60  0000 C CNN
F 3 "" H 6600 2350 60  0000 C CNN
	1    6600 2300
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5650F46C
P 5100 3250
F 0 "C2" H 5125 3350 50  0000 L CNN
F 1 "0.1uF" H 5125 3150 50  0000 L CNN
F 2 "" H 5138 3100 30  0000 C CNN
F 3 "" H 5100 3250 60  0000 C CNN
	1    5100 3250
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5650F4EF
P 5500 3050
F 0 "R2" V 5400 3050 50  0000 C CNN
F 1 "1M" V 5500 3050 50  0000 C CNN
F 2 "" V 5430 3050 30  0000 C CNN
F 3 "" H 5500 3050 30  0000 C CNN
	1    5500 3050
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 5650F5E0
P 4950 3250
F 0 "R1" H 5030 3250 50  0000 C CNN
F 1 "470k" V 4950 3250 50  0000 C CNN
F 2 "" V 4880 3250 30  0000 C CNN
F 3 "" H 4950 3250 30  0000 C CNN
	1    4950 3250
	-1   0    0    1   
$EndComp
$Comp
L R R3
U 1 1 5650F639
P 5850 2550
F 0 "R3" V 5930 2550 50  0000 C CNN
F 1 "4.7k" V 5850 2550 50  0000 C CNN
F 2 "" V 5780 2550 30  0000 C CNN
F 3 "" H 5850 2550 30  0000 C CNN
	1    5850 2550
	0    1    1    0   
$EndComp
$Comp
L LTC3525 U2
U 1 1 5650F696
P 6050 1000
F 0 "U2" H 6050 1300 60  0000 C CNN
F 1 "LTC3525" H 6050 700 60  0000 C CNN
F 2 "" H 6050 1000 60  0000 C CNN
F 3 "" H 6050 1000 60  0000 C CNN
	1    6050 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4250 1950 4300
Connection ~ 1950 4250
Wire Wire Line
	4750 2650 4200 2650
Wire Wire Line
	6600 1150 6800 1150
Text GLabel 5300 1150 0    60   Input ~ 0
GND
Wire Wire Line
	6000 2550 6100 2550
Wire Wire Line
	5700 2550 5500 2550
Text GLabel 6800 1150 2    60   Input ~ 0
GND
Text GLabel 6800 1000 2    60   Input ~ 0
Vout
Wire Wire Line
	6600 1000 6800 1000
Text GLabel 5250 850  0    60   Input ~ 0
Vin
Wire Wire Line
	4200 3050 5350 3050
Connection ~ 4950 3050
Connection ~ 5100 3050
Wire Wire Line
	5800 3050 5650 3050
Text GLabel 5800 3050 2    60   Input ~ 0
Vin
Wire Wire Line
	5250 850  5500 850 
Text GLabel 5450 2400 0    60   Input ~ 0
Vout
Text GLabel 7350 2400 2    60   Input ~ 0
GND
Wire Wire Line
	7100 2400 7350 2400
Text GLabel 1550 4650 0    60   Input ~ 0
Vin
Text GLabel 1600 4250 0    60   Input ~ 0
GND
Text GLabel 4750 2650 2    60   Input ~ 0
Vout
Connection ~ 5500 2400
Wire Wire Line
	6100 2550 6100 2950
Wire Wire Line
	6100 2950 4200 2950
Text GLabel 5300 3450 2    60   Input ~ 0
GND
Wire Wire Line
	4950 3450 5300 3450
Connection ~ 5100 3450
$Comp
L GND #PWR01
U 1 1 5651F46C
P 1450 1350
F 0 "#PWR01" H 1450 1100 50  0001 C CNN
F 1 "GND" H 1450 1200 50  0000 C CNN
F 2 "" H 1450 1350 60  0000 C CNN
F 3 "" H 1450 1350 60  0000 C CNN
	1    1450 1350
	0    1    1    0   
$EndComp
Text GLabel 1700 1350 2    60   Input ~ 0
GND
Wire Wire Line
	1700 1350 1450 1350
$Comp
L +BATT #PWR02
U 1 1 5651F68F
P 1450 1050
F 0 "#PWR02" H 1450 900 50  0001 C CNN
F 1 "+BATT" H 1450 1190 50  0000 C CNN
F 2 "" H 1450 1050 60  0000 C CNN
F 3 "" H 1450 1050 60  0000 C CNN
	1    1450 1050
	0    -1   -1   0   
$EndComp
Text GLabel 1700 1050 2    60   Input ~ 0
Vin
Wire Wire Line
	1700 1050 1450 1050
Wire Wire Line
	4950 3100 4950 3050
Wire Wire Line
	4950 3450 4950 3400
Wire Wire Line
	5100 3450 5100 3400
Wire Wire Line
	5100 3100 5100 3050
Wire Wire Line
	1950 4650 1950 4600
Connection ~ 1950 4650
Wire Wire Line
	2900 4500 2350 4500
Wire Wire Line
	2350 4500 2350 4250
Wire Wire Line
	2350 4250 1600 4250
Wire Wire Line
	1550 4800 2900 4800
Text GLabel 1550 4800 0    60   Input ~ 0
D9
Text GLabel 1550 4950 0    60   Input ~ 0
D10
Wire Wire Line
	1550 4950 2900 4950
Text GLabel 5100 4500 2    60   Input ~ 0
D13
Text GLabel 5100 4650 2    60   Input ~ 0
D11
Text GLabel 5100 4800 2    60   Input ~ 0
D12
Text GLabel 5100 4950 2    60   Input ~ 0
D2
Wire Wire Line
	4400 4500 5100 4500
Wire Wire Line
	4400 4650 5100 4650
Wire Wire Line
	4400 4800 5100 4800
Wire Wire Line
	5100 4950 4400 4950
Text GLabel 4550 3150 2    60   Input ~ 0
D13
Text GLabel 4550 3250 2    60   Input ~ 0
D12
Text GLabel 4550 3350 2    60   Input ~ 0
D11
Text GLabel 4550 3450 2    60   Input ~ 0
D10
Text GLabel 2550 3450 0    60   Input ~ 0
D9
Text GLabel 2550 2750 0    60   Input ~ 0
D2
Wire Wire Line
	3000 2750 2550 2750
Wire Wire Line
	3000 3450 2550 3450
Wire Wire Line
	4200 3450 4550 3450
Wire Wire Line
	4550 3350 4200 3350
Wire Wire Line
	4200 3250 4550 3250
Wire Wire Line
	4550 3150 4200 3150
Wire Wire Line
	5300 1150 5500 1150
Wire Wire Line
	5500 2550 5500 2400
Wire Wire Line
	1550 4650 2900 4650
Wire Wire Line
	6100 2400 5450 2400
$Comp
L ARDUPROMINI-6 uP?
U 1 1 5652A4EF
P 4200 1250
F 0 "uP?" H 4000 1150 60  0000 C CNN
F 1 "ARDUPROMINI-6" H 4200 1250 60  0000 C CNN
F 2 "" H 4200 1250 60  0000 C CNN
F 3 "" H 4200 1250 60  0000 C CNN
	1    4200 1250
	1    0    0    -1  
$EndComp
$EndSCHEMATC

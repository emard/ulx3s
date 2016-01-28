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
LIBS:ESP8266
LIBS:lfe5bg381
LIBS:micro-hdmi-d
LIBS:ulx3s-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "ULX3S"
Date ""
Rev "0.0.1"
Comp "FER+RIZ+RADIONA"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND #PWR1
U 1 1 56ABA99F
P 1100 2650
F 0 "#PWR1" H 1100 2400 50  0001 C CNN
F 1 "GND" H 1100 2500 50  0000 C CNN
F 2 "" H 1100 2650 60  0000 C CNN
F 3 "" H 1100 2650 60  0000 C CNN
	1    1100 2650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR2
U 1 1 56ABAA88
P 2250 950
F 0 "#PWR2" H 2250 800 50  0001 C CNN
F 1 "VCC" H 2250 1100 50  0000 C CNN
F 2 "" H 2250 950 60  0000 C CNN
F 3 "" H 2250 950 60  0000 C CNN
	1    2250 950 
	1    0    0    -1  
$EndComp
$Comp
L ESP-12E U2
U 1 1 56AC980A
P 3700 4550
F 0 "U2" H 3700 4450 50  0000 C CNN
F 1 "ESP-12E" H 3700 4650 50  0000 C CNN
F 2 "ESP8266:ESP-12E" H 3700 4550 50  0001 C CNN
F 3 "" H 3700 4550 50  0001 C CNN
	1    3700 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  2450 900  2550
Wire Wire Line
	900  2550 10850 2550
Wire Wire Line
	1400 2550 1400 2450
Wire Wire Line
	1300 2450 1300 2550
Connection ~ 1300 2550
Wire Wire Line
	1200 2450 1200 2550
Connection ~ 1200 2550
Wire Wire Line
	1100 2450 1100 2650
Connection ~ 1100 2550
Wire Wire Line
	1000 2450 1000 2550
Connection ~ 1000 2550
Wire Wire Line
	2050 1000 2050 1100
Wire Wire Line
	2050 1000 7150 1000
Wire Wire Line
	2550 1000 2550 1100
Wire Wire Line
	2150 1000 2150 1100
Connection ~ 2150 1000
Wire Wire Line
	2250 950  2250 1100
Connection ~ 2250 1000
Wire Wire Line
	2350 1000 2350 1100
Connection ~ 2350 1000
Wire Wire Line
	2450 1000 2450 1100
Connection ~ 2450 1000
Wire Wire Line
	10850 2550 10850 2450
Connection ~ 1400 2550
Wire Wire Line
	1500 2450 1500 2550
Connection ~ 1500 2550
Wire Wire Line
	1600 2450 1600 2550
Connection ~ 1600 2550
Wire Wire Line
	1700 2450 1700 2550
Connection ~ 1700 2550
Wire Wire Line
	1800 2450 1800 2550
Connection ~ 1800 2550
Wire Wire Line
	2050 2450 2050 2550
Connection ~ 2050 2550
Wire Wire Line
	2150 2450 2150 2550
Connection ~ 2150 2550
Wire Wire Line
	2250 2450 2250 2550
Connection ~ 2250 2550
Wire Wire Line
	2350 2450 2350 2550
Connection ~ 2350 2550
Wire Wire Line
	2450 2450 2450 2550
Connection ~ 2450 2550
Wire Wire Line
	2550 2450 2550 2550
Connection ~ 2550 2550
Wire Wire Line
	2650 2450 2650 2550
Connection ~ 2650 2550
Wire Wire Line
	2750 2450 2750 2550
Connection ~ 2750 2550
Wire Wire Line
	2850 2450 2850 2550
Connection ~ 2850 2550
Wire Wire Line
	2950 2450 2950 2550
Connection ~ 2950 2550
Wire Wire Line
	3050 2450 3050 2550
Connection ~ 3050 2550
Wire Wire Line
	3150 2450 3150 2550
Connection ~ 3150 2550
Wire Wire Line
	3250 2450 3250 2550
Connection ~ 3250 2550
Wire Wire Line
	3350 2450 3350 2550
Connection ~ 3350 2550
Wire Wire Line
	3450 2450 3450 2550
Connection ~ 3450 2550
Wire Wire Line
	3550 2450 3550 2550
Connection ~ 3550 2550
Wire Wire Line
	3650 2450 3650 2550
Connection ~ 3650 2550
Wire Wire Line
	3750 2450 3750 2550
Connection ~ 3750 2550
Wire Wire Line
	3850 2450 3850 2550
Connection ~ 3850 2550
Wire Wire Line
	3950 2450 3950 2550
Connection ~ 3950 2550
Wire Wire Line
	4050 2450 4050 2550
Connection ~ 4050 2550
Wire Wire Line
	4150 2450 4150 2550
Connection ~ 4150 2550
Wire Wire Line
	4250 2450 4250 2550
Connection ~ 4250 2550
Wire Wire Line
	4350 2450 4350 2550
Connection ~ 4350 2550
Wire Wire Line
	4450 2450 4450 2550
Connection ~ 4450 2550
Wire Wire Line
	4550 2450 4550 2550
Connection ~ 4550 2550
Wire Wire Line
	4650 2450 4650 2550
Connection ~ 4650 2550
Wire Wire Line
	4750 2450 4750 2550
Connection ~ 4750 2550
Wire Wire Line
	4850 2450 4850 2550
Connection ~ 4850 2550
Wire Wire Line
	4950 2450 4950 2550
Connection ~ 4950 2550
Wire Wire Line
	5050 2450 5050 2550
Connection ~ 5050 2550
Wire Wire Line
	5150 2450 5150 2550
Connection ~ 5150 2550
Wire Wire Line
	5250 2450 5250 2550
Connection ~ 5250 2550
Wire Wire Line
	5350 2450 5350 2550
Connection ~ 5350 2550
Wire Wire Line
	5450 2450 5450 2550
Connection ~ 5450 2550
Wire Wire Line
	5550 2450 5550 2550
Connection ~ 5550 2550
Wire Wire Line
	5650 2450 5650 2550
Connection ~ 5650 2550
Wire Wire Line
	5750 2450 5750 2550
Connection ~ 5750 2550
Wire Wire Line
	5850 2450 5850 2550
Connection ~ 5850 2550
Wire Wire Line
	5950 2450 5950 2550
Connection ~ 5950 2550
Wire Wire Line
	6050 2450 6050 2550
Connection ~ 6050 2550
Wire Wire Line
	6150 2450 6150 2550
Connection ~ 6150 2550
Wire Wire Line
	6250 2450 6250 2550
Connection ~ 6250 2550
Wire Wire Line
	6350 2450 6350 2550
Connection ~ 6350 2550
Wire Wire Line
	6450 2450 6450 2550
Connection ~ 6450 2550
Wire Wire Line
	6550 2450 6550 2550
Connection ~ 6550 2550
Wire Wire Line
	6650 2450 6650 2550
Connection ~ 6650 2550
Wire Wire Line
	6750 2450 6750 2550
Connection ~ 6750 2550
Wire Wire Line
	6850 2450 6850 2550
Connection ~ 6850 2550
Wire Wire Line
	6950 2450 6950 2550
Connection ~ 6950 2550
Wire Wire Line
	7050 2450 7050 2550
Connection ~ 7050 2550
Wire Wire Line
	7150 2450 7150 2550
Connection ~ 7150 2550
Wire Wire Line
	7250 2450 7250 2550
Connection ~ 7250 2550
Wire Wire Line
	7350 2450 7350 2550
Connection ~ 7350 2550
Wire Wire Line
	7450 2450 7450 2550
Connection ~ 7450 2550
Wire Wire Line
	7550 2450 7550 2550
Connection ~ 7550 2550
Wire Wire Line
	7650 2450 7650 2550
Connection ~ 7650 2550
Wire Wire Line
	7750 2450 7750 2550
Connection ~ 7750 2550
Wire Wire Line
	7850 2450 7850 2550
Connection ~ 7850 2550
Wire Wire Line
	7950 2450 7950 2550
Connection ~ 7950 2550
Wire Wire Line
	8050 2450 8050 2550
Connection ~ 8050 2550
Wire Wire Line
	8150 2450 8150 2550
Connection ~ 8150 2550
Wire Wire Line
	8250 2450 8250 2550
Connection ~ 8250 2550
Wire Wire Line
	8350 2450 8350 2550
Connection ~ 8350 2550
Wire Wire Line
	8450 2450 8450 2550
Connection ~ 8450 2550
Wire Wire Line
	8550 2450 8550 2550
Connection ~ 8550 2550
Wire Wire Line
	8650 2450 8650 2550
Connection ~ 8650 2550
Wire Wire Line
	8750 2450 8750 2550
Connection ~ 8750 2550
Wire Wire Line
	8850 2450 8850 2550
Connection ~ 8850 2550
Wire Wire Line
	8950 2450 8950 2550
Connection ~ 8950 2550
Wire Wire Line
	9050 2450 9050 2550
Connection ~ 9050 2550
Wire Wire Line
	9150 2450 9150 2550
Connection ~ 9150 2550
Wire Wire Line
	9250 2450 9250 2550
Connection ~ 9250 2550
Wire Wire Line
	9350 2450 9350 2550
Connection ~ 9350 2550
Wire Wire Line
	9450 2450 9450 2550
Connection ~ 9450 2550
Wire Wire Line
	9550 2450 9550 2550
Connection ~ 9550 2550
Wire Wire Line
	9650 2450 9650 2550
Connection ~ 9650 2550
Wire Wire Line
	9750 2450 9750 2550
Connection ~ 9750 2550
Wire Wire Line
	9850 2450 9850 2550
Connection ~ 9850 2550
Wire Wire Line
	9950 2450 9950 2550
Connection ~ 9950 2550
Wire Wire Line
	10050 2450 10050 2550
Connection ~ 10050 2550
Wire Wire Line
	10150 2450 10150 2550
Connection ~ 10150 2550
Wire Wire Line
	10250 2450 10250 2550
Connection ~ 10250 2550
Wire Wire Line
	10350 2450 10350 2550
Connection ~ 10350 2550
Wire Wire Line
	10450 2450 10450 2550
Connection ~ 10450 2550
Wire Wire Line
	10550 2450 10550 2550
Connection ~ 10550 2550
Wire Wire Line
	10650 2450 10650 2550
Connection ~ 10650 2550
Wire Wire Line
	10750 2450 10750 2550
Connection ~ 10750 2550
Wire Wire Line
	7150 1000 7150 1100
Connection ~ 2550 1000
Wire Wire Line
	7050 1100 7050 1000
Connection ~ 7050 1000
Wire Wire Line
	6950 1100 6950 1000
Connection ~ 6950 1000
Wire Wire Line
	6750 1100 6750 1000
Connection ~ 6750 1000
Wire Wire Line
	6650 1100 6650 1000
Connection ~ 6650 1000
Wire Wire Line
	6550 1100 6550 1000
Connection ~ 6550 1000
Wire Wire Line
	6350 1100 6350 1000
Connection ~ 6350 1000
Wire Wire Line
	6250 1100 6250 1000
Connection ~ 6250 1000
Wire Wire Line
	5850 1100 5850 1000
Connection ~ 5850 1000
Wire Wire Line
	5750 1100 5750 1000
Connection ~ 5750 1000
Wire Wire Line
	5650 1100 5650 1000
Connection ~ 5650 1000
Wire Wire Line
	5450 1100 5450 1000
Connection ~ 5450 1000
Wire Wire Line
	5350 1100 5350 1000
Connection ~ 5350 1000
Wire Wire Line
	5250 1100 5250 1000
Connection ~ 5250 1000
Wire Wire Line
	5050 1100 5050 1000
Connection ~ 5050 1000
Wire Wire Line
	4950 1100 4950 1000
Connection ~ 4950 1000
Wire Wire Line
	4750 1100 4750 1000
Connection ~ 4750 1000
Wire Wire Line
	4650 1100 4650 1000
Connection ~ 4650 1000
Wire Wire Line
	4450 1100 4450 1000
Connection ~ 4450 1000
Wire Wire Line
	4350 1100 4350 1000
Connection ~ 4350 1000
Wire Wire Line
	4250 1100 4250 1000
Connection ~ 4250 1000
Wire Wire Line
	4150 1100 4150 1000
Connection ~ 4150 1000
Wire Wire Line
	3950 1100 3950 1000
Connection ~ 3950 1000
Wire Wire Line
	3850 1100 3850 1000
Connection ~ 3850 1000
Wire Wire Line
	3750 1100 3750 1000
Connection ~ 3750 1000
Wire Wire Line
	3650 1100 3650 1000
Connection ~ 3650 1000
Wire Wire Line
	3550 1100 3550 1000
Connection ~ 3550 1000
Wire Wire Line
	3450 1100 3450 1000
Connection ~ 3450 1000
Wire Wire Line
	3350 1100 3350 1000
Connection ~ 3350 1000
Wire Wire Line
	3250 1100 3250 1000
Connection ~ 3250 1000
Wire Wire Line
	3150 1100 3150 1000
Connection ~ 3150 1000
Wire Wire Line
	3050 1100 3050 1000
Connection ~ 3050 1000
Wire Wire Line
	2950 1100 2950 1000
Connection ~ 2950 1000
Wire Wire Line
	2850 1100 2850 1000
Connection ~ 2850 1000
Wire Wire Line
	2750 1100 2750 1000
Connection ~ 2750 1000
Wire Wire Line
	2650 1100 2650 1000
Connection ~ 2650 1000
Wire Wire Line
	2800 4650 2400 4650
Text Label 2450 4650 0    60   ~ 0
TDO
Wire Wire Line
	2800 4550 2400 4550
Text Label 2450 4550 0    60   ~ 0
TDI
Wire Wire Line
	2400 4750 2800 4750
Text Label 2450 4750 0    60   ~ 0
TCK
Wire Wire Line
	2400 4850 2800 4850
Text Label 2450 4850 0    60   ~ 0
TMS
Wire Wire Line
	4600 4950 4700 4950
$Comp
L GND #PWR3
U 1 1 56ACA1D2
P 4700 4950
F 0 "#PWR3" H 4700 4700 50  0001 C CNN
F 1 "GND" H 4700 4800 50  0000 C CNN
F 2 "" H 4700 4950 60  0000 C CNN
F 3 "" H 4700 4950 60  0000 C CNN
	1    4700 4950
	0    -1   -1   0   
$EndComp
$Comp
L SD_Card SD1
U 1 1 56ACBF19
P 2300 6600
F 0 "SD1" H 1650 7150 50  0000 C CNN
F 1 "SD_Card" H 2900 6050 50  0000 C CNN
F 2 "micro-sd:MicroSD_TF02D" H 2500 6950 50  0000 C CNN
F 3 "" H 2300 6600 60  0000 C CNN
	1    2300 6600
	1    0    0    -1  
$EndComp
$Comp
L USB_OTG P1
U 1 1 56ACC213
P 5200 6350
F 0 "P1" H 5525 6225 50  0000 C CNN
F 1 "USB_FTDI" H 5200 6550 50  0000 C CNN
F 2 "Connect:USB_Micro-B" V 5150 6250 60  0001 C CNN
F 3 "" V 5150 6250 60  0000 C CNN
	1    5200 6350
	0    -1   1    0   
$EndComp
$Comp
L USB_OTG P2
U 1 1 56ACC38E
P 5200 7300
F 0 "P2" H 5525 7175 50  0000 C CNN
F 1 "USB_FPGA" H 5200 7500 50  0000 C CNN
F 2 "Connect:USB_Micro-B" V 5150 7200 60  0001 C CNN
F 3 "" V 5150 7200 60  0000 C CNN
	1    5200 7300
	0    -1   1    0   
$EndComp
$Comp
L MICRO-HDMI-D HDMI1
U 1 1 56ACD5D4
P 6150 4650
F 0 "HDMI1" H 6150 5700 50  0000 C CNN
F 1 "MICRO-HDMI-D" V 6250 4650 50  0000 C CNN
F 2 "micro-hdmi-d:MICRO-HDMI-D" H 6150 4650 60  0001 C CNN
F 3 "" H 6150 4650 60  0000 C CNN
	1    6150 4650
	-1   0    0    -1  
$EndComp
$Comp
L JACK_TRS_6PINS J2
U 1 1 56A9D95B
P 1050 3700
F 0 "J2" H 1050 4100 50  0000 C CNN
F 1 "JACK_TRS_6PINS" H 1000 3400 50  0000 C CNN
F 2 "" H 1150 3550 60  0001 C CNN
F 3 "" H 1150 3550 60  0000 C CNN
	1    1050 3700
	1    0    0    -1  
$EndComp
$Comp
L D_Schottky_Small D3
U 1 1 56AA1324
P 5950 6150
F 0 "D3" H 5900 6230 50  0000 L CNN
F 1 "2A" H 5900 6050 50  0000 L CNN
F 2 "SMD_Packages:SMD-1206_Pol" V 5950 6150 60  0001 C CNN
F 3 "" V 5950 6150 60  0000 C CNN
	1    5950 6150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5500 6150 5850 6150
Wire Wire Line
	6050 6150 6200 6150
$Comp
L +5V #PWR5
U 1 1 56AA16D2
P 6200 6150
F 0 "#PWR5" H 6200 6000 50  0001 C CNN
F 1 "+5V" H 6200 6290 50  0000 C CNN
F 2 "" H 6200 6150 60  0000 C CNN
F 3 "" H 6200 6150 60  0000 C CNN
	1    6200 6150
	0    1    1    0   
$EndComp
Text Label 5550 6150 0    60   ~ 0
USB5V
Wire Wire Line
	5800 7100 5950 7100
$Comp
L D_Schottky_Small D4
U 1 1 56AA2821
P 5700 7100
F 0 "D4" H 5650 7180 50  0000 L CNN
F 1 "2A" H 5650 7000 50  0000 L CNN
F 2 "SMD_Packages:SMD-1206_Pol" V 5700 7100 60  0001 C CNN
F 3 "" V 5700 7100 60  0000 C CNN
	1    5700 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 7100 5600 7100
$Comp
L +5V #PWR4
U 1 1 56AA305B
P 5950 7100
F 0 "#PWR4" H 5950 6950 50  0001 C CNN
F 1 "+5V" H 5950 7240 50  0000 C CNN
F 2 "" H 5950 7100 60  0000 C CNN
F 3 "" H 5950 7100 60  0000 C CNN
	1    5950 7100
	0    1    1    0   
$EndComp
$Comp
L LFE5-BG381 U1
U 9 1 56AA9804
P 5900 1750
F 0 "U1" H 5900 1850 60  0000 C CNN
F 1 "LFE5-BG381" H 5900 1750 60  0000 C CNN
F 2 "lfe5bg381:BGA-381_pitch0.8mm_dia0.4mm" H 4850 2700 60  0001 C CNN
F 3 "" H 4850 2700 60  0000 C CNN
	9    5900 1750
	1    0    0    -1  
$EndComp
$Comp
L LFE5-BG381 U1
U 10 1 56AAA6F3
P 1700 4700
F 0 "U1" H 1700 4800 60  0000 C CNN
F 1 "LFE5-BG381" H 1700 4700 60  0000 C CNN
F 2 "lfe5bg381:BGA-381_pitch0.8mm_dia0.4mm" H 650 5650 60  0001 C CNN
F 3 "" H 650 5650 60  0000 C CNN
	10   1700 4700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3450 5450 3450 5700
Text Label 3450 5650 1    60   ~ 0
MTDO
Wire Wire Line
	3550 5450 3550 5700
Wire Wire Line
	3650 5450 3650 5700
Wire Wire Line
	3750 5450 3750 5700
Wire Wire Line
	3850 5450 3850 5700
Wire Wire Line
	3950 5450 3950 5700
Text Label 3550 5650 1    60   ~ 0
MTDI
Text Label 3650 5650 1    60   ~ 0
SD_3
Text Label 3750 5650 1    60   ~ 0
MTMS
Text Label 3850 5650 1    60   ~ 0
MTCK
Text Label 3950 5650 1    60   ~ 0
SD_2
Wire Wire Line
	1400 6200 1050 6200
Text Label 1100 6200 0    60   ~ 0
SD_2
Wire Wire Line
	1050 6300 1400 6300
Text Label 1100 6300 0    60   ~ 0
SD_3
Wire Wire Line
	1050 6400 1400 6400
Text Label 1100 6400 0    60   ~ 0
MTMS
Wire Wire Line
	1400 6700 1050 6700
Text Label 1100 6700 0    60   ~ 0
MTCK
Wire Wire Line
	1050 6900 1400 6900
Text Label 1100 6900 0    60   ~ 0
MTDO
Wire Wire Line
	1050 7000 1400 7000
Text Label 1100 7000 0    60   ~ 0
MTDI
$Sheet
S 6800 4650 800  600 
U 56AC389C
F0 "gpio" 60
F1 "gpio.sch" 60
$EndSheet
$EndSCHEMATC

EESchema Schematic File Version 2
LIBS:ulx3s-rescue
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
LIBS:ap3429a
LIBS:ft2232
LIBS:ulx3s-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 9
Title "ULX3S"
Date ""
Rev "0.0.1"
Comp "FER+RIZ+RADIONA"
Comment1 "Root sheet"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SD_Card SD1
U 1 1 56ACBF19
P 3300 6250
F 0 "SD1" H 2650 6800 50  0000 C CNN
F 1 "SD_Card" H 3900 5700 50  0000 C CNN
F 2 "micro-sd:MicroSD_TF02D" H 3500 6600 50  0000 C CNN
F 3 "" H 3300 6250 60  0000 C CNN
	1    3300 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 5850 2300 5850
Wire Wire Line
	2300 5950 2400 5950
Wire Wire Line
	2300 6050 2400 6050
Wire Wire Line
	2400 6350 2300 6350
Wire Wire Line
	2300 6550 2400 6550
Wire Wire Line
	2300 6650 2400 6650
$Sheet
S 7000 5900 750  450 
U 56AC389C
F0 "gpio" 60
F1 "gpio.sch" 60
$EndSheet
$Sheet
S 7000 5250 750  450 
U 58D51CAD
F0 "power" 60
F1 "power.sch" 60
$EndSheet
Wire Wire Line
	1850 6150 2400 6150
Wire Wire Line
	1700 6250 2400 6250
Wire Wire Line
	1850 6450 2400 6450
$Comp
L GND #PWR01
U 1 1 58D58197
P 1850 6150
F 0 "#PWR01" H 1850 5900 50  0001 C CNN
F 1 "GND" H 1850 6000 50  0000 C CNN
F 2 "" H 1850 6150 50  0000 C CNN
F 3 "" H 1850 6150 50  0000 C CNN
	1    1850 6150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR02
U 1 1 58D581BF
P 1850 6450
F 0 "#PWR02" H 1850 6200 50  0001 C CNN
F 1 "GND" H 1850 6300 50  0000 C CNN
F 2 "" H 1850 6450 50  0000 C CNN
F 3 "" H 1850 6450 50  0000 C CNN
	1    1850 6450
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 6050 4600 6050
Text Label 4250 6050 0    60   ~ 0
SD_CD
Wire Wire Line
	4200 6150 4600 6150
Text Label 4250 6150 0    60   ~ 0
SD_WP
$Comp
L GND #PWR03
U 1 1 58D58733
P 4300 6550
F 0 "#PWR03" H 4300 6300 50  0001 C CNN
F 1 "GND" H 4300 6400 50  0000 C CNN
F 2 "" H 4300 6550 50  0000 C CNN
F 3 "" H 4300 6550 50  0000 C CNN
	1    4300 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 6350 4300 6350
Wire Wire Line
	4300 6350 4300 6550
Wire Wire Line
	4200 6450 4300 6450
Connection ~ 4300 6450
$Comp
L +3V3 #PWR04
U 1 1 58D5F123
P 1700 6250
F 0 "#PWR04" H 1700 6100 50  0001 C CNN
F 1 "+3V3" H 1700 6390 50  0000 C CNN
F 2 "" H 1700 6250 50  0000 C CNN
F 3 "" H 1700 6250 50  0000 C CNN
	1    1700 6250
	0    -1   -1   0   
$EndComp
$Sheet
S 8700 5250 750  450 
U 58D6547C
F0 "blinkey" 60
F1 "blinkey.sch" 60
$EndSheet
Text Notes 7000 5100 0    60   ~ 0
click on mouse pointer arrow on top of right toolbar\nand double-click on sheet to open
$Sheet
S 7850 5900 750  450 
U 58D686D9
F0 "gpdi" 60
F1 "gpdi.sch" 60
$EndSheet
$Sheet
S 7850 5250 750  450 
U 58D6BF46
F0 "usb" 60
F1 "usb.sch" 60
$EndSheet
$Sheet
S 9550 5900 750  450 
U 58D6D447
F0 "wifi" 60
F1 "wifi.sch" 60
$EndSheet
$Sheet
S 9550 5250 750  450 
U 58D6D507
F0 "ram" 60
F1 "ram.sch" 60
$EndSheet
Text GLabel 2300 5850 0    60   Input ~ 0
SD_2
Text GLabel 2300 5950 0    60   Input ~ 0
SD_3
Text GLabel 2300 6050 0    60   Input ~ 0
SD_MTMS
Text GLabel 2300 6350 0    60   Input ~ 0
SD_MTCK
Text GLabel 2300 6550 0    60   Input ~ 0
SD_MTDO
Text GLabel 2300 6650 0    60   Input ~ 0
SD_MTDI
Text GLabel 4600 6050 2    60   Input ~ 0
SD_CD
Text GLabel 4600 6150 2    60   Input ~ 0
SD_WP
$Sheet
S 8700 5900 750  450 
U 58D82BD0
F0 "analog" 60
F1 "analog.sch" 60
$EndSheet
$EndSCHEMATC

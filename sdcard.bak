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
LIBS:ESP32
LIBS:ssd_13xx
LIBS:ftdi
LIBS:max1112x
LIBS:ulx3s-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 11
Title "ULX3S"
Date ""
Rev "0.0.1"
Comp "FER+RIZ+RADIONA"
Comment1 "SD card"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND #PWR0116
U 1 1 58DA7C6F
P 3550 3650
F 0 "#PWR0116" H 3550 3400 50  0001 C CNN
F 1 "GND" H 3550 3500 50  0000 C CNN
F 2 "" H 3550 3650 50  0000 C CNN
F 3 "" H 3550 3650 50  0000 C CNN
	1    3550 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0117
U 1 1 58DA7C71
P 5800 3950
F 0 "#PWR0117" H 5800 3700 50  0001 C CNN
F 1 "GND" H 5800 3800 50  0000 C CNN
F 2 "" H 5800 3950 50  0000 C CNN
F 3 "" H 5800 3950 50  0000 C CNN
	1    5800 3950
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR0118
U 1 1 58DA7C72
P 3150 2950
F 0 "#PWR0118" H 3150 2800 50  0001 C CNN
F 1 "+3V3" H 3150 3090 50  0000 C CNN
F 2 "" H 3150 2950 50  0000 C CNN
F 3 "" H 3150 2950 50  0000 C CNN
	1    3150 2950
	1    0    0    -1  
$EndComp
Text GLabel 4050 3000 0    60   Input ~ 0
SD_D2
Text GLabel 4050 3100 0    60   Input ~ 0
SD_D3
Text GLabel 4050 3200 0    60   Input ~ 0
SD_CMD
Text GLabel 4050 3400 0    60   Input ~ 0
SD_CLK
Text GLabel 4050 3600 0    60   Input ~ 0
SD_D0
Text GLabel 4050 3700 0    60   Input ~ 0
SD_D1
Text Notes 4150 4450 0    60   ~ 0
minimum pins for compatible mode\nSD_CLK, SD_CMD, SD_D0, SD_D3
$Comp
L R R38
U 1 1 590C5D62
P 3150 3100
F 0 "R38" V 3230 3100 50  0000 C CNN
F 1 "0.47" V 3150 3100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3080 3100 50  0001 C CNN
F 3 "" H 3150 3100 50  0000 C CNN
	1    3150 3100
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR0119
U 1 1 590C5E90
P 3150 3650
F 0 "#PWR0119" H 3150 3400 50  0001 C CNN
F 1 "GND" H 3150 3500 50  0000 C CNN
F 2 "" H 3150 3650 50  0000 C CNN
F 3 "" H 3150 3650 50  0000 C CNN
	1    3150 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3250 3150 3350
Connection ~ 3150 3300
Text Label 3250 3300 0    60   ~ 0
SD3V3
$Comp
L CP C15
U 1 1 590C7447
P 3150 3500
F 0 "C15" H 3175 3600 50  0000 L CNN
F 1 "22uF" H 3175 3400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3188 3350 50  0001 C CNN
F 3 "" H 3150 3500 50  0000 C CNN
	1    3150 3500
	1    0    0    -1  
$EndComp
$Comp
L Micro_SD_Card SD1
U 1 1 590C84AE
P 4950 3300
F 0 "SD1" H 4300 3900 50  0000 C CNN
F 1 "Micro_SD_Card" H 5600 3900 50  0000 R CNN
F 2 "micro-sd-schd3a0100:SCHD3A100" H 6100 3600 50  0001 C CNN
F 3 "" H 4950 3300 50  0000 C CNN
	1    4950 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3500 4050 3500
Wire Wire Line
	5750 3900 5800 3900
Wire Wire Line
	5800 3900 5800 3950
Wire Wire Line
	3150 3300 4050 3300
Wire Wire Line
	3550 3500 3550 3650
Text Notes 3050 4100 0    60   ~ 0
SDcard connected to\nBANK6 on "usb" sheet
$EndSCHEMATC

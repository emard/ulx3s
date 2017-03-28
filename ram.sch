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
Sheet 8 11
Title "ULX3S"
Date ""
Rev "0.0.1"
Comp "FER+RIZ+RADIONA"
Comment1 "SDRAM memory"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MT48LC4M16A2TG U9
U 1 1 58D8506F
P 5450 3500
F 0 "U9" H 4850 4700 50  0000 C CNN
F 1 "MT48LC16M16A2TG" H 5450 3600 50  0000 C CNN
F 2 "TSOP54:TSOP54" H 5450 3500 50  0000 C CIN
F 3 "" H 5450 3250 50  0000 C CNN
	1    5450 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2200 5450 2100
Wire Wire Line
	5450 2100 5750 2100
Wire Wire Line
	5750 2100 5750 2200
Wire Wire Line
	5550 2000 5550 2200
Connection ~ 5550 2100
Wire Wire Line
	5650 2200 5650 2100
Connection ~ 5650 2100
Wire Wire Line
	5150 2200 5150 2100
Wire Wire Line
	5150 2100 5350 2100
Wire Wire Line
	5350 2100 5350 2200
Wire Wire Line
	5250 2000 5250 2200
Connection ~ 5250 2100
$Comp
L +3V3 #PWR084
U 1 1 58D928FF
P 5250 2000
F 0 "#PWR084" H 5250 1850 50  0001 C CNN
F 1 "+3V3" H 5250 2140 50  0000 C CNN
F 2 "" H 5250 2000 50  0000 C CNN
F 3 "" H 5250 2000 50  0000 C CNN
	1    5250 2000
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR085
U 1 1 58D92915
P 5550 2000
F 0 "#PWR085" H 5550 1850 50  0001 C CNN
F 1 "+3V3" H 5550 2140 50  0000 C CNN
F 2 "" H 5550 2000 50  0000 C CNN
F 3 "" H 5550 2000 50  0000 C CNN
	1    5550 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 4800 5150 4900
Wire Wire Line
	5150 4900 5350 4900
Wire Wire Line
	5350 4900 5350 4800
Wire Wire Line
	5250 4800 5250 5000
Connection ~ 5250 4900
Wire Wire Line
	5450 4800 5450 4900
Wire Wire Line
	5450 4900 5750 4900
Wire Wire Line
	5750 4900 5750 4800
Wire Wire Line
	5550 4800 5550 5000
Connection ~ 5550 4900
Wire Wire Line
	5650 4800 5650 4900
Connection ~ 5650 4900
$Comp
L GND #PWR086
U 1 1 58D929C8
P 5250 5000
F 0 "#PWR086" H 5250 4750 50  0001 C CNN
F 1 "GND" H 5250 4850 50  0000 C CNN
F 2 "" H 5250 5000 50  0000 C CNN
F 3 "" H 5250 5000 50  0000 C CNN
	1    5250 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR087
U 1 1 58D929DE
P 5550 5000
F 0 "#PWR087" H 5550 4750 50  0001 C CNN
F 1 "GND" H 5550 4850 50  0000 C CNN
F 2 "" H 5550 5000 50  0000 C CNN
F 3 "" H 5550 5000 50  0000 C CNN
	1    5550 5000
	1    0    0    -1  
$EndComp
Text GLabel 6250 2450 2    60   Input ~ 0
SDRAM_D0
Text GLabel 6250 2550 2    60   Input ~ 0
SDRAM_D1
Text GLabel 6250 2650 2    60   Input ~ 0
SDRAM_D2
Text GLabel 6250 2750 2    60   Input ~ 0
SDRAM_D3
Text GLabel 6250 2850 2    60   Input ~ 0
SDRAM_D4
Text GLabel 6250 2950 2    60   Input ~ 0
SDRAM_D5
Text GLabel 6250 3050 2    60   Input ~ 0
SDRAM_D6
Text GLabel 6250 3150 2    60   Input ~ 0
SDRAM_D7
Text GLabel 6250 3250 2    60   Input ~ 0
SDRAM_D8
Text GLabel 6250 3350 2    60   Input ~ 0
SDRAM_D9
Text GLabel 6250 3450 2    60   Input ~ 0
SDRAM_D10
Text GLabel 6250 3550 2    60   Input ~ 0
SDRAM_D11
Text GLabel 6250 3650 2    60   Input ~ 0
SDRAM_D12
Text GLabel 6250 3750 2    60   Input ~ 0
SDRAM_D13
Text GLabel 6250 3850 2    60   Input ~ 0
SDRAM_D14
Text GLabel 6250 3950 2    60   Input ~ 0
SDRAM_D15
Text GLabel 6250 4200 2    60   Input ~ 0
SDRAM_DQM0
Text GLabel 6250 4300 2    60   Input ~ 0
SDRAM_DQM1
Text GLabel 4650 2450 0    60   Input ~ 0
SDRAM_A0
Text GLabel 4650 2550 0    60   Input ~ 0
SDRAM_A1
Text GLabel 4650 2650 0    60   Input ~ 0
SDRAM_A2
Text GLabel 4650 2750 0    60   Input ~ 0
SDRAM_A3
Text GLabel 4650 2850 0    60   Input ~ 0
SDRAM_A4
Text GLabel 4650 2950 0    60   Input ~ 0
SDRAM_A5
Text GLabel 4650 3050 0    60   Input ~ 0
SDRAM_A6
Text GLabel 4650 3150 0    60   Input ~ 0
SDRAM_A7
Text GLabel 4650 3250 0    60   Input ~ 0
SDRAM_A8
Text GLabel 4650 3350 0    60   Input ~ 0
SDRAM_A9
Text GLabel 4650 3450 0    60   Input ~ 0
SDRAM_A10
Text GLabel 4650 3550 0    60   Input ~ 0
SDRAM_A11
Text GLabel 4650 3700 0    60   Input ~ 0
SDRAM_BA0
Text GLabel 4650 3800 0    60   Input ~ 0
SDRAM_BA1
Text GLabel 4650 3950 0    60   Input ~ 0
SDRAM_CLK
Text GLabel 4650 4050 0    60   Input ~ 0
SDRAM_CKE
Text GLabel 4650 4200 0    60   Input ~ 0
SDRAM_nRAS
Text GLabel 4650 4300 0    60   Input ~ 0
SDRAM_nCAS
Text GLabel 4650 4400 0    60   Input ~ 0
SDRAM_nWE
Text GLabel 4650 4550 0    60   Input ~ 0
SDRAM_nCS
$EndSCHEMATC

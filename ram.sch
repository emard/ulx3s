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
L +3V3 #PWR91
U 1 1 58D928FF
P 5250 2000
F 0 "#PWR91" H 5250 1850 50  0001 C CNN
F 1 "+3V3" H 5250 2140 50  0000 C CNN
F 2 "" H 5250 2000 50  0000 C CNN
F 3 "" H 5250 2000 50  0000 C CNN
	1    5250 2000
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR95
U 1 1 58D92915
P 5550 2000
F 0 "#PWR95" H 5550 1850 50  0001 C CNN
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
L GND #PWR92
U 1 1 58D929C8
P 5250 5000
F 0 "#PWR92" H 5250 4750 50  0001 C CNN
F 1 "GND" H 5250 4850 50  0000 C CNN
F 2 "" H 5250 5000 50  0000 C CNN
F 3 "" H 5250 5000 50  0000 C CNN
	1    5250 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR96
U 1 1 58D929DE
P 5550 5000
F 0 "#PWR96" H 5550 4750 50  0001 C CNN
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
Text GLabel 10050 5750 2    60   Input ~ 0
SDRAM_D0
Text GLabel 8550 5750 0    60   Input ~ 0
SDRAM_D1
Text GLabel 10050 2650 2    60   Input ~ 0
SDRAM_D2
Text GLabel 8550 2650 0    60   Input ~ 0
SDRAM_D3
Text GLabel 8550 3650 0    60   Input ~ 0
SDRAM_D4
Text GLabel 10050 3650 2    60   Input ~ 0
SDRAM_D5
Text GLabel 8550 5550 0    60   Input ~ 0
SDRAM_D6
Text GLabel 10050 5150 2    60   Input ~ 0
SDRAM_D7
Text GLabel 8550 2750 0    60   Input ~ 0
SDRAM_D8
Text GLabel 8550 2850 0    60   Input ~ 0
SDRAM_D9
Text GLabel 10050 2950 2    60   Input ~ 0
SDRAM_D10
Text GLabel 8550 2950 0    60   Input ~ 0
SDRAM_D11
Text GLabel 10050 3050 2    60   Input ~ 0
SDRAM_D12
Text GLabel 8550 3050 0    60   Input ~ 0
SDRAM_D13
Text GLabel 10050 3150 2    60   Input ~ 0
SDRAM_D14
Text GLabel 8550 3150 0    60   Input ~ 0
SDRAM_D15
Text GLabel 8550 5050 0    60   Input ~ 0
SDRAM_A0
Text GLabel 8550 5150 0    60   Input ~ 0
SDRAM_A1
Text GLabel 10050 5250 2    60   Input ~ 0
SDRAM_A2
Text GLabel 8550 5250 0    60   Input ~ 0
SDRAM_A3
Text GLabel 10050 6050 2    60   Input ~ 0
SDRAM_A4
Text GLabel 10050 5950 2    60   Input ~ 0
SDRAM_A5
Text GLabel 8550 6050 0    60   Input ~ 0
SDRAM_A6
Text GLabel 8550 5950 0    60   Input ~ 0
SDRAM_A7
Text GLabel 10050 2450 2    60   Input ~ 0
SDRAM_A8
Text GLabel 10050 2550 2    60   Input ~ 0
SDRAM_A9
Text GLabel 10050 5050 2    60   Input ~ 0
SDRAM_A10
Text GLabel 8550 2450 0    60   Input ~ 0
SDRAM_A11
Text GLabel 8550 4950 0    60   Input ~ 0
SDRAM_BA0
Text GLabel 8550 4850 0    60   Input ~ 0
SDRAM_BA1
Text GLabel 10050 2750 2    60   Input ~ 0
SDRAM_CLK
Text GLabel 8550 2550 0    60   Input ~ 0
SDRAM_CKE
Text GLabel 10050 4850 2    60   Input ~ 0
SDRAM_DQM0
Text GLabel 10050 2850 2    60   Input ~ 0
SDRAM_DQM1
Text GLabel 10050 4950 2    60   Input ~ 0
SDRAM_nRAS
Text GLabel 10050 4550 2    60   Input ~ 0
SDRAM_nCAS
Text GLabel 10050 4750 2    60   Input ~ 0
SDRAM_nWE
Text GLabel 8550 4750 0    60   Input ~ 0
SDRAM_nCS
$Comp
L LFE5U-25F-6BG381C U1
U 4 1 58EBA210
P 9300 5250
F 0 "U1" H 9300 6200 60  0000 C CNN
F 1 "LFE5U-25F-6BG381C" H 9300 6100 60  0000 C CNN
F 2 "lfe5bg381:BGA-381_pitch0.8mm_dia0.4mm" H 8250 6200 60  0001 C CNN
F 3 "" H 8250 6200 60  0000 C CNN
	4    9300 5250
	1    0    0    -1  
$EndComp
$Comp
L LFE5U-25F-6BG381C U1
U 3 1 58EB8856
P 9300 3150
F 0 "U1" H 9300 4100 60  0000 C CNN
F 1 "LFE5U-25F-6BG381C" H 9300 4000 60  0000 C CNN
F 2 "lfe5bg381:BGA-381_pitch0.8mm_dia0.4mm" H 8250 4100 60  0001 C CNN
F 3 "" H 8250 4100 60  0000 C CNN
	3    9300 3150
	1    0    0    -1  
$EndComp
Text GLabel 10050 4650 2    60   Input ~ 0
J2_5-
Text GLabel 10050 5450 2    60   Input ~ 0
J2_7-
Text GLabel 8550 5450 0    60   Input ~ 0
J2_7+
Text GLabel 8550 4650 0    60   Input ~ 0
J2_5+
Text GLabel 8550 5650 0    60   Input ~ 0
J2_9+
Text GLabel 10050 5650 2    60   Input ~ 0
J2_9-
Text GLabel 10050 3350 2    60   Input ~ 0
J2_13-
Text GLabel 10050 3950 2    60   Input ~ 0
J2_23-
Text GLabel 10050 3750 2    60   Input ~ 0
J2_17-
Text GLabel 8550 3350 0    60   Input ~ 0
J2_13+
Text GLabel 8550 3950 0    60   Input ~ 0
J2_23+
Text GLabel 8550 3750 0    60   Input ~ 0
J2_17+
Text GLabel 10050 3550 2    60   Input ~ 0
J2_15-
Text GLabel 8550 3550 0    60   Input ~ 0
J2_15+
Text GLabel 10050 5850 2    60   Input ~ 0
J2_11-
Text GLabel 8550 5850 0    60   Input ~ 0
J2_11+
$Comp
L C C16
U 1 1 59131F17
P 5350 5900
F 0 "C16" H 5375 6000 50  0000 L CNN
F 1 "2.2uF" H 5375 5800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5388 5750 50  0001 C CNN
F 3 "" H 5350 5900 50  0000 C CNN
	1    5350 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR94
U 1 1 59131FCA
P 5350 6050
F 0 "#PWR94" H 5350 5800 50  0001 C CNN
F 1 "GND" H 5350 5900 50  0000 C CNN
F 2 "" H 5350 6050 50  0000 C CNN
F 3 "" H 5350 6050 50  0000 C CNN
	1    5350 6050
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR93
U 1 1 59132092
P 5350 5750
F 0 "#PWR93" H 5350 5600 50  0001 C CNN
F 1 "+3V3" H 5350 5890 50  0000 C CNN
F 2 "" H 5350 5750 50  0000 C CNN
F 3 "" H 5350 5750 50  0000 C CNN
	1    5350 5750
	1    0    0    -1  
$EndComp
$EndSCHEMATC

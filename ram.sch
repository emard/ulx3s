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
LIBS:micro_sd_card_cd
LIBS:mt48lc16m16a2tg
LIBS:usb_otg
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
L +3V3 #PWR0118
U 1 1 58D928FF
P 5250 2000
F 0 "#PWR0118" H 5250 1850 50  0001 C CNN
F 1 "+3V3" H 5250 2140 50  0000 C CNN
F 2 "" H 5250 2000 50  0000 C CNN
F 3 "" H 5250 2000 50  0000 C CNN
	1    5250 2000
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR0119
U 1 1 58D92915
P 5550 2000
F 0 "#PWR0119" H 5550 1850 50  0001 C CNN
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
L GND #PWR0120
U 1 1 58D929C8
P 5250 5000
F 0 "#PWR0120" H 5250 4750 50  0001 C CNN
F 1 "GND" H 5250 4850 50  0000 C CNN
F 2 "" H 5250 5000 50  0000 C CNN
F 3 "" H 5250 5000 50  0000 C CNN
	1    5250 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0121
U 1 1 58D929DE
P 5550 5000
F 0 "#PWR0121" H 5550 4750 50  0001 C CNN
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
Text GLabel 4650 3750 0    60   Input ~ 0
SDRAM_BA0
Text GLabel 4650 3850 0    60   Input ~ 0
SDRAM_BA1
Text GLabel 4650 4000 0    60   Input ~ 0
SDRAM_CLK
Text GLabel 4650 4100 0    60   Input ~ 0
SDRAM_CKE
Text GLabel 4650 4200 0    60   Input ~ 0
SDRAM_nRAS
Text GLabel 4650 4300 0    60   Input ~ 0
SDRAM_nCAS
Text GLabel 4650 4400 0    60   Input ~ 0
SDRAM_nWE
Text GLabel 4650 4550 0    60   Input ~ 0
SDRAM_nCS
Text GLabel 10050 3250 2    60   Input ~ 0
SDRAM_D0
Text GLabel 8550 5750 0    60   Input ~ 0
SDRAM_D1
Text GLabel 10050 5750 2    60   Input ~ 0
SDRAM_D2
Text GLabel 8550 5550 0    60   Input ~ 0
SDRAM_D3
Text GLabel 10050 5150 2    60   Input ~ 0
SDRAM_D4
Text GLabel 10050 4750 2    60   Input ~ 0
SDRAM_D5
Text GLabel 10050 4550 2    60   Input ~ 0
SDRAM_D6
Text GLabel 10050 4950 2    60   Input ~ 0
SDRAM_D7
Text GLabel 10050 3050 2    60   Input ~ 0
SDRAM_D8
Text GLabel 8550 3050 0    60   Input ~ 0
SDRAM_D9
Text GLabel 10050 3150 2    60   Input ~ 0
SDRAM_D10
Text GLabel 8550 3150 0    60   Input ~ 0
SDRAM_D11
Text GLabel 8550 3650 0    60   Input ~ 0
SDRAM_D12
Text GLabel 10050 3650 2    60   Input ~ 0
SDRAM_D13
Text GLabel 8550 2650 0    60   Input ~ 0
SDRAM_D14
Text GLabel 8550 3250 0    60   Input ~ 0
SDRAM_D15
Text GLabel 10050 6050 2    60   Input ~ 0
SDRAM_A0
Text GLabel 10050 5950 2    60   Input ~ 0
SDRAM_A1
Text GLabel 8550 6050 0    60   Input ~ 0
SDRAM_A2
Text GLabel 8550 5950 0    60   Input ~ 0
SDRAM_A3
Text GLabel 10050 2450 2    60   Input ~ 0
SDRAM_A4
Text GLabel 10050 2550 2    60   Input ~ 0
SDRAM_A5
Text GLabel 10050 2650 2    60   Input ~ 0
SDRAM_A6
Text GLabel 8550 2450 0    60   Input ~ 0
SDRAM_A7
Text GLabel 8550 2550 0    60   Input ~ 0
SDRAM_A8
Text GLabel 10050 2750 2    60   Input ~ 0
SDRAM_A9
Text GLabel 8550 5250 0    60   Input ~ 0
SDRAM_A10
Text GLabel 10050 2850 2    60   Input ~ 0
SDRAM_A11
Text GLabel 8550 5150 0    60   Input ~ 0
SDRAM_BA0
Text GLabel 10050 5250 2    60   Input ~ 0
SDRAM_BA1
Text GLabel 10050 2950 2    60   Input ~ 0
SDRAM_CLK
Text GLabel 8550 2850 0    60   Input ~ 0
SDRAM_CKE
Text GLabel 8550 4750 0    60   Input ~ 0
SDRAM_DQM0
Text GLabel 8550 2950 0    60   Input ~ 0
SDRAM_DQM1
Text GLabel 10050 5050 2    60   Input ~ 0
SDRAM_nRAS
Text GLabel 8550 4850 0    60   Input ~ 0
SDRAM_nCAS
Text GLabel 8550 4950 0    60   Input ~ 0
SDRAM_nWE
Text GLabel 8550 5050 0    60   Input ~ 0
SDRAM_nCS
Text GLabel 10050 4650 2    60   Input ~ 0
GN14
Text GLabel 10050 5450 2    60   Input ~ 0
GN15
Text GLabel 8550 5450 0    60   Input ~ 0
GP15
Text GLabel 8550 4650 0    60   Input ~ 0
GP14
Text GLabel 8550 5650 0    60   Input ~ 0
GP16
Text GLabel 10050 5650 2    60   Input ~ 0
GN16
Text GLabel 10050 3350 2    60   Input ~ 0
GN18
Text GLabel 10050 3950 2    60   Input ~ 0
GN21
Text GLabel 10050 3750 2    60   Input ~ 0
GN20
Text GLabel 8550 3350 0    60   Input ~ 0
GP18
Text GLabel 8550 3950 0    60   Input ~ 0
GP21
Text GLabel 8550 3750 0    60   Input ~ 0
GP20
Text GLabel 10050 3550 2    60   Input ~ 0
GN19
Text GLabel 8550 3550 0    60   Input ~ 0
GP19
Text GLabel 10050 5850 2    60   Input ~ 0
GN17
Text GLabel 8550 5850 0    60   Input ~ 0
GP17
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
L GND #PWR0122
U 1 1 59131FCA
P 5350 6050
F 0 "#PWR0122" H 5350 5800 50  0001 C CNN
F 1 "GND" H 5350 5900 50  0000 C CNN
F 2 "" H 5350 6050 50  0000 C CNN
F 3 "" H 5350 6050 50  0000 C CNN
	1    5350 6050
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR0123
U 1 1 59132092
P 5350 5750
F 0 "#PWR0123" H 5350 5600 50  0001 C CNN
F 1 "+3V3" H 5350 5890 50  0000 C CNN
F 2 "" H 5350 5750 50  0000 C CNN
F 3 "" H 5350 5750 50  0000 C CNN
	1    5350 5750
	1    0    0    -1  
$EndComp
Text GLabel 8550 4550 0    60   Input ~ 0
ADC_MISO
Text GLabel 8550 5350 0    60   Input ~ 0
ADC_MOSI
Text GLabel 10050 5350 2    60   Input ~ 0
ADC_CSn
Text GLabel 10050 5550 2    60   Input ~ 0
ADC_SCLK
Text GLabel 8550 3850 0    60   Input ~ 0
USB_FPGA_D+
Text GLabel 10050 3850 2    60   Input ~ 0
USB_FPGA_D-
Text GLabel 4650 3650 0    60   Input ~ 0
SDRAM_A12
$Comp
L MT48LC16M16A2TG U9
U 1 1 5A04F49A
P 5450 3500
AR Path="/5A04F49A" Ref="U9"  Part="1" 
AR Path="/58D6D507/5A04F49A" Ref="U2"  Part="1" 
F 0 "U2" H 4850 4700 50  0000 C CNN
F 1 "MT48LC16M16A2TG" H 6150 2300 50  0000 C CNN
F 2 "TSOP54:TSOP54" H 5450 3500 50  0001 C CIN
F 3 "https://www.micron.com/~/media/Documents/Products/Data%20Sheet/DRAM/256Mb_sdr.pdf" H 5450 3250 50  0001 C CNN
F 4 "www.micron.com" H 5450 3500 60  0001 C CNN "MFG_URL"
F 5 "MT48LC16M16A2TG-7E" H 5450 3500 60  0001 C CNN "MFG_PN"
F 6 "www.mouser.com" H 5450 3500 60  0001 C CNN "Distributor1_URL"
F 7 "913-4816M16A2TG6AGTR" H 5450 3500 60  0001 C CNN "Distributor1_PN"
	1    5450 3500
	1    0    0    -1  
$EndComp
Text GLabel 8550 2750 0    60   Input ~ 0
SDRAM_A12
$Comp
L LFE5U-45F-6BG381C U1
U 3 1 5A07B063
P 9300 3150
AR Path="/5A07B063" Ref="U1"  Part="3" 
AR Path="/58D6D507/5A07B063" Ref="U1"  Part="3" 
F 0 "U1" H 9300 4100 60  0000 C CNN
F 1 "LFE5U-45F-6BG381C" H 9300 4000 60  0000 C CNN
F 2 "lfe5bg381:BGA-381_pitch0.8mm_dia0.4mm" H 8250 4100 60  0001 C CNN
F 3 "http://www.latticesemi.com/~/media/LatticeSemi/Documents/DataSheets/ECP5/FPGA-DS-02012.pdf" H 8250 4100 60  0001 C CNN
F 4 "LFE5U-45F-6BG381C" H 9300 3150 60  0001 C CNN "MFG_PN"
F 5 "www.mouser.com" H 9300 3150 60  0001 C CNN "Distributor1_URL"
F 6 "842-LFE5U45F6BG381C" H 9300 3150 60  0001 C CNN "Distributor1_PN"
	3    9300 3150
	1    0    0    -1  
$EndComp
$Comp
L LFE5U-45F-6BG381C U1
U 4 1 5A07B0B9
P 9300 5250
AR Path="/5A07B0B9" Ref="U1"  Part="4" 
AR Path="/58D6D507/5A07B0B9" Ref="U1"  Part="4" 
F 0 "U1" H 9300 6200 60  0000 C CNN
F 1 "LFE5U-45F-6BG381C" H 9300 6100 60  0000 C CNN
F 2 "lfe5bg381:BGA-381_pitch0.8mm_dia0.4mm" H 8250 6200 60  0001 C CNN
F 3 "http://www.latticesemi.com/~/media/LatticeSemi/Documents/DataSheets/ECP5/FPGA-DS-02012.pdf" H 8250 6200 60  0001 C CNN
F 4 "LFE5U-45F-6BG381C" H 9300 5250 60  0001 C CNN "MFG_PN"
F 5 "www.mouser.com" H 9300 5250 60  0001 C CNN "Distributor1_URL"
F 6 "842-LFE5U45F6BG381C" H 9300 5250 60  0001 C CNN "Distributor1_PN"
	4    9300 5250
	1    0    0    -1  
$EndComp
Text GLabel 8550 3450 0    60   Input ~ 0
SHUTDOWN
Text GLabel 10050 4850 2    60   Input ~ 0
BTN_U
Text GLabel 10050 3450 2    60   Input ~ 0
BTN_R
$Comp
L C C33
U 1 1 5A5FD142
P 5900 5900
F 0 "C33" H 5925 6000 50  0000 L CNN
F 1 "22nF" H 5925 5800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5938 5750 50  0001 C CNN
F 3 "" H 5900 5900 50  0000 C CNN
	1    5900 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0124
U 1 1 5A5FD148
P 5900 6050
F 0 "#PWR0124" H 5900 5800 50  0001 C CNN
F 1 "GND" H 5900 5900 50  0000 C CNN
F 2 "" H 5900 6050 50  0000 C CNN
F 3 "" H 5900 6050 50  0000 C CNN
	1    5900 6050
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR0125
U 1 1 5A5FD14E
P 5900 5750
F 0 "#PWR0125" H 5900 5600 50  0001 C CNN
F 1 "+3V3" H 5900 5890 50  0000 C CNN
F 2 "" H 5900 5750 50  0000 C CNN
F 3 "" H 5900 5750 50  0000 C CNN
	1    5900 5750
	1    0    0    -1  
$EndComp
$Comp
L C C34
U 1 1 5A5FD1C1
P 6200 5900
F 0 "C34" H 6225 6000 50  0000 L CNN
F 1 "22nF" H 6225 5800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6238 5750 50  0001 C CNN
F 3 "" H 6200 5900 50  0000 C CNN
	1    6200 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0126
U 1 1 5A5FD1C7
P 6200 6050
F 0 "#PWR0126" H 6200 5800 50  0001 C CNN
F 1 "GND" H 6200 5900 50  0000 C CNN
F 2 "" H 6200 6050 50  0000 C CNN
F 3 "" H 6200 6050 50  0000 C CNN
	1    6200 6050
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR0127
U 1 1 5A5FD1CD
P 6200 5750
F 0 "#PWR0127" H 6200 5600 50  0001 C CNN
F 1 "+3V3" H 6200 5890 50  0000 C CNN
F 2 "" H 6200 5750 50  0000 C CNN
F 3 "" H 6200 5750 50  0000 C CNN
	1    6200 5750
	1    0    0    -1  
$EndComp
$Comp
L C C35
U 1 1 5A5FD26F
P 6500 5900
F 0 "C35" H 6525 6000 50  0000 L CNN
F 1 "22nF" H 6525 5800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6538 5750 50  0001 C CNN
F 3 "" H 6500 5900 50  0000 C CNN
	1    6500 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0128
U 1 1 5A5FD275
P 6500 6050
F 0 "#PWR0128" H 6500 5800 50  0001 C CNN
F 1 "GND" H 6500 5900 50  0000 C CNN
F 2 "" H 6500 6050 50  0000 C CNN
F 3 "" H 6500 6050 50  0000 C CNN
	1    6500 6050
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR0129
U 1 1 5A5FD27B
P 6500 5750
F 0 "#PWR0129" H 6500 5600 50  0001 C CNN
F 1 "+3V3" H 6500 5890 50  0000 C CNN
F 2 "" H 6500 5750 50  0000 C CNN
F 3 "" H 6500 5750 50  0000 C CNN
	1    6500 5750
	1    0    0    -1  
$EndComp
$EndSCHEMATC

EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 11
Title "ULX3S"
Date ""
Rev "1.0.2"
Comp "EMARD"
Comment1 "GPIO 2.54 mm connectors"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR016
U 1 1 56AC4825
P 7800 5450
F 0 "#PWR016" H 7800 5200 50  0001 C CNN
F 1 "GND" H 7800 5300 50  0000 C CNN
F 2 "" H 7800 5450 60  0000 C CNN
F 3 "" H 7800 5450 60  0000 C CNN
	1    7800 5450
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 56AC482D
P 9000 5450
F 0 "#PWR017" H 9000 5200 50  0001 C CNN
F 1 "GND" H 9000 5300 50  0000 C CNN
F 2 "" H 9000 5450 60  0000 C CNN
F 3 "" H 9000 5450 60  0000 C CNN
	1    9000 5450
	0    -1   -1   0   
$EndComp
$Comp
L Device:Jumper_NC_Small D51
U 1 1 56AC483B
P 7450 3650
F 0 "D51" H 7450 3750 50  0000 C CNN
F 1 "0" H 7450 3600 50  0000 C CNN
F 2 "jumper:D_SMA_Jumper_NC" V 7450 3650 60  0001 C CNN
F 3 "" V 7450 3650 60  0000 C CNN
F 4 "Leave empty" H 7450 3650 50  0001 C CNN "Note"
	1    7450 3650
	1    0    0    1   
$EndComp
Text Label 7900 3650 0    60   ~ 0
IN5V
$Comp
L Device:Jumper_NC_Small D52
U 1 1 56AC4846
P 9400 3650
F 0 "D52" H 9400 3750 50  0000 C CNN
F 1 "0" H 9400 3600 50  0000 C CNN
F 2 "jumper:D_SMA_Jumper_NC" V 9400 3650 60  0001 C CNN
F 3 "" V 9400 3650 60  0000 C CNN
F 4 "Leave empty" H 9400 3650 50  0001 C CNN "Note"
	1    9400 3650
	1    0    0    1   
$EndComp
Text Label 8700 3650 0    60   ~ 0
OUT5V
$Comp
L power:+5V #PWR011
U 1 1 56AC484F
P 7350 3650
F 0 "#PWR011" H 7350 3500 50  0001 C CNN
F 1 "+5V" H 7350 3790 50  0000 C CNN
F 2 "" H 7350 3650 60  0000 C CNN
F 3 "" H 7350 3650 60  0000 C CNN
	1    7350 3650
	0    -1   1    0   
$EndComp
$Comp
L power:+3V3 #PWR020
U 1 1 58D5FBBC
P 9150 5550
F 0 "#PWR020" H 9150 5400 50  0001 C CNN
F 1 "+3V3" H 9150 5690 50  0000 C CNN
F 2 "" H 9150 5550 50  0000 C CNN
F 3 "" H 9150 5550 50  0000 C CNN
	1    9150 5550
	0    1    -1   0   
$EndComp
$Comp
L power:+3V3 #PWR013
U 1 1 58D5FBF3
P 7650 5550
F 0 "#PWR013" H 7650 5400 50  0001 C CNN
F 1 "+3V3" H 7650 5690 50  0000 C CNN
F 2 "" H 7650 5550 50  0000 C CNN
F 3 "" H 7650 5550 50  0000 C CNN
	1    7650 5550
	0    -1   1    0   
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J2
U 1 1 58E6B7F6
P 8350 4650
F 0 "J2" H 8400 5650 50  0000 C CNN
F 1 "CONN_02X20" H 8400 3550 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_2x20" H 8350 3700 50  0001 C CNN
F 3 "" H 8350 3700 50  0000 C CNN
F 4 "Leave empty" H 8350 4650 60  0001 C CNN "Note"
	1    8350 4650
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J1
U 1 1 58E6B835
P 1950 4550
F 0 "J1" H 2000 5550 50  0000 C CNN
F 1 "CONN_02X20" H 2000 3450 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Angled_2x20" H 1950 3600 50  0001 C CNN
F 3 "" H 1950 3600 50  0000 C CNN
F 4 "Leave empty" H 1950 4550 60  0001 C CNN "Note"
	1    1950 4550
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 58E6D572
P 7750 4550
F 0 "#PWR014" H 7750 4300 50  0001 C CNN
F 1 "GND" H 7750 4400 50  0000 C CNN
F 2 "" H 7750 4550 60  0000 C CNN
F 3 "" H 7750 4550 60  0000 C CNN
	1    7750 4550
	0    1    -1   0   
$EndComp
$Comp
L power:+3V3 #PWR012
U 1 1 58E6D578
P 7600 4650
F 0 "#PWR012" H 7600 4500 50  0001 C CNN
F 1 "+3V3" H 7600 4790 50  0000 C CNN
F 2 "" H 7600 4650 50  0000 C CNN
F 3 "" H 7600 4650 50  0000 C CNN
	1    7600 4650
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 58E6D59D
P 9050 4550
F 0 "#PWR018" H 9050 4300 50  0001 C CNN
F 1 "GND" H 9050 4400 50  0000 C CNN
F 2 "" H 9050 4550 60  0000 C CNN
F 3 "" H 9050 4550 60  0000 C CNN
	1    9050 4550
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR021
U 1 1 58E6D5A3
P 9200 4650
F 0 "#PWR021" H 9200 4500 50  0001 C CNN
F 1 "+3V3" H 9200 4790 50  0000 C CNN
F 2 "" H 9200 4650 50  0000 C CNN
F 3 "" H 9200 4650 50  0000 C CNN
	1    9200 4650
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 58E6E4EC
P 7750 3750
F 0 "#PWR015" H 7750 3500 50  0001 C CNN
F 1 "GND" H 7750 3600 50  0000 C CNN
F 2 "" H 7750 3750 60  0000 C CNN
F 3 "" H 7750 3750 60  0000 C CNN
	1    7750 3750
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR019
U 1 1 58E6E536
P 9050 3750
F 0 "#PWR019" H 9050 3500 50  0001 C CNN
F 1 "GND" H 9050 3600 50  0000 C CNN
F 2 "" H 9050 3750 60  0000 C CNN
F 3 "" H 9050 3750 60  0000 C CNN
	1    9050 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 5450 8150 5450
Wire Wire Line
	9000 5450 8650 5450
Wire Wire Line
	8150 5550 7650 5550
Wire Wire Line
	8650 3650 9300 3650
Wire Wire Line
	7550 3650 8150 3650
Wire Wire Line
	8650 5550 9150 5550
Wire Wire Line
	7750 4550 8150 4550
Wire Wire Line
	9050 4550 8650 4550
Wire Wire Line
	8650 4650 9200 4650
Wire Wire Line
	7600 4650 8150 4650
Wire Wire Line
	2700 5550 2150 5550
Wire Wire Line
	1650 5550 1150 5550
Wire Wire Line
	8650 3750 9050 3750
Wire Wire Line
	7750 3750 8150 3750
$Comp
L power:GND #PWR05
U 1 1 58E710CC
P 2550 3750
F 0 "#PWR05" H 2550 3500 50  0001 C CNN
F 1 "GND" H 2550 3600 50  0000 C CNN
F 2 "" H 2550 3750 60  0000 C CNN
F 3 "" H 2550 3750 60  0000 C CNN
	1    2550 3750
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 58E710E6
P 2550 4650
F 0 "#PWR06" H 2550 4400 50  0001 C CNN
F 1 "GND" H 2550 4500 50  0000 C CNN
F 2 "" H 2550 4650 60  0000 C CNN
F 3 "" H 2550 4650 60  0000 C CNN
	1    2550 4650
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 58E710F2
P 2550 5450
F 0 "#PWR07" H 2550 5200 50  0001 C CNN
F 1 "GND" H 2550 5300 50  0000 C CNN
F 2 "" H 2550 5450 60  0000 C CNN
F 3 "" H 2550 5450 60  0000 C CNN
	1    2550 5450
	0    -1   1    0   
$EndComp
Wire Wire Line
	2550 3750 2150 3750
Wire Wire Line
	2150 3650 2700 3650
Wire Wire Line
	2550 4650 2150 4650
Wire Wire Line
	2700 4550 2150 4550
Wire Wire Line
	2550 5450 2150 5450
$Comp
L power:GND #PWR010
U 1 1 58E7117D
P 1200 3750
F 0 "#PWR010" H 1200 3500 50  0001 C CNN
F 1 "GND" H 1200 3600 50  0000 C CNN
F 2 "" H 1200 3750 60  0000 C CNN
F 3 "" H 1200 3750 60  0000 C CNN
	1    1200 3750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 58E71197
P 1250 4650
F 0 "#PWR08" H 1250 4400 50  0001 C CNN
F 1 "GND" H 1250 4500 50  0000 C CNN
F 2 "" H 1250 4650 60  0000 C CNN
F 3 "" H 1250 4650 60  0000 C CNN
	1    1250 4650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 58E711A3
P 1250 5450
F 0 "#PWR09" H 1250 5200 50  0001 C CNN
F 1 "GND" H 1250 5300 50  0000 C CNN
F 2 "" H 1250 5450 60  0000 C CNN
F 3 "" H 1250 5450 60  0000 C CNN
	1    1250 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	1200 3750 1650 3750
Wire Wire Line
	1650 3650 1050 3650
Wire Wire Line
	1250 4650 1650 4650
Wire Wire Line
	1650 4550 1100 4550
Wire Wire Line
	1650 5450 1250 5450
$Comp
L power:+5V #PWR022
U 1 1 58E75077
P 9500 3650
F 0 "#PWR022" H 9500 3500 50  0001 C CNN
F 1 "+5V" H 9500 3790 50  0000 C CNN
F 2 "" H 9500 3650 50  0000 C CNN
F 3 "" H 9500 3650 50  0000 C CNN
	1    9500 3650
	0    1    -1   0   
$EndComp
Text GLabel 2150 3850 2    60   Input ~ 0
GN0
Text GLabel 1650 3850 0    60   Input ~ 0
GP0
Text GLabel 2150 3950 2    60   Input ~ 0
GN1
Text GLabel 1650 3950 0    60   Input ~ 0
GP1
Text GLabel 2150 4050 2    60   Input ~ 0
GN2
Text GLabel 1650 4050 0    60   Input ~ 0
GP2
Text GLabel 1650 4150 0    60   Input ~ 0
GP3
Text GLabel 2150 4150 2    60   Input ~ 0
GN3
Text GLabel 2150 4250 2    60   Input ~ 0
GN4
Text GLabel 1650 4250 0    60   Input ~ 0
GP4
Text GLabel 1650 4350 0    60   Input ~ 0
GP5
Text GLabel 2150 4350 2    60   Input ~ 0
GN5
Text GLabel 2150 4450 2    60   Input ~ 0
GN6
Text GLabel 1650 4450 0    60   Input ~ 0
GP6
Text GLabel 2150 4750 2    60   Input ~ 0
GN7
Text GLabel 1650 4750 0    60   Input ~ 0
GP7
Text GLabel 2150 4850 2    60   Input ~ 0
GN8
Text GLabel 1650 4850 0    60   Input ~ 0
GP8
Text GLabel 2150 4950 2    60   Input ~ 0
GN9
Text GLabel 1650 4950 0    60   Input ~ 0
GP9
Text GLabel 2150 5050 2    60   Input ~ 0
GN10
Text GLabel 1650 5050 0    60   Input ~ 0
GP10
Text GLabel 2150 5150 2    60   Input ~ 0
GN11
Text GLabel 1650 5150 0    60   Input ~ 0
GP11
Text GLabel 2150 5250 2    60   Input ~ 0
GN12
Text GLabel 1650 5250 0    60   Input ~ 0
GP12
Text GLabel 2150 5350 2    60   Input ~ 0
GN13
Text GLabel 1650 5350 0    60   Input ~ 0
GP13
Text GLabel 8650 5350 2    60   Input ~ 0
GP14
Text GLabel 8650 5250 2    60   Input ~ 0
GP15
Text GLabel 8650 5150 2    60   Input ~ 0
GP16
Text GLabel 8650 5050 2    60   Input ~ 0
GP17
Text GLabel 8650 4950 2    60   Input ~ 0
GP18
Text GLabel 8650 4850 2    60   Input ~ 0
GP19
Text GLabel 8650 4750 2    60   Input ~ 0
GP20
Text GLabel 8150 5350 0    60   Input ~ 0
GN14
Text GLabel 8150 5250 0    60   Input ~ 0
GN15
Text GLabel 8150 5150 0    60   Input ~ 0
GN16
Text GLabel 8150 5050 0    60   Input ~ 0
GN17
Text GLabel 8150 4950 0    60   Input ~ 0
GN18
Text GLabel 8150 4850 0    60   Input ~ 0
GN19
Text GLabel 8150 4750 0    60   Input ~ 0
GN20
Text GLabel 8150 4450 0    60   Input ~ 0
GN21
Text GLabel 8150 4350 0    60   Input ~ 0
GN22
Text GLabel 8150 4250 0    60   Input ~ 0
GN23
Text GLabel 8150 4150 0    60   Input ~ 0
GN24
Text GLabel 8150 4050 0    60   Input ~ 0
GN25
Text GLabel 8150 3950 0    60   Input ~ 0
GN26
Text GLabel 8150 3850 0    60   Input ~ 0
GN27
Text GLabel 8650 4450 2    60   Input ~ 0
GP21
Text GLabel 8650 4350 2    60   Input ~ 0
GP22
Text GLabel 8650 4250 2    60   Input ~ 0
GP23
Text GLabel 8650 4150 2    60   Input ~ 0
GP24
Text GLabel 8650 4050 2    60   Input ~ 0
GP25
Text GLabel 8650 3950 2    60   Input ~ 0
GP26
Text GLabel 8650 3850 2    60   Input ~ 0
GP27
Text GLabel 5650 5350 2    60   Input ~ 0
GN13
Text GLabel 4150 5350 0    60   Input ~ 0
GP13
Text GLabel 4150 5550 0    60   Input ~ 0
GP12
Text GLabel 5650 5550 2    60   Input ~ 0
GN12
Text GLabel 5650 4750 2    60   Input ~ 0
GN11
Text GLabel 4150 4750 0    60   Input ~ 0
GP11
Text GLabel 5650 4950 2    60   Input ~ 0
GN9
Text GLabel 4150 4950 0    60   Input ~ 0
GP9
Text GLabel 5650 4350 2    60   Input ~ 0
GN10
Text GLabel 4150 4350 0    60   Input ~ 0
GP10
Text GLabel 5650 4150 2    60   Input ~ 0
GN8
Text GLabel 4150 4150 0    60   Input ~ 0
GP8
Text GLabel 5700 2900 2    60   Input ~ 0
GN7
Text GLabel 4200 2900 0    60   Input ~ 0
GP7
Text GLabel 5700 2600 2    60   Input ~ 0
GN6
Text GLabel 4200 2600 0    60   Input ~ 0
GP6
Text GLabel 5700 1800 2    60   Input ~ 0
GN0
Text GLabel 5700 1900 2    60   Input ~ 0
GN1
Text GLabel 5700 2000 2    60   Input ~ 0
GN2
Text GLabel 5700 2300 2    60   Input ~ 0
GN4
Text GLabel 4200 1800 0    60   Input ~ 0
GP0
Text GLabel 4200 1900 0    60   Input ~ 0
GP1
Text GLabel 4200 2000 0    60   Input ~ 0
GP2
Text GLabel 4200 2300 0    60   Input ~ 0
GP4
Text GLabel 4200 2400 0    60   Input ~ 0
GP5
Text GLabel 5700 2400 2    60   Input ~ 0
GN5
Text GLabel 5700 2100 2    60   Input ~ 0
GN3
Text GLabel 4200 2100 0    60   Input ~ 0
GP3
Text GLabel 4150 4550 0    60   Input ~ 0
AUDIO_L0
Text GLabel 5650 4450 2    60   Input ~ 0
AUDIO_L1
Text GLabel 4150 4450 0    60   Input ~ 0
AUDIO_L2
Text GLabel 5650 4250 2    60   Input ~ 0
AUDIO_L3
Text GLabel 4150 4250 0    60   Input ~ 0
AUDIO_R0
Text GLabel 4150 4050 0    60   Input ~ 0
AUDIO_R1
Text GLabel 5650 4550 2    60   Input ~ 0
AUDIO_R2
Text GLabel 5650 4050 2    60   Input ~ 0
AUDIO_R3
Text GLabel 4150 4850 0    60   Input ~ 0
LED0
Text GLabel 5650 5450 2    60   Input ~ 0
LED5
Text GLabel 4150 5150 0    60   Input ~ 0
LED2
Text GLabel 4150 5050 0    60   Input ~ 0
LED3
Text GLabel 5650 5150 2    60   Input ~ 0
LED4
Text GLabel 5650 4850 2    60   Input ~ 0
LED1
Text GLabel 5650 5050 2    60   Input ~ 0
LED6
Text GLabel 5650 5250 2    60   Input ~ 0
LED7
Text Notes 950  7550 0    60   ~ 0
GPIO route only A/B pairs as those are differential bidirectional\ndon't route C/D pairs to GPIO as those can be differential input only\nBANK0,1 are single-ended (non-differential)
Text GLabel 5700 2800 2    60   Input ~ 0
BTN_PWRn
Text Notes 6700 6050 0    60   ~ 0
GP,GN 14-21 differential bidirectional connected to BANK2,3 on "ram" sheet\nGP,GN 22-27 single-ended connected to BANK1 on "gpdi" sheet
Text GLabel 4200 2500 0    60   Input ~ 0
SW1
Text GLabel 5700 2500 2    60   Input ~ 0
SW2
Text GLabel 5700 2700 2    60   Input ~ 0
SW3
Text GLabel 4200 2700 0    60   Input ~ 0
SW4
Text GLabel 4150 4650 0    60   Input ~ 0
AUDIO_V3
Text GLabel 5650 4650 2    60   Input ~ 0
AUDIO_V2
Text GLabel 4150 5450 0    60   Input ~ 0
AUDIO_V1
Text GLabel 4150 5250 0    60   Input ~ 0
AUDIO_V0
$Comp
L lfe5bg381:LFE5UM-85F-6BG381C U1
U 6 1 5A0783C9
P 4900 4750
AR Path="/5A0783C9" Ref="U1"  Part="6" 
AR Path="/56AC389C/5A0783C9" Ref="U1"  Part="6" 
F 0 "U1" H 4900 5700 60  0000 C CNN
F 1 "LFE5U-85F-6BG381C" H 4900 5600 60  0000 C CNN
F 2 "lfe5bg381:BGA-381_pitch0.8mm_dia0.4mm" H 3850 5700 60  0001 C CNN
F 3 "http://www.latticesemi.com/~/media/LatticeSemi/Documents/DataSheets/ECP5/FPGA-DS-02012.pdf" H 3850 5700 60  0001 C CNN
F 4 "LFE5U-85F-6BG381C" H 4900 4750 60  0001 C CNN "MPN"
	6    4900 4750
	1    0    0    -1  
$EndComp
$Comp
L lfe5bg381:LFE5UM-85F-6BG381C U1
U 1 1 5A0737C6
P 4950 2500
AR Path="/5A0737C6" Ref="U1"  Part="1" 
AR Path="/56AC389C/5A0737C6" Ref="U1"  Part="1" 
F 0 "U1" H 4950 3450 60  0000 C CNN
F 1 "LFE5U-85F-6BG381C" H 4950 3350 60  0000 C CNN
F 2 "lfe5bg381:BGA-381_pitch0.8mm_dia0.4mm" H 3900 3450 60  0001 C CNN
F 3 "http://www.latticesemi.com/~/media/LatticeSemi/Documents/DataSheets/ECP5/FPGA-DS-02012.pdf" H 3900 3450 60  0001 C CNN
F 4 "LFE5U-85F-6BG381C" H 4950 2500 60  0001 C CNN "MPN"
	1    4950 2500
	1    0    0    -1  
$EndComp
Text Notes 1950 3900 2    60   ~ 0
0
Text Notes 1950 4000 2    60   ~ 0
1
Text Notes 1950 4100 2    60   ~ 0
2
Text Notes 1950 4200 2    60   ~ 0
3
Text Notes 1950 5100 2    60   ~ 0
10
Text Notes 1950 4300 2    60   ~ 0
4
Text Notes 1950 4400 2    60   ~ 0
5
Text Notes 1950 4500 2    60   ~ 0
6
Text Notes 1950 4800 2    60   ~ 0
7
Text Notes 1950 4900 2    60   ~ 0
8
Text Notes 1950 5000 2    60   ~ 0
9
Text Notes 1950 5200 2    60   ~ 0
11
Text Notes 1950 5300 2    60   ~ 0
12
Text Notes 1950 5400 2    60   ~ 0
13
Text Notes 8350 5400 0    60   ~ 0
14
Text Notes 8350 5300 0    60   ~ 0
15
Text Notes 8350 5200 0    60   ~ 0
16
Text Notes 8350 5100 0    60   ~ 0
17
Text Notes 8350 5000 0    60   ~ 0
18
Text Notes 8350 4900 0    60   ~ 0
19
Text Notes 8350 4800 0    60   ~ 0
20
Text Notes 8350 4500 0    60   ~ 0
21
Text Notes 8350 4400 0    60   ~ 0
22
Text Notes 8350 4300 0    60   ~ 0
23
Text Notes 8350 4200 0    60   ~ 0
24
Text Notes 8350 4100 0    60   ~ 0
25
Text Notes 8350 4000 0    60   ~ 0
26
Text Notes 8350 3900 0    60   ~ 0
27
Text Notes 2800 2250 0    60   ~ 0
NC v1.7
Text Notes 6750 2250 0    60   ~ 0
NC v1.7
Text GLabel 2700 3650 2    60   Input ~ 0
2V5_3V3
Text GLabel 2700 4550 2    60   Input ~ 0
2V5_3V3
Text GLabel 2700 5550 2    60   Input ~ 0
2V5_3V3
Text GLabel 1150 5550 0    60   Input ~ 0
2V5_3V3
Text GLabel 1100 4550 0    60   Input ~ 0
2V5_3V3
Text GLabel 1050 3650 0    60   Input ~ 0
2V5_3V3
Wire Notes Line
	7600 3500 7500 3500
Wire Notes Line
	7500 3450 7500 3550
Wire Notes Line
	7500 3450 7450 3500
Wire Notes Line
	7450 3500 7500 3550
Wire Notes Line
	7450 3550 7450 3450
Wire Notes Line
	7450 3500 7350 3500
Text Notes 7250 3400 0    60   ~ 0
STPS2L40AF
Wire Notes Line
	9550 3500 9450 3500
Wire Notes Line
	9450 3450 9450 3550
Wire Notes Line
	9450 3450 9400 3500
Wire Notes Line
	9400 3500 9450 3550
Wire Notes Line
	9400 3550 9400 3450
Wire Notes Line
	9400 3500 9300 3500
Text Notes 9150 3400 0    60   ~ 0
STPS2L40AF
NoConn ~ 4200 3000
NoConn ~ 4200 3100
NoConn ~ 5700 3000
Text Notes 9000 5100 0    60   ~ 0
GR_PCLK3_0
Text Notes 1300 5400 2    60   ~ 0
GR_PCLK7_1
Text Notes 1300 5300 2    60   ~ 0
PCLKT7_1
Text Notes 2950 5300 2    60   ~ 0
PCLKC7_1
Text Notes 1350 3900 2    60   ~ 0
PCLKT0_0
Text Notes 2900 3900 2    60   ~ 0
PCLKC0_0
Text Notes 1350 4000 2    60   ~ 0
PCLKT0_1
Text Notes 2900 4000 2    60   ~ 0
PCLKC0_1
Text Notes 1350 4100 2    60   ~ 0
GR_PCLK0_1
Text Notes 3000 4100 2    60   ~ 0
GR_PCLK0_0
Text Notes 3250 5200 2    60   ~ 0
DAC WIFI_GPIO25
Text Notes 1300 5200 2    60   ~ 0
DAC WIFI_GPIO26
Text Notes 600  5950 0    60   ~ 0
GP,GN 0-7 single-ended connected to BANK0\nGP,GN 8-13 differential bidirectional connected to BANK7
Text Notes 650  3450 0    60   ~ 0
J1 J2 PIN numbering 1-40 is for FEMALE 90° ANGLED header.\nFor MALE VERTICAL header, SWAP EVEN and ODD pin numbers.
Text Notes 7050 3250 0    60   ~ 0
J1 J2 PIN numbering 1-40 is for FEMALE 90° ANGLED header.\nFor MALE VERTICAL header, SWAP EVEN and ODD pin numbers.
Text GLabel 5700 2200 2    60   Input ~ 0
WIFI_GPIO25
Text GLabel 4200 2800 0    60   Input ~ 0
WIFI_GPIO35
Text Notes 2800 2850 0    60   ~ 0
NC <v3.1.2
$EndSCHEMATC

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
Sheet 7 11
Title "ULX3S"
Date ""
Rev "0.0.1"
Comp "FER+RIZ+RADIONA"
Comment1 "WIFI module ESP8266-12E"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 7000 5850 3    60   Input ~ 0
SD_D0
Text GLabel 7100 5850 3    60   Input ~ 0
SD_D1
Text GLabel 6700 5850 3    60   Input ~ 0
SD_3
Text GLabel 6800 5850 3    60   Input ~ 0
SD_CMD
Text GLabel 6900 5850 3    60   Input ~ 0
SD_CLK
Text GLabel 6600 5850 3    60   Input ~ 0
SD_2
Text GLabel 7750 4550 2    60   Input ~ 0
WIFI_RXD
Text GLabel 7750 4450 2    60   Input ~ 0
WIFI_TXD
Text GLabel 7750 5450 2    60   Input ~ 0
WIFI_GPIO0
Text GLabel 7750 4850 2    60   Input ~ 0
JTAG_TDI
Text GLabel 7750 5150 2    60   Input ~ 0
JTAG_TDO
Text GLabel 7750 4950 2    60   Input ~ 0
JTAG_TCK
Text GLabel 7750 4650 2    60   Input ~ 0
JTAG_TMS
$Comp
L ESP-32S U2
U 1 1 58E5662B
P 6850 4800
F 0 "U2" H 6150 6050 60  0000 C CNN
F 1 "ESP-32S" H 7350 6050 60  0000 C CNN
F 2 "ESP32-footprints-Lib:ESP-32S" H 7200 6150 60  0001 C CNN
F 3 "" H 6400 5250 60  0001 C CNN
	1    6850 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR091
U 1 1 58E56E8D
P 5500 4100
F 0 "#PWR091" H 5500 3850 50  0001 C CNN
F 1 "GND" H 5500 3950 50  0000 C CNN
F 2 "" H 5500 4100 50  0000 C CNN
F 3 "" H 5500 4100 50  0000 C CNN
	1    5500 4100
	0    1    1    0   
$EndComp
$Comp
L +3V3 #PWR092
U 1 1 58E56EA3
P 5350 4200
F 0 "#PWR092" H 5350 4050 50  0001 C CNN
F 1 "+3V3" H 5350 4340 50  0000 C CNN
F 2 "" H 5350 4200 50  0000 C CNN
F 3 "" H 5350 4200 50  0000 C CNN
	1    5350 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 4100 5900 4100
Wire Wire Line
	5350 4200 5900 4200
Text GLabel 5900 4300 0    60   Input ~ 0
WIFI_EN
$Comp
L +3V3 #PWR093
U 1 1 58ED6C57
P 4600 4300
F 0 "#PWR093" H 4600 4150 50  0001 C CNN
F 1 "+3V3" H 4600 4440 50  0000 C CNN
F 2 "" H 4600 4300 50  0000 C CNN
F 3 "" H 4600 4300 50  0000 C CNN
	1    4600 4300
	1    0    0    -1  
$EndComp
$Comp
L R R34
U 1 1 58ED6C6D
P 4600 4450
F 0 "R34" V 4680 4450 50  0000 C CNN
F 1 "15k" V 4600 4450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4530 4450 50  0001 C CNN
F 3 "" H 4600 4450 50  0000 C CNN
	1    4600 4450
	1    0    0    -1  
$EndComp
Text GLabel 4750 4650 2    60   Input ~ 0
WIFI_EN
Wire Wire Line
	4600 4600 4600 4700
Wire Wire Line
	4600 4650 4750 4650
Connection ~ 4600 4650
$Comp
L GND #PWR094
U 1 1 58EE2982
P 4600 5500
F 0 "#PWR094" H 4600 5250 50  0001 C CNN
F 1 "GND" H 4600 5350 50  0000 C CNN
F 2 "" H 4600 5500 50  0000 C CNN
F 3 "" H 4600 5500 50  0000 C CNN
	1    4600 5500
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X01 J3
U 1 1 58EE29FF
P 4600 5250
F 0 "J3" H 4600 5350 50  0000 C CNN
F 1 "WIFI_OFF" H 4600 5150 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x01" H 4600 4050 50  0001 C CNN
F 3 "" H 4600 4050 50  0000 C CNN
	1    4600 5250
	0    1    1    0   
$EndComp
Text Notes 8700 5050 0    60   ~ 0
Programming pins:\nTXD RXD EN GPIO0
$Comp
L R R35
U 1 1 58FD4C5D
P 4600 4850
F 0 "R35" V 4680 4850 50  0000 C CNN
F 1 "470" V 4600 4850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4530 4850 50  0001 C CNN
F 3 "" H 4600 4850 50  0000 C CNN
	1    4600 4850
	1    0    0    -1  
$EndComp
$Comp
L CP C21
U 1 1 5924A09B
P 3850 4450
F 0 "C21" H 3875 4550 50  0000 L CNN
F 1 "22uF" H 3875 4350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3888 4300 50  0001 C CNN
F 3 "" H 3850 4450 50  0000 C CNN
	1    3850 4450
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR095
U 1 1 5924A1EA
P 3850 4300
F 0 "#PWR095" H 3850 4150 50  0001 C CNN
F 1 "+3V3" H 3850 4440 50  0000 C CNN
F 2 "" H 3850 4300 50  0000 C CNN
F 3 "" H 3850 4300 50  0000 C CNN
	1    3850 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR096
U 1 1 5924A206
P 3850 4600
F 0 "#PWR096" H 3850 4350 50  0001 C CNN
F 1 "GND" H 3850 4450 50  0000 C CNN
F 2 "" H 3850 4600 50  0000 C CNN
F 3 "" H 3850 4600 50  0000 C CNN
	1    3850 4600
	1    0    0    -1  
$EndComp
Text Notes 7550 6000 0    60   ~ 0
WiFi and SDcard connected to\nBANK6 on "usb" sheet
Text Notes 8700 5500 0    60   ~ 0
Strapping pins\n(avoid using to avoid\nboot problems)\nGPIO0,2,4,5,12,15
NoConn ~ 7750 5350
NoConn ~ 7300 5850
NoConn ~ 7750 5050
Text Notes 2950 6700 0    60   ~ 0
ESP32 ADC capable pins\nGPIO36,39,34,35,32,33,25,26,27,\nGPIO14,12,13,15 - shared with HSPI/JTAG\nConnected to "gpio" sheet
Text Notes 3850 7350 0    60   ~ 0
ESP32 HSPI pins\nGPIO12: MISO\nGPIO13: MOSI\nGPIO14: SCK\nGPIO15: SS
Text Notes 4750 7450 0    60   ~ 0
ESP32 JTAG slave interface\nEN: TRST_N\nGPIO15: TDO\nGPIO12: TDI\nGPIO13: TCK\nGPIO14: TMS
Text Notes 2950 7350 0    60   ~ 0
ESP32 VSPI pins\nGPIO5: SS\nGPIO18: SCK\nGPIO19: MISO\nGPIO23: MOSI
Text GLabel 5900 4600 0    60   Input ~ 0
J1_35+
Text GLabel 5900 4700 0    60   Input ~ 0
J1_35-
Text GLabel 5900 4800 0    60   Input ~ 0
J1_33+
Text GLabel 5900 4900 0    60   Input ~ 0
J1_33-
Text GLabel 5900 5000 0    60   Input ~ 0
J1_31+
Text GLabel 5900 5100 0    60   Input ~ 0
J1_31-
Text GLabel 5900 5200 0    60   Input ~ 0
J1_29+
Text GLabel 5900 5300 0    60   Input ~ 0
J1_29-
Text GLabel 5900 5400 0    60   Input ~ 0
J1_27+
Text GLabel 6500 5850 3    60   Input ~ 0
J1_27-
Text GLabel 7200 5850 3    60   Input ~ 0
WIFI_GPIO15
Text Notes 7550 6400 0    60   ~ 0
WIFI GPIO15 (HSPI_SS)\nconnected to \nBANK6 on "usb" sheet
Text GLabel 7750 5250 2    60   Input ~ 0
WIFI_GPIO16
$Comp
L GND #PWR?
U 1 1 59C1BF96
P 7850 4150
F 0 "#PWR?" H 7850 3900 50  0001 C CNN
F 1 "GND" H 7850 4000 50  0000 C CNN
F 2 "" H 7850 4150 50  0001 C CNN
F 3 "" H 7850 4150 50  0001 C CNN
	1    7850 4150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 4150 7850 4150
$Comp
L GND #PWR?
U 1 1 59C1BFCC
P 7850 4050
F 0 "#PWR?" H 7850 3800 50  0001 C CNN
F 1 "GND" H 7850 3900 50  0000 C CNN
F 2 "" H 7850 4050 50  0001 C CNN
F 3 "" H 7850 4050 50  0001 C CNN
	1    7850 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 4050 7850 4050
$EndSCHEMATC

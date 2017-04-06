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
LIBS:ulx3s-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 11
Title "ULX3S"
Date ""
Rev "0.0.1"
Comp "FER+RIZ+RADIONA"
Comment1 "Root sheet"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
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
$Sheet
S 8700 5900 750  450 
U 58D82BD0
F0 "analog" 60
F1 "analog.sch" 60
$EndSheet
$Sheet
S 10400 5250 750  450 
U 58DA7327
F0 "sdcard" 60
F1 "sdcard.sch" 60
$EndSheet
$Sheet
S 10400 5900 750  450 
U 58D913EC
F0 "flash" 60
F1 "flash.sch" 60
$EndSheet
$Comp
L CONN_01X01 H1
U 1 1 58E6B981
P 3150 6350
F 0 "H1" H 3150 6450 50  0000 C CNN
F 1 "HOLE" V 3250 6350 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_ISO14580_Pad" H 3150 6350 50  0001 C CNN
F 3 "" H 3150 6350 50  0000 C CNN
	1    3150 6350
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 H2
U 1 1 58E6BACE
P 3700 6350
F 0 "H2" H 3700 6450 50  0000 C CNN
F 1 "HOLE" V 3800 6350 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_ISO14580_Pad" H 3700 6350 50  0001 C CNN
F 3 "" H 3700 6350 50  0000 C CNN
	1    3700 6350
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 H3
U 1 1 58E6BAEF
P 4250 6350
F 0 "H3" H 4250 6450 50  0000 C CNN
F 1 "HOLE" V 4350 6350 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_ISO14580_Pad" H 4250 6350 50  0001 C CNN
F 3 "" H 4250 6350 50  0000 C CNN
	1    4250 6350
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 H4
U 1 1 58E6BBE9
P 4800 6350
F 0 "H4" H 4800 6450 50  0000 C CNN
F 1 "HOLE" V 4900 6350 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_ISO14580_Pad" H 4800 6350 50  0001 C CNN
F 3 "" H 4800 6350 50  0000 C CNN
	1    4800 6350
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR01
U 1 1 58E6BC0E
P 3150 6550
F 0 "#PWR01" H 3150 6300 50  0001 C CNN
F 1 "GND" H 3150 6400 50  0000 C CNN
F 2 "" H 3150 6550 50  0000 C CNN
F 3 "" H 3150 6550 50  0000 C CNN
	1    3150 6550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 58E6BC2E
P 3700 6550
F 0 "#PWR02" H 3700 6300 50  0001 C CNN
F 1 "GND" H 3700 6400 50  0000 C CNN
F 2 "" H 3700 6550 50  0000 C CNN
F 3 "" H 3700 6550 50  0000 C CNN
	1    3700 6550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 58E6BC56
P 4250 6550
F 0 "#PWR03" H 4250 6300 50  0001 C CNN
F 1 "GND" H 4250 6400 50  0000 C CNN
F 2 "" H 4250 6550 50  0000 C CNN
F 3 "" H 4250 6550 50  0000 C CNN
	1    4250 6550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 58E6BC72
P 4800 6550
F 0 "#PWR04" H 4800 6300 50  0001 C CNN
F 1 "GND" H 4800 6400 50  0000 C CNN
F 2 "" H 4800 6550 50  0000 C CNN
F 3 "" H 4800 6550 50  0000 C CNN
	1    4800 6550
	1    0    0    -1  
$EndComp
$EndSCHEMATC

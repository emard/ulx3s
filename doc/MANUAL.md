# ULX3S Manual

# Connectors

    US1    Main micro-USB for power, program and communication.
           All onboard hardware can be programmed or reconfigured
           over US1: FPGA, FLASH, WiFi, RTC.

    US2    Auxiliary micro-USB connected directly to FPGA pins
           for experimenting with user-defined USB cores.
           Board provides power to US2.
           Board can't be powered from US2.
           If you want to power board from US2, reverse diode
           D9 near US2 connector.

    GPDI   Plug for cable to digital monitor or TV,
           4 TMDS+- video
           1 HEAC+- ethernet and audio return 
           SDA,SCL  I2C (DDS EDID)
           CEC      remote control
           +5V      supply to enable plug-in detection

    AUDIO  3.5 mm jack with 3 channels for earphones
           and digital audio or composite video (analog TV)
           Suitable cables are 3.5mm to 3-RCA (cinch)
           Red-White-Yellow for iPhone/iBook/NOKIA.
           Sony cables are the most popular and look identical
           but are not suitable, they have GND at Ring2!
           Tip:    Left analog audio
           Ring1:  Right analog audio
           Ring2:  Digital audio SPDIF
           Sleeve: GND

    OLED   7-pin 2.54 mm header OLED1 for SSD1331 SPI color OLED
           pinout:   CS DC RES SDA SCL VCC GND

    JTAG   6-pin 2.54 mm header J4 for external JTAG programmer
           pinout:   3V3 GND
                     TCK TDI
                     TDO TMS
    
    GPIO   40-pin 2.54 mm double-row connectors J1 and J2 for GPIO 
           at 3.3V logical level with 56 bidirectional single-ended
           pins or 28 bidirectional differential pairs or combined,
           some single-ended and some differential.
           J1 pins marked 9-13 are shared with WiFi (PCB v1.7)
           J2 pins marked 14-17 are shared with ADC.
           4 PMOD connectors can be made out of it
           (GND and 3.3V power are on the right place)
           J1-J2 distance is suitable to be plugged into triple
           protoboard using a single row of J1/J2.      
           J2 has also 5V IN/OUT (be careful, GPIO pins are not
           5V tolerant).

    SD     Micro SD card, all signal pins are routed to FPGA and
           shared with ESP-32

    ESP32  Placeholder to solder ESP-32 WROOM module.
           ESP-32 can provide standalone web interface for uploading
           bitstream into FPGA and its config FLASH. 
           Warning on PCB v1.7 ESP-32 must be isolated from all SD
           card pins otherwise ESP-32 won't boot no matter if
           SD card is inserted or not.

# Power

Plug US1 into PC or USB charger and board should power up.

Initial voltage rise at USB 5V line will trigger board powering
up and holding the power.

USB-serial chip FT231X will always be powered from 5V USB
on PCB v1.7. The board has switching voltage regulators
which can be turned off to reduce power consumption.

Green LED D18 behaviour is the "Power LED". Green LED ON will keep 
board powered up. By factory default, when USB-serial chip
is enumerated by PC, Green LED will turn ON.
Normally when board is plugged into USB charger Green LED may shortly
blink and stay OFF, but board will keep being powered.

Board PCB v1.7 must be hardware patched to be able to reliably
enter shutdown mode. (It will keep waking up).

RTC without battery will keep powering up the board as factory default.
3V battery CR1225 and configured RTC chip is required for the board to
enter shutdown mode. There are several ways to wake up the board:

    1) Press BTN0
    2) Re-plug US1 micro-USB cable
    3) RTC ALARM (using PCF8523 arduino example)
    4) Turn on Green LED D18 (using ftx_prog or libftdi)

Just a short pulse at RTC (ALARM INT1 shorly pull down) or
Green LED shortly going HIGH is enough to wake up the board.

There is SHUTDOWN pin where FPGA can turn OFF the board.
This pin is not correctly routed on PCB v1.7 and needs
hardware upgrade to make it work.

On J2 connector there are 2 pins for 5V external power input
and output. They are located on top right, near pin labeled 27 
and US2 connector. Power is unidirectionaly routed using schottky
diodes.

Powering only from 3.3V is not possible because switching regulators
need 5V to generate 2.5V and 1.1V.

Switching regulators use ferrite core coils L1,L2,L3 which can saturate
at magnetic fields above 0.3T. Never approach neodymium magnets
near powered board.

# Programming over USB

Use ftx_prog to change product/manufacturer name of FT231X chip:

    ftx_prog --manufacturer "FER-RADIONA-EMARD"
    ftx_prog --product "ULX3S FPGA 45K v1.7"

Optionally you can change "45K" to "25K" or "12K" in regard with FPGA chip size.
Re-plug the USB and it will appear as new name which can be autodetected
with USB-serial JTAG tool.

Use Emard's fork of Xark's [FleaFPGA-JTAG](https://github.com/emard/FleaFPGA-JTAG) tool.
This tool accepts VME files for uploading to the FPGA SRAM or onboard 
SPI FLASH chip. SRAM VME file is simple to make, but when generating 
FLASH VME file, follow the Lattice 
TN02050 document: 
"Programming External SPI Flash through JTAG for ECP5/ECP5-5G"
section:
"6. Programming the SPI Flash with bitstream file using Diamond Programmer"
and select FLASH chip type:

    Family: SPI Serial Flash
    Vendor: Micron
    Device: SPI-M25F32
    Package. 8-pin VDFPN8

When it creates VME file, pass it to FleaFPGA-JTAG argument and wait
5-10 minutes, it's not particulary fast.

    FleaFPGA-JTAG bitstream-flash.vme

# Programming over JTAG header

External JTAG like FT2232 can be connected to JTAG header and it will
program SRAM and FLASH at maximum speed possible.
Even Diamond programmer can use any FT2232 module as a native programmer,
with a little help - it will work after first bitstream is programmed
over FT2232 with openocd.

Openocd accepts SVF files, everything applies the same as for VME files

    ddtcmd -oft -svfsingle -revd -if ulx3s_flash.xcf -of bitstream.svf

# Programming over WiFi

ESP-32 provides standalone JTAG SVF player over web HTTP and TCP interface for
programming and flashing in convenient and OS independent way. Web interface
requires no client software installed except web browser. It is much faster than
FT231X but still not as fast as FT2232. It accepts SVF files but you need to limit
SVF command size to max 8 kilobits "-maxdata 8", effectively it will split
upload into many shorter SVF commands because ESP-32 doesn't have enough
memory to buffer entire bitstream delivered in a long single SVF command.

    ddtcmd -oft -svfsingle -revd -maxdata 8 -if ulx3s_flash.xcf -of bitstream.svf

To start using ESP-32 first you need to compile
[ULX3S passthru from f32c project](https://github.com/f32c/f32c/tree/master/rtl/proj/lattice/ulx3s/passthru_45f)
and upload it using FleaFPGA-JTAG or external JTAG programmer.
"Passthru" bitstream configures FPGA to route lines from USB-serial to ESP-32.

Then you need to install Arduino and its ESP-32 support, and
install Emard's library [LibXSVF-ESP](https://github.com/emard/LibXSVF-ESP),
required library dependencies and 
[ESP-32 SPIFFS uploader](https://github.com/me-no-dev/arduino-esp32fs-plugin/releases/tag/v0.1)
Version "ESP32FS-v0.1.zip" worked for me.

In Arduino boards manager select this ESP-32 board:

    DOIT ESP32 DEVKIT V1

Select "Examples->LibXSVF->websvf" and optionally change
its default ssid/password. Compile and upload the code by
clicking "Sketch->Upload", check reports on lower terminal
window, successfull upload will finish with this:

    Hash of data verified.
    Leaving...
    Hard resetting...

Then upload the web page content to ESP-32 FLASH filesystem,
at websvf window click "Tools->ESP32 Sketch Data Upload".
successful upload will finish with same as above.

Connect to ESP-32 WiFi (it will either connect to your
local WiFi or become access point with
default ssid=websvf password=12345678).

In web browser open upload page "http://192.168.4.1".
If ESP-32 connected as a client, IP address will vary depending
on local network. Discover it by using WiFi access
point web interface, ARP, NMAP, or by sniffing it.
On the ESP-32 page something like this will appear:

      Select SVF File or use minimal or svfupload.py
      [File] File not selected
      [Upload]
      [0%              ]

Navigate file selector to bitstream.svf file, it will show
its size in KB. Then click "Upload", progress bar will run
from 0% to 100% in few seconds (if it's SRAM upload) and
bitstream will be started. FLASH can also be written from
web iterface it takes 2-3 minutes. Also on the web interface
there's available for download a small python commandline 
upload tool.

Note that FPGA can enable or disable ESP-32 module. If ESP-32
is disabled by newly uploaded bistream, some alert window will
pop-up after otherwise successful upload because ESP-32 cannot
close HTTP session properly.
To make it go smooth, in the bitstream make FPGA pin "wifi_en"
as input (HIGH-impedance, pull up).

Technically, ESP-32 can be loaded with such a code that
permanently holds JTAG lines while FPGA can at the same time
have in FLASH a bitstream that permanenly enables ESP-32.
Such combination will preventing JTAG from working so
ULX3S board may become "Bricked". There is jumper J3 to disable
ESP-32, its left of SD card slot. Note boards PCB v1.7 need
upgrade for this jumper to work correctly.

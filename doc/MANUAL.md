# ULX3S Manual

# Connectors

    US1    Main micro-USB for power, program and communication.
           All onboard hardware can be programmed or reconfigured
           over US1: FPGA, FLASH, WiFi, RTC.

    US2    Auxiliary micro-USB connected directly to FPGA pins
           for experimenting with user-defined USB cores or to
           connect PS/2 keyboard or mouse using USB-OTG and 
           USB-PS/2 adapters.
           Board provides power to US2.
           Board v1.7 can't be powered from US2 by default.
           Board v2.0 and higher can be powered from US2.
           If you want to power board v1.7 from US2, reverse diode
           D9 near US2 connector or short D9 with a wire.

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
           at 3.3V logical level with 56 pins from which are:
           J1 GP,GN 0-7 are single-ended pins.
           J1 GP,GN 8-13 are differential bidirectional pairs.
           J2 GP,GN 14-21 are differential bidirectional pairs.
           J2 GP,GN 22-27 are single-ended pins.
           Differential pairs can be used also as single-ended pins.
           J1 GP,GN 12 is differential primary clock capable.
           J1 GP,GN 0,1 are single-ended primary clock capable.
           J1 GP 13 and J2 GN 17 are general routing (non-primary)
           clock capable.
           J1 pins GP,GN 9-13 are shared with ESP32 WiFi on PCB v1.7.
           J1 pins GP,GN 11-13 are shared with ESP32 WiFi on PCB >v2.0.
           J2 pins GP,GN 14-17 are shared with ADC.
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

# Constraints (board pinout)

For [PCB v1.7 patched for ESP32 to work](/doc/constraints/ulx3s_v17patch.lpf)

For [PCB v2.x.x and v3.0.x](/doc/constraints/ulx3s_v20.lpf)

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

Onboard 3V lithium battery CR1225 is only to keep RTC clock running
and hold its configuration for a year or so. 3V battery is too
weak to power up complete ULX3S board.

A regulated clean and stable power supply is required,
like USB port on PC or USB charger. 5V/0.5A should be enough for fully
loaded and constantly active FPGA, SDRAM, LEDS, AUDIO, SD,
ESP32 WiFi and OLED. Maximum tolerant USB voltage is 6V. Exceeding
this limit will instantly damage the board!

If other devices are connected and powered from ULX3S J1/J2 GPIO/PMOD
connectors then more than 0.5A may be required - board can draw 2-3A
when externally loaded.

RTC without battery will keep waking up the board as factory default.
3V battery CR1225 and configured RTC chip is required for the board to
enter shutdown mode. There are several ways to wake up the board:

    1) Press BTN0
    2) Re-plug US1 micro-USB cable
    3) RTC ALARM (using MCP7940N or PCF8523 arduino example)
    4) Turn on Green LED D18 (using ftx_prog or libftdi)

Just a short pulse at RTC (ALARM INT1 shorly pull down) or
Green LED shortly going HIGH is enough to wake up the board.

There is SHUTDOWN pin where FPGA can turn OFF the board.
This pin is not correctly routed on PCB v1.7 and needs
hardware upgrade to make it work.

When RTC has 3V battery and its registers for current time,
alarm time and alarm logic are configured to trigger
RTC ALARM in the future, the board is ready to accept
SHUTDOWN signal, which is indicated when LED D11
(found on back side of the board near J1 pin 22) is
be very dimly lit, visible in the dark.

While D11 is dimly lit, board can be powered down by setting SHUTDOWN
signal to 1 from FPGA logic or by shortly and carefully connecting 1k
resistor between SHUTDOWN pin of R13 and 3.3V.
When RTC ALARM is triggered, board should turn ON. When D11 is OFF,
it is indicating that board can't enter SHUTDOWN, probably RTC ALARM
flag has to be cleared or other RTC registers configured.

On J2 connector there are 2 pins for 5V external power input
and output. They are located on top right, near pin labeled 27 
and US2 connector. Power is unidirectionaly routed using schottky
diodes.

Powering only from 3.3V is not possible because switching regulators
need 5V to generate 2.5V and 1.1V.

Switching regulators use ferrite core coils L1,L2,L3 which can saturate
at magnetic fields above 0.3T. Never approach neodymium magnets
near powered board.

# Programming options

To program ULX3S bitstream, there are many programming options:

[ujprog source from GIT](https://github.com/f32c/tools)
or [ujprog binary from EMARD](https://github.com/emard/ulx3s-bin/tree/master/usb-jtag)
or [ujprog binary from FER](http://www.nxlab.fer.hr/dl)

EMARD's fork of Xark's [FleaFPGA-JTAG source](https://github.com/emard/FleaFPGA-JTAG)
or [FleaFPGA-JTAG binary](https://github.com/emard/ulx3s-bin/tree/master/usb-jtag)

[OpenOCD soruce](https://sourceforge.net/p/openocd/code/ci/master/tree)
or [OpenOCD binaries 2019 or later](https://github.com/gnu-mcu-eclipse/openocd/releases)
(ft232r interface configuredd for ULX3S FT231X pinout)

Onboard ESP32 WiFi web interface

External USB-JTAG programmer connected to JTAG header.

Most external JTAGs should work with OpenOCD.
FT2232 or FT4232 JTAGs are recommended as they are
fast, compatible and work with Lattice Diamond native programmer.
Get Lattice original FT2232 JTAG cable or some generic FT2232 JTAG like
[FT2232 breakout board from DangerousPrototypes](http://dangerousprototypes.com/docs/FT2232_breakout_board).

# Programming over USB port "US1"

Factory default (empty) onboard FT231X has to be initialized in order
to be autodetected by "ujprog" or "FleaFPGA-JTAG" use ftx_prog.

This needs to be done only once and board will remember it
after power down. Settings enable max USB power consumption of 500mA
set autodetectable product/manufacturer name of FT231X chip, serial
number, set proper USB-serial activity LED and sets CBUS line to
wake up board when FT231X is enumerated by host computer (PC).

    ftx_prog --max-bus-power 500
    ftx_prog --manufacturer "FER-RADIONA-EMARD"
    ftx_prog --product "ULX3S FPGA 12K v3.0.3"
    ftx_prog --new-serial-number 120001
    ftx_prog --cbus 2 TxRxLED
    ftx_prog --cbus 3 SLEEP

Optionally you can change "45K" to "25K" or "12K" in regard with FPGA chip size.
Re-plug the USB and it will appear as new name which can be autodetected
with USB-serial JTAG tool.

If running linux, some udev rule is practical in order to allow non-root users
(in given example, members of "dialout" group) access to the USB-serial JTAG:

    # file: /etc/udev/rules.d/80-fpga-ulx3s.rules
    # this is for usb-serial tty device
    SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6015", \
      MODE="664", GROUP="dialout"
    # this is for ujprog libusb access
    ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6015", \
      GROUP="dialout", MODE="666"

"ujprog" tool acceps BIT or SVF files for uploading to the FPGA SRAM.
Upload to onboard FLASH can't be yet done by "ujprog"

    ujprog bitstream-sram.bit
    ujprog bitstream-sram.svf

"FleaFPGA-JTAG" tool accepts VME files for uploading to the FPGA SRAM or onboard 
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
    Verify: No

When it creates VME file, pass it to FleaFPGA-JTAG argument.
Disabled "verify" will make flashing fast, but if enabled, expect to wait
5-15 minutes. You don't need verify because bitstream always checks
its own CRC and it will just not load if FLASHed with errors.

    FleaFPGA-JTAG bitstream-flash.vme

"OpenOCD" tool accepts SVF files and can upload to SRAM or onboard FLASH.
For details see their ft232r driver documentation. In short, this
config file should help to get started, modified to set actual
CHIP_ID and bitstream.svf:

file "ft231x.ocd"

    # file: ft231x.ocd
    interface ft232r
    ft232r_vid_pid 0x0403 0x6015
    # ft232r_serial_desc 123456
    ft232r_tck_num DSR
    ft232r_tms_num DCD
    ft232r_tdi_num RI
    ft232r_tdo_num CTS
    ft232r_trst_num RTS
    ft232r_srst_num DTR
    ft232r_restore_serial 0x15
    adapter_khz 1000

file "ecp5.ocd"

    # file: ecp5.ocd
    telnet_port 4444
    gdb_port 3333

    # JTAG TAPs
    jtag newtap lfe5 tap -expected-id 0x21111043 -irlen 8 -irmask 0xFF -ircapture 0x5

    # -expected-id should match ECP5 CHIP_ID:
    # 12F: 0x21111043
    # 25F: 0x41111043
    # 45F: 0x41112043
    # 85F: 0x41113043

    init
    scan_chain
    svf -tap lfe5.tap -quiet -progress bitstream.svf
    shutdown

commandline

    openocd --file=ft231x.ocd --file=ecp5.ocd

# Programming over USB port "US2"

There is possibility to program ULX3S SPI config FLASH thru
US2 connector and
a [fork of tinyfpga bootloader](https://github.com/tinyfpga/TinyFPGA-Bootloader) loaded
to FPGA, either loaded from US1 temporary to FPGA SRAM or permanently 
to SPI config FLASH. Bootloader uses multiboot feature of ECP5 FPGA.
This programming option is experimental and not recommended for
regular use.

ULX3S with fully functional US2 bootloader can be used to program
FPGA config FLASH without use of USB-serial chip FT231X.

For bootloader convenience, it is recommended to solder D28 diode
at empty placeholder located on back side near OLED and JTAG header.
Observe diode polarity, see how other similar diodes are soldered on ULX3S.
Any general purpose or schottky diode in SOD-323 package will fit
like 1N914 1N4148 BAT54W etc. This diode will convert BTN0 function
to unconditionally switch to next multiboot image by pulling down
FPGA PROGRAMN pin.

USB bootloader is in hacky state of development, you need hi quality
USB cable, a compatible PC and selected USB port and too much luck (try
all). I think bootloader's USB bus error recovery handling is wrong
but sometimes it just works.
US2 port should enumerate as some vendor specific USB-HID USB device
and "tinyfpgasp" application can be used to write or read arbitrary
image to FPGA SPI config FLASH.

User bitstream should be uploaded to byte address 0x200000 of SPI config
FLASH at 12/25/45F (I'm not sure for 85F).
Bootloader in multiboot mode resides in multiple copies on SPI config
FLASH chip. "primary"
bootloader image is at byte address 0 of SPI config FLASH, "golden"
bootloader image is at 0x140000 address on 45F chip but its location
varies on various sizes of FPGA 12/25/45/85F. At the last 256 bytes of
FLASH are some special FPGA lattice boot state machine commands
(detailed meaning and format not yet known, it's like some primitive CPU
assembly) that setups and controls multiboot function.
Try not to overwrite any of boot related areas with something
else otherwise US1 or JTAG recovery will be required.

# Programming over JTAG header

Any openocd compatible JTAG like FT2232 can be connected to JTAG header
and it will program SRAM and FLASH at maximum speed possible.
Even Diamond programmer can use any FT2232 module as a native programmer,
with a little help - it will work after first bitstream is programmed
over FT2232 with openocd. If FT2232 is equipped with EEPROM you can use
original "FT_PROG" for windows or this linux tool to read/write the EEPROM
and confgure it:

    apt-get install ftdi-eeprom
    man ftdi_eeprom

Openocd accepts SVF files, everything applies the same as for VME files

    ddtcmd -oft -svfsingle -revd -if ulx3s_flash.xcf -of bitstream.svf

Connect JTAG cable to ULX3S JTAG header with female-female color wires.
Carefully observe the pinout. It's standard pinout to MPSSE bus A or B
written as TCK/TDO/TDI/TMS either on the JTAG board/cable or in
manual/schematics. The pinout also appears as comments in the
file "ft2232.ocd" listed below.

To be on safe side, do not to connect 3.3V line unless required by JTAG cable manual.
3.3V line is not needed for most cables as they use their own USB supply and
have default 3.3V TTL level. 3.3V power rail from ULX3S is 2A current
capable and can damage the cable if accidentally connected to wrong pin.

For FT2232 generic cable, this openocd config file can be used with above
file "ecp5.ocd" to program "bitstream.svf":

file "ft2232.ocd"

    # file: ft2232.ocd

    interface ftdi
    # ftdi_device_desc "Dual RS232-HS"
    ftdi_vid_pid 0x0403 0x6010
    ftdi_layout_init 0x3088 0x1f8b

    # default is port A if unspecified
    # pinout ADBUS 0-TCK 1-TDI 2-TDO 3-TMS 
    #ftdi_channel 0

    # uncomment this to use port B
    # pinout BDBUS 0-TCK 1-TDI 2-TDO 3-TMS 
    #ftdi_channel 1

    adapter_khz 25000

commandline

    openocd --file=ft2232.ocd --file=ecp5.ocd

# Programming over WiFi

ESP-32 provides standalone JTAG SVF player over web HTTP and TCP interface for
programming and flashing in convenient and OS independent way. Web interface
requires no client software installed but web browser. It is much faster than
FT231X but still not as fast as FT2232. It accepts SVF files but you need to limit
SVF command size to max 8 kilobits "-maxdata 8", effectively it will split
upload into many shorter SVF commands because ESP-32 doesn't have enough
memory to buffer entire bitstream delivered in a long single SVF command.

    ddtcmd -oft -svfsingle -revd -maxdata 8 -if ulx3s_flash.xcf -of bitstream.svf

To start using ESP-32 first you need to compile
[ULX3S passthru](https://github.com/emard/ulx3s-passthru)
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

ESP32 will try to connect to your local WiFi as client with
default ssid=websvf password=12345678
Insert SD card with file "ulx3s-wifi.conf" in SD root directory:

    {
       "host_name": "ulx3s",
       "ssid": "ulx3s",
       "password": "testpass",
       "http_username": "user",
       "http_password": "pass"
    }

By editing this file you can set
ssid and password for connection
to your local WiFi access point.

If client connection is unsuccessful ESP-32 it will become
access point with the same ssid and password, but so far many people
reported unsuccessful connection attempts from PC to ESP-32 in AP mode.
If you want to try, AP mode ESP-32 web address is "http://192.168.4.1"
and internet should not to work in this case :).

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

# Programming ESP32

ESP32 WiFi module soldered on ULX3S is usually shipped
to end-users with WiFi Web-JTAG application loaded in ESP32.
User can overwrite ESP32 with any other sketch  like "blink"
and then ESP32 Web-JTAG interface will temporarily disappear.

Web-JTAG ESP32 application can be restored back to factory
default state using binaries and linux scripts
from [ulx3s-bin](https://github.com/emard/ulx3s-bin) or
by recompiling from [LibXSVF-ESP Source](https://github.com/emard/LibXSVF-ESP).

Load "passthru" bitstream to FPGA config flash, install
Arduino and its ESP32 support. In "tools" pull down menu, under ESP32 
select board "WEMOS LOLIN32" and normally program ULX3S onboard ESP32
from Arduino by clicking right arrow round button (->) to upload sketch.
Examples->Digital->Blink_without_delay any you should see blue LED D22
blinking.

This automagically works because "passthru" bitstream will
redirect USB-serial ESP32 programming traffic from PC thru FPGA to ESP32.


There might be strange issues on getting this to work on windows.
On linux usually only USB-serial port access permission is required.

# Board Versions

This project is open source, freely downloadable so there can be
as many versions as here are git commits.

v3.0.3 is currently the only version which is officially being sold
at [skriptarnica](http://skriptarnica.hr/vijest.aspx?newsID=1466).
Other versions are either prototypes or independently produced.

Up to our knowledge those versions are currently circulating around.
All listed versions should work if all parts (notably BGA) are properly
soldered.

    PCB       assembly       quantity                constraints
    version   facility       produced   date         compatibility   note
    -------   ------------   --------   ----------   -------------   --------
    v1.7      PCBWay         8          dec 2017     v17patch        prototype
    v1.7      lemilica.com   1          jan 2018     v17patch        handwork
    v1.8      PCBWay         10         may 2018     v18             prototype
    v2.0.3    q3k            1          aug 2018     v20             handwork
    v2.1.2    INEM-KONČAR    35         sep 2018     v20             prototype
    v3.0.3    INEM-KONČAR    220        oct 2018     v20             for sale
    v2.0.5    Marvin         1          nov 2018     v20             handwork
    v3.0.3    INEM-KONČAR    35         jan 2019     v20             for sale

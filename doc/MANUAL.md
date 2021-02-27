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
           4 TMDS+- video out differential pairs
           1 HEAC+- pair (future expansion)
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

    OLED   7-pin 2.54 mm header OLED1 for ST7789/SSD1331/SSD1351/SSD1306
           COLOR/BW LCD/OLED 3.3V
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
           shared with ESP32

    ESP32  Placeholder to solder ESP32 module.
           ESP32 can provide standalone web interface for uploading
           bitstream into FPGA and its config FLASH. 

# Constraints (board pinout)

For [PCB v1.7 patched for ESP32 to work](/doc/constraints/ulx3s_v17patch.lpf)

For [PCB v2.x.x and v3.0.x](/doc/constraints/ulx3s_v20.lpf)

# Power

Plug US1 into PC or USB charger and board should power up.

Initial voltage rise at USB 5V line will trigger board powering
up and holding the power.

On PCB v1.7, USB-serial chip FT231X will always be powered from 5V USB.
The board has switching voltage regulators
which can be turned off to reduce power consumption.

On PCB v2.0 and later, USB-serial chip FT231X will be directly
powered only from US1. If board is powered from US2, there is diode
preventing 5V to FT231X power pin, but FT231X will still be weakly
back-powered from its other pins connected with rest of the board 
and it will appear as some load. For most practical cases, we
are lucky that FT231X appears as high-z when not directly powered.
Pin loads from unpowered FT231X may sometimes prevent
JTAG'ing from ESP32 or external JTAG, so for more reliable JTAG
we recommend to keep FT231X powered.

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

On J2 connector there are 2 pins for 5V external power input
and output. They are located on top right, near pin labeled 27 
and US2 connector. On PCB v2.0 and later boards, both J2 5V pins are
connected to US2 5V but there are onboard jumpers which can be
carefully cut and schottky diodes soldered on their pads to route the
5V power in and/or out of the board.

Powering only from 3.3V is not possible because switching regulators
need 5V to generate 2.5V and 1.1V.

Switching regulators use ferrite core inductors L1,L2,L3 which can saturate
at magnetic fields above 0.3T. Never approach neodymium magnets
near powered board.

# Low Power Mode

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

To accept SHUTDOWN D18 (green LED on top side near SD card)
must be OFF and D11 found on back side of the board near J1 pin 22.

D18 is controlled by USB-serial chip and when lit indicates that
USB-serial chip holds board constantly powered up.

D11 is controlled by RTC chip and when dimly lit (visible in the dark),
it indicates that RTC chip has ALARM INT1 pin set as inactive (high-Z, open drain).
Due to its primary function as voltage drop in analog circuit, D11 never gets fully
lit like other LEDs.

RTC must have 3V battery and registers set for current time, alarm
time and alarm logic to trigger RTC ALARM in the future. Then
board is ready to accept SHUTDOWN signal, which is indicated when LED D11
is very dimly lit, visible in the dark.

While D11 is dimly lit, and D18 is OFF, board can be powered down by
setting SHUTDOWN signal to 1 from FPGA logic or by
connecting 1k resistor between SHUTDOWN pin of R13 and 3.3V, carefully and
only for a moment. When RTC ALARM is triggered, RTC ALARM INT1 open-drain
pull down will become active and board should turn ON.

When D11 is OFF, or D18 is ON, it is indicating that board can't enter SHUTDOWN,
probably RTC ALARM flag has to be cleared or other RTC registers configured.

To get D18 OFF, either power board from US2 connector, power it from US1
with charger which doesn't do USB enumeration or power it from PC at US1
but reconfigure USB chip to turn D18 OFF:

    ftx_prog --cbus 3 DRIVE_0

# Precompiled linux opensource tools (KOST)

Almost everything you need for linux, including
Verilog and VHDL compilers, USB programmers,
everything except diamond is in
[KOST's ULX3S git releases](https://github.com/alpin3/ulx3s/releases).
Installation is simple:

    dpkg -i ulx3s-toolchain_2020.05.24-2_amd64.deb

Tools contain latest "openocd" with ft231x support.
System's "openocd" should be removed if it was
installed before:

    apt-get remove --purge openocd

# Precompiled opensource tools for all platforms

Here is nightly-fresh binary build of
[ECP5 opensource tools for all platforms](https://github.com/open-tool-forge/fpga-toolchain/releases).
This archive has ECP5 compilers and openFPGALoader
which can be used for ULX3S.
It is made for
[OrangeCrab](https://gregdavill.github.io/OrangeCrab/r0.2/),
interesting miniature ECP5 board, a must-have item.

Unzip it anywhere and set shell command search path:

    Linux              : export PATH=[path-to-bin]:$PATH
    MacOS              : export PATH=[path-to-bin]:$PATH
    Windows Powershell : $ENV:PATH = "[path-to-bin];" + $ENV:PATH
    Windows cmd.exe    : PATH=[path-to-bin];%PATH%

# Programming options

To program ULX3S bitstream, there are many programming options:

[fujprog source from GIT](https://github.com/kost/fujprog)

[ujprog source from GIT](https://github.com/f32c/tools)
or [ujprog binary from EMARD](https://github.com/emard/ulx3s-bin/tree/master/usb-jtag)
or [ujprog binary from FER](http://www.nxlab.fer.hr/dl)
Accepts *.bit or *.svf files which all tools can generate.

[OpenFPGA Loader](https://github.com/trabucayre/openFPGALoader)
can do everyting fujprog can, at the same speed or slightly
faster. Accepts *.bit files which all tools can generate.
Supports not only ULX3S but many other boards and is actively developed.

EMARD's fork of Xark's [FleaFPGA-JTAG source](https://github.com/emard/FleaFPGA-JTAG)
or [FleaFPGA-JTAG binary](https://github.com/emard/ulx3s-bin/tree/master/usb-jtag)
Accepts *.vme files which AFAIK can be created only with closed
source tools (diamond) but cannot be created with open source tools
(trellis).

[OpenOCD soruce](https://sourceforge.net/p/openocd/code/ci/master/tree)
or [OpenOCD binaries 2019 or later](https://github.com/gnu-mcu-eclipse/openocd/releases)
(ft232r interface configured for ULX3S FT231X pinout). Accepts *.svf files
which all tools can generate. It is much slower than f/ujprog.

Onboard [ESP32 WiFi FTP](https://github.com/emard/esp32ecp5).
It is much faster than f/ujprog and can also remotely write to
FLASH and SD card. Accepts *.bit files which all tools can generate.

Onboard ESP32 WiFi web interface. Accepts *.svf files which all tools can generate.

External USB-JTAG programmer connected to JTAG header.

Most external JTAGs should work with OpenOCD.
FT2232 or FT4232 JTAGs are recommended as they are
fast, compatible and work with Lattice Diamond native programmer.
Get Lattice original FT2232 JTAG cable or some generic FT2232 JTAG like
[FT2232 breakout board from DangerousPrototypes](http://dangerousprototypes.com/docs/FT2232_breakout_board).

# USB port "US1" factory default

If you have receved your fresh board it will have FT231X already
programmed, so you can skip this ftx_prog section. You can get back
here when want to return board to factory default state.

It is good idea to write on a papaer or save in a file original
USB serial number and description strings of your board if
accidentaly overwritten.

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

# Programming over USB port "US1"

If running linux, some udev rule is practical in order to allow non-root users
(in given example, members of "dialout" group) access to the USB-serial JTAG:

    # file: /etc/udev/rules.d/80-fpga-ulx3s.rules
    # this is for usb-serial tty device
    SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6015", \
      MODE="664", GROUP="dialout"
    # this is for ujprog libusb access
    ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6015", \
      GROUP="dialout", MODE="666"

"fujprog" or "ujprog" tool acceps BIT or SVF files for uploading to the FPGA SRAM
or FLASH.

    fujprog bitstream.bit
    fujprog -j flash bitstream.bit
    fujprog bitstream.svf

"openFPGALoader" tool accepts BIT files for uploading to the FPGA SRAM or
FLASH.

    openFPGALoader --board=ulx3s bitstream.bit
    openFPGALoader --board=ulx3s --write-flash bitstream.bit

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

External FT2232 JTAG cable can be used by Lattice Diamond native programmer
on linux. Prior to use the FT2232 port A or B which is connected as JTAG,
USB-serial kernel driver must be detached from the FT2232 port. 
To detach detach port B manually:

    ls /sys/bus/usb/drivers/ftdi_sio
    1-6.2:1.0  1-6.2:1.1  bind  module  uevent  unbind
    echo -n "1-6.2:1.1" > /sys/bus/usb/drivers/ftdi_sio/unbind

To detach port B automatically:

    #/bin/bash
    allow_io=`lsusb | sed -n 's/^Bus \([0-9]*\) Device \([0-9]*\): ID 0403:6010 .*/\1\/\2/p'`
    unbind_tty=`ls /sys/bus/usb/drivers/ftdi_sio/ | sed -n 's/\(.*\:1\.1\).*/\1/p'`
    sudo chmod a+rw \/dev\/bus\/usb\/$allow_io
    sudo sh -c "echo $unbind_tty > /sys/bus/usb/drivers/ftdi_sio/unbind"

When USB-serial driver is detached from port A or B, Lattice Diamond programmer
can use this port as native JTAG programmer. See also
[Versa under Linux](https://section5.ch/index.php/2017/01/26/ecp5g-versa-board-under-linux/).

For JTAG sharing with ESP32 port B should be set to high impedance
and the experimentally found solution is to set this port to FIFO or OPTO
using "ftdi_eeprom" tool
source is here
[ftdi_eeprom source](https://www.intra2net.com/en/developer/libftdi/index.php)
there's also
[ftdi_eeprom readme](http://developer.intra2net.com/git/?p=libftdi;a=blob;f=README.build)
and the binary is already in linux distro:

    apt-get install ftdi_eeprom

make "ftdi_eeprom.conf" config file, set manufacturer/product strings
to your liking but important line for high impedance for port B is
to set it as FIFO or OPTO:

    chb_type=FIFO

write config to eeprom:

    ftdi_eeprom --flash-eeprom ftdi_eeprom.conf

re-plug USB to reload new eeprom content.

# Preparing WiFi (passthru)

Passthru bitstream should be written to FPGA config flash
in order to program ESP32 FLASH and efuse by US1 usb-serial port.
Get binary passthru suitable for ULX3S board version and
FPGA chip 12/25/45/85 from 
[ulx3s-bin passhtru](https://github.com/emard/ulx3s-bin/tree/master/fpga/passthru)
or compile it from [ULX3S passthru source](https://github.com/emard/ulx3s-passthru)

    fujprog -j flash passthru.bit

"Passthru" bitstream configures FPGA to route lines from USB-serial to ESP32.

# Preparing WiFi (ESP32 efuse)

Skip this section if unsure.

ESP32 has one-time programmable efuses that need to be
properly set for using ESP32 with SD card.
SD card needs pull-up on all of its pins.
ESP32 with unprogrammed efuse needs pin GPIO12 pull-down in
order to boot from its FLASH and as GPIO12 is shared with
SD we have conflicting situation which can be resolved by
programming efuse.

efuse should be programmed by ULX3S manufacturer during test and setup phase.
A wrong efuse setting will make ESP32 module unbootable and only
fix is to replace it with new ESP32.

Remove SD card and burn efuse to ignore GPIO12 by fixing internal
module's FLASH voltage to 3.3V. This is in assumption that inside of
ESP32 is FLASH that works at 3.3V and it is currently true for all known
ESP32 WROOM modules mounted on ULX3S. If you have WROVER module, efuse
setting is different for 1.8V FLASH or it may work with SD card without
this efuse setting so don't do it. Here are archived
[ESP32 serial tools](https://github.com/emard/ulx3s-bin/tree/master/esp32/serial-uploader)
which are known to work or you can use latest from ESP.

    # WROVER only - don't apply to WROOM
    python serial-uploader/espefuse.py --port /dev/ttyUSB0 set_flash_voltage 3.3V

After this there is no way back. ESP32 should boot again and accept SD cards.

# Programming over WiFi (ESP32 micropython)

[Micropython ESP32 ECP5 programmer](https://github.com/emard/esp32ecp5)
can be used from WiFi remote shell prompt or
FTP or pull data from remote WEB server.
Faster than (f)ujprog, ESP32 keeps it all in micropython source
for easy user-customizeation and other applications.
Easy programming, rapid development.

# Programming over WiFi (ESP32 firmware)

ESP32 firmware provides standalone JTAG SVF player over web HTTP and TCP interface for
programming and flashing in convenient and OS independent way. Web interface
requires no client software installed but web browser. It is much faster than
FT231X but still not as fast as FT2232. It accepts SVF files but you need to limit
SVF command size to max 8 kilobits "-maxdata 8", effectively it will split
upload into many shorter SVF commands because ESP32 doesn't have enough
memory to buffer entire bitstream delivered in a long single SVF command.

    ddtcmd -oft -svfsingle -revd -maxdata 8 -if ulx3s_flash.xcf -of bitstream.svf

Write "passthru" to FPGA config flash as described above in section "Preparing WiFi
(passthru)".
Install Arduino and its ESP32 support, and
install Emard's library [LibXSVF-ESP](https://github.com/emard/LibXSVF-ESP),
required library dependencies and 
[ESP32 SPIFFS uploader](https://github.com/me-no-dev/arduino-esp32fs-plugin/releases/tag/v0.1)
Version "ESP32FS-v0.1.zip" worked for me.

In Arduino boards manager select this ESP32 board:

    DOIT ESP32 DEVKIT V1

Select "Examples->LibXSVF->websvf" and optionally change
its default ssid/password. Compile and upload the code by
clicking "Sketch->Upload", check reports on lower terminal
window, successfull upload will finish with this:

    Hash of data verified.
    Leaving...
    Hard resetting...

Then upload the web page content to ESP32 FLASH filesystem,
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

If client connection is unsuccessful ESP32 it will become
access point with the same ssid and password, but so far many people
reported unsuccessful connection attempts from PC to ESP32 in AP mode.
If you want to try, AP mode ESP32 web address is "http://192.168.4.1"
and internet should not to work in this case :).

If ESP32 connected as a client, IP address will vary depending
on local network. Discover it by using WiFi access
point web interface, ARP, NMAP, or by sniffing it.
On the ESP32 page something like this will appear:

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

Note that FPGA can enable or disable ESP32 module. If ESP32
is disabled by newly uploaded bistream, some alert window will
pop-up after otherwise successful upload because ESP32 cannot
close HTTP session properly.
To make it go smooth, in the bitstream make FPGA pin "wifi_en"
as input (HIGH-impedance, pull up).

Technically, ESP32 can be loaded with such a code that
permanently holds JTAG lines while FPGA can at the same time
have in FLASH a bitstream that permanenly enables ESP32.
Such combination will preventing JTAG from working so
ULX3S board may become "Bricked". There is jumper J3 to disable
ESP32, its left of SD card slot. Note boards PCB v1.7 need
upgrade for this jumper to work correctly.

Precompiled ESP32 firmware from
[ESP32 LibXSVF-ESP source](https://github.com/emard/LibXSVF-ESP):

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

Note boards PCB v3.1.x: if esptool.py can't program when passthru
bitstream is loaded, connect TMS and GND at JTAG header and try
programming then.

To avoid programming difficulties, ESP32 firmware should not
drive PIN 5 (wifi_gpio5, blue LED D22, TMS) as output first few
seconds after ESP32 boot. If PIN 5 is driven immediately at
boot, esptool.py can't program. Solution is to force PIN 5 low
at JTAG header by connecting TMS and GND (blue LED will turn ON)
and holding it at least until ESP32 programming starts.
It can be released when flash starts writing from 0x00010000.
Or simply when red LED D19 TX/RX blinks for few seconds.

# LCD/OLED Display

Solder 7-pin 2.54mm female header on ULX3S and obtain some
pin compatible display:

    1.3" 7-pin 240x240 Color ST7789 SPI LCD.
    (Best buy, cheap, very fast, good brightness).
    
    1.54" 8-pin 240x240 Color ST7789 SPI LCD.
    (Same as 1.3" but larger and costs more.
    Pin 8 (backlight) is default ON when not connected).
    
    0.95" 7-pin 96x64 Color SSD1331 SPI OLED.
    (Supported by "websvf". Expensive, very fast, full-featured, good brightness).

    1.54" 7-pin 128x128 Color SSD1351 SPI OLED.
    (Expensive, fast, low brightness).

    0.95" 7-pin 128x64 BW SSD1306 SPI OLED.
    (Expensive, no color).

![OLED COLOR DISPLAY SSD1331](/pic/oled-ssd1331-module.jpg)

Pin names on OLED module should match those written on ULX3S silkscreen.
Cheapest from ebay or aliexpress are all good and work.
Display glass may be glued a bit off-angle from module to module,
that's kinda "normal" for 7$. It can display nice and readable high
contrast color picture :)

![OLED 1-PIXEL FONT](/pic/oled-1-pixel-wide-font.jpg)

# e-ink/e-paper Display

Those displays may keep picture without any power applied
and are ideal for ULX3S in low-power sleep and wake-on-RTC.

Currently e-ink/e-paper displays are availabe on ebay and others
with pinout that can be directly plugged to J1/J2 connector.
For OLED connector, read pinout carefully, VCC and GND should be
swapped!

e-ink 1.54" v2 BW 200x200 SPI with IL3829 driver chip:

![eink154v2top](/pic/eink154v2top.jpg)
![eink154v2bot](/pic/eink154v2bot.jpg)

# US2 connector as OTG, PS/2 or sniffer

Here is list of some useful cables and adapters for US2 connector

For US2 to various things:

[micro-USB-male to USB-female aka OTG adapter](https://www.ebay.com/itm/Micro-USB-2-0-A-Female-to-B-Male-Converter-OTG-Adapter-Cable-for-Samsung-HTC-LG/311201513107)

![micro-USB-male to USB-female](/pic/micro-USB-male-to-USB-female.jpg)

For PS/2 keyboard or mouse:

[USB-male to PS/2-female](https://www.ebay.com/itm/PS-2-Adapter-Female-To-USB-Male-Converter-Keyboard-Mouse-Adaptor-Connector-Mini-/303015055836)

![USB-male to PS/2-female](/pic/USB-male-to-PS2-female.jpg)

For electrical USB sniffer you need this:

[USB-male to USB-male](https://www.ebay.com/itm/351868263369)

![USB-male to USB-male](/pic/USB-male-to-USB-male.jpg)

[1-RJ45-male to 3-RJ45-female](https://www.ebay.com/itm/RJ45-1-To-3-Ethernet-LAN-Network-Cable-Splitter-Extender-Adapter-Connector-KY/113393365472)

![1-RJ45-male to 3-RJ45-female](/pic/1RJ45-male-to-3RJ45-female.jpg)

[RJ45-male to USB-female](https://www.ebay.com/itm/2Pcs-Ethernet-RJ45-Male-to-USB-Female-Connector-Converter-Adapter-LAN-Network/391958541369)
you need 3 but it's double-packed, so buy 2, you get 4

![RJ45-male to USB-female](/pic/RJ45-male-to-USB-female.jpg)

# ETHERNET RJ45

ULX3S doesn't have onboard RJ45 ethernet but on ebay
there are cheap 100-Mbit RMII-standard pin compatible ethernet modules
which can be directly plugged into ULX3S (pins GP,GN 9-13 VCC=3.3V).
Warning: LAN8720 module will be permanently damaged if powered at 5V instead of 3.3V.

[LAN8720 RMII RJ45 Ethernet module](https://www.ebay.com/itm/1pcs-Smart-Electronics-LAN8720-network-module-Ethernet-transceiver-for-arduino/183479331440)

![LAN8720 RMII RJ45 Ethernet module](/pic/LAN8720.png)

# AUDIO Jack to Cinch Cable

ULX3S 3.5 mm audio jack is compatible with stereo earphones/headphones.
Output is loud enough, amplifier is not needed. It has 3-channel 4-bit
DAC with 75 ohm output impedance and 0-3.3V DC swing.

To use 3rd channel for SPDIF audio or compositie video together with
2-channel analog audio, use Apple/Nokia compatible 3-cinch cable.
It can be easily found on ebay, search for
"3.5mm 4 Pole Male Plug To 3 RCA (Red/Yellow/White) Female Jack Cable".

WARNING: Sony compatible 3-cinch cables are NOT SUITABLE for ULX3S!
Sony cables are the most often found in consumer audio/video shops.
Visually they look identical, but the pinout is different.
Check the unknown cable pinout with instrument.

Correct pinout is this:

![AUDIO JACK TO CINCH](/pic/cinch_jack.jpg)

# i2s-Quality Audio Module

Onboard audio jack has cheap and educative 4-bit DAC
which is good for audible tones but may be noisy.
Better audio quality can be obtained from external
I2S module PCM5102 for clean stereo PCM 192kHz 16-bit sound.
Module also has amplifiers for headphones, it is loud enough.

On ebay it is sold for about 4$.

[PCM5102 I2S Interface DAC Decoder GY-PCM5102 I2S Player Module for Raspberry Pi](https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2047675.m570.l1313&_nkw=PCM5102&_sacat=0)

![I2S AUDIO MODULE](/pic/pcm5102.jpg)

# Fast ADC/DAC

Onboard ADC allows total bandwith of 1 MSa/s, shared for all channels used.
For faster ADC/DAC there are options to connect external boards:

Module AN108 32 MSa/s 8-bit input AD9280 and 125 MSa/s 8-bit output AD9708.
It is not directly pluggable, but
[gojimmypi made adapter](https://github.com/gojimmypi/ulx3s-adda/),
which can be ordered from oshpark:
[ULX3S FPGA to AD/DA Converter Adapter
Board](https://oshpark.com/profiles/gojimmypi).

Module AN926 12-bit 2-ch 50 MSa/s AD9226 is "almost" directly pluggable,
user has to re-crimp or modify few lines of a 40-pin flat cable and it
should fit.

AN108 8-bit AD/DA 32 MSa/s IN, 125 Msa/s OUT
![AN108 8-bit AD/DA 32 MSa/s IN, 125 Msa/s OUT](/pic/an108.jpg)

AN926 12-bit 2-ch AD 50 MSa/s IN
![AN926 12-bit 2-ch 50 MSA/s](/pic/an926.png)

# Board differences

v1.7 prototype

The first prototype made. Has 45F and 32MB SDRAM.
To get ESP32 working it has to be manually wire patched.
Flash is connected as 1-bit SPI, US2 connector doesn't have
all lines needed to be both host and device. This board
doesn't have series C to GPDI connector which makes it
very sensitive to static discharge or bad GND connection.

Main reason for redesign was to get ESP32 working properly.
BTN UP, BTN RIGHT and some other pins have changed routes to
FPGA pins in later versions.

v2.0.x and v3.0.x

Very successful and widely produced boards. There are no
important differences between v2.0.x, v2.1.x and v3.0.x to the user.

Most differences are in thermal management for soldering and
reducing number of faulty produced boards. Significant problems
were at version v2.0.5 and earlier with BGA soldering and "tombstoning"
effect when resistors rise up due to unequal local temperature between
pads.

FLASH is connected as 4-bit QSPI, supports 1-bit SPI but user
must take care to hold unused lines at '1' (logic high level)
otherwise some ISSI FLASH chips will not work because of crosstalk.

BTNs are slightly different routed.

US2 connector now has 6 routes to FPGA, supports both device and host mode,
differential and single-ended connections, low-speed 1.5 Mbps
and high-speed 12Mbps.

GPDI has 220nF series capacitors for coupling.

Around v3.0.5 some unused FTDI LED line was connected to unused
pin of FPGA in schematics with idea to create fully connected secondary
openocd JTAG channel from FTDI to debug FPGA softcore RISC5 CPUs with linux
on litex and saxonsoc. Such FTDI JTAG is fully functional but very slow
and linux needs big data thruput so in practice external JTAG is used
there anyway.

Main reason for redesign was to allow placement of
ESP32-WROVER-E modules 4MB RAM/16MB FLASH.
Micropython is now used on ESP32 to control 
ULX3S boards. It is user-friendly but RAM hungry.

Second reason was some RF interference with ESP32.
When video signal 800x600 or 1024x768 is generated
and monitor connected to GPDI port, then ESP32 almost
completely looses WiFi signal. When GPDI is unplugged,
connection is restored.

SD card slot need footprint for compatibility
alternative with slide-in/out reliable but inxepensive
SD card slot which is on-stock available from common suppliers.

RTC clock runs 30 ppm too fast.

GPDI hotplug HPD doesn't work because of C coupling.

No SERDES.

v3.1.4

New prototype, currently tested.

Board accepts ESP32-WROOM and ESP32-WROVER, ESP32 JTAG glitch was
fixed by connecting JTAG to different ESP32 pins. ESP32 wiring
now should provide ESP32-RMII connectivity from WiFi to FPGA.

GPDI series C lowered from 220nF to 22nF to reduce interference. 
GPDI hotplug line now has R coupling and protection Zener
diode which should make hotplug line work.

Board accepts old and new SD card slots. Old non-hinged SD slots
with landing contacts were cheapest and I liked them most, but are
no longer available from western suppliers. They may be still available
directly from china with longer ordering times. Hinged SD card slots
are available from western suppliers, have landing contacts too and make
good connectivity but hinge is fragile and makes insertion procedure longer.
Now board supports quick slide-in/out SD card slots with wiping contacts,
similar as RPI, on-stock available from western suppliers. Contact is good
but as those are wiping contacts, friction forces will
slowly wear out contacts at each insertion. Luckily all SD
operations can be done remotely by ESP32 so number of insertions
is negligible.

7-pin OLED/LCD header is extended to 8-pin and shared with
3 SERDES input differential pairs (1xRXCLK, 2xRXDATA) coupled with
series C=22nF. Additional 2 SERDES pairs (1xRXDATA, 1xTXDATA)
are routed only to C=22nF for possible manual wire patching.

RTC load capacitors are increased from 3.3pF to 4.7pF in attempt
to reduce clock error below 20ppm.

Generally all should work as before except ESP32 pinout is now
different. wifi_gpio16 and wifi_gpio17 are gone because WROVER
needs them for internal RAM, but here are many new available, so
wifi_gpio26 and wifi_gpio27 can be used instead for example.

# Board Versions

This project is open source, freely downloadable so there can be
as many versions as here are git commits.

v3.0.3 is sold at
[skriptarnica](http://skriptarnica.hr/vijest.aspx?newsID=1466).

v3.0.8 is sold at
[Mouser](https://hr.mouser.com/Search/Refine?Keyword=ulx3s)

Other versions are either prototypes or independently produced.

Up to our knowledge those versions are currently circulating around.
All listed versions should work if all parts (notably BGA) are properly
soldered.

    PCB       assembly       quantity                constraints
    version   facility       produced   date         compatibility   note       SDRAM                 FLASH
    -------   ------------   --------   ----------   -------------   --------   ----------------      ------------
    v1.7      PCBWay         8          dec 2017     v17patch        prototype
    v1.7      lemilica.com   1          jan 2018     v17patch        handwork
    v1.8      PCBWay         10         may 2018     v18             prototype
    v2.0.3    q3k            1          aug 2018     v20             handwork   MT48LC16M16A2TG       IS25LP128F-JBLE
    v2.1.2    INEM-KONČAR    35         sep 2018     v20             prototype  MT48LC16M16A2TG       IS25LP128F-JBLE
    v3.0.3    INEM-KONČAR    220        oct 2018     v20             for sale   MT48LC16M16A2TG       IS25LP032D-JNLE-TR
    v2.0.5    Marvin         1          nov 2018     v20             handwork   MT48LC16M16A2TG       S25FL064L-ABMF
    v2.0.5    Markus         1          dec 2018     v20             handwork   MT48LC16M16A2TG       S25FL064L-ABMF
    v3.0.3    INEM-KONČAR    35         jan 2019     v20             for sale   MT48LC16M16A2TG       IS25LP128F-JBLE
    v2.0.5    Zvone          2          mar 2019     v20             handwork   MT48LC16M16A2TG       S25FL064L-ABMF
    v3.0.6    Sam Littlewood 2          mar 2019     v20             handwork
    v3.0.7    Kalle          1          jul 2019     v20             handwork
    v3.0.7    Watterott      8          aug 2019     v20             for sale   AS4C32M16SB-7TCN      W25Q128JVSIQ
    v3.0.3    Anil Gurses    1          aug 2019     v20             handwork
    v3.0.8    SierraCircuits 1          oct 2019     v20             prototype
    v3.0.8    Lolsborn       1          oct 2019     v20             handwork
    v3.0.3    INEM-KONČAR    220        oct 2019     v20             for sale   M12L2561616A-6TG2T    W25Q128JVSIQ
    v3.0.7    Watterott      88         nov 2019     v20             for sale   AS4C32M16SB-7TCN      W25Q128JVSIQ
    v3.0.8    INEM-KONČAR    1000       jul 2020     v20             for sale   IS42S16160G-7TL-TR    W25Q128JVSIQ
    v3.1.4    INTERGALAKTIK  1          nov 2020     v31             prototype  MT48LC16M16A2TG-6A    W25Q128JVSIQ

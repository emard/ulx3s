# ULX3S PCB

[ULX3S](http://radiona.org/ulx3s) = [University digital Logic](https://www.fer.unizg.hr/en/course/diglog) Learning
Xtensible board release 3 with SDRAM,
Successor of [ULX2S](http://github.com/emard/ulx2s).

[Manual](/doc/MANUAL.md) *
[Quickstart Binaries](http://github.com/emard/ulx3s-bin) *
[ULX3S at Kitspace](https://kitspace.org/boards/github.com/emard/ulx3s)

3D preview

![TOP](/pic/ulx3st.jpg)
![BOTTOM](/pic/ulx3sb.jpg)

Prototypes available
at [SKRIPTARNICA](http://skriptarnica.hr/vijest.aspx?newsID=1466),
local shop inside of [FER](https://www.fer.unizg.hr/) university.

This is a small (94x51 mm) standalone FPGA board 
for education, research and general purpose, with a full 
featured selection of chips which I all wanted on
a low-cost PCB, but haven't found on the market.
It's open source and open hardware because if it is
good for our development of [f32c](http://github.com/f32c/f32c) SOC,
it should be also good to other projects.

ULX3S will carry all digital logic on our
research, [education](https://www.fer.unizg.hr/en/course/diglog) and
[makerspace](https://radiona.org) projects in next 5 years.

ULX3S is standalone embeddable gadget with onboard display, buttons,
storage, WiFi and compatible connectors.

ULX3S can do things no other board can.

ULX3S can self-reflash with a bitstream sent
remotely from web interface over WiFi or from SD
card browsed by onboard OLED display and buttons.

ULX3S can completely power down and wakeup from
battery backed RTC.

ULX3S has rich range of chips and connectivity
required for many other open source projects:
SDRAM, USB, PS/2, SDCARD, Digital Video, FLASH, RTC, I2C, OLED, AUDIO, ADC,
onboard FM/ASK antenna 88-433.92 MHz and 56 GPIO pins routed as differential
pairs and have pinout that is PMOD compatible. There are 12 true
differential bidirectional pairs and 16 single-ended pairs.

ULX3S is sufficiently equipped to
emulate [Amiga](https://github.com/emard/Minimig_ECS) retro
computer and run its games, but can do much more like
running [Linux](https://twitter.com/fpga_dave/status/1053290842809683968).

[Schematics](/doc/schematics.pdf) and PCB started with KiCAD 4.
After version v1.8 project switched to KiCAD 5 PCB editor:

    kicad ulx3s.pro

View generated gerbers

    gerbv -p plot/ulx3s.gvp

# Features

FPGA: Lattice ECP5 [LFE5U-85F-6BG381C](http://www.latticesemi.com/~/media/LatticeSemi/Documents/DataSheets/ECP5/FPGA-DS-02012.pdf?document_id=50461) (12/25/45/85K LUT)

USB: FTDI [FT231XS](https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT231X.pdf) (500kbit JTAG and 3Mbit USB-serial)

GPIO: 56 pins (12 true differential pairs, 16 single-ended pairs),
[PMOD](https://reference.digilentinc.com/_media/pmod:pmod:originalPmodInterfaceSpecification.pdf) compatible
with power out 3.3V/1A 2.5V/1.5A

RAM: 16-bit SDRAM [MT48LC32M16](https://www.micron.com/~/media/Documents/Products/Data%20Sheet/DRAM/256Mb_sdr.pdf) (8/16/32/64 MB)

Flash: Quad-SPI Flash [IS25LP128F](http://www.issi.com/WW/pdf/25LP-WP128F.pdf) (4/8/16 MB for FPGA config and user data)

Storage: Micro-SD slot

LEDs: 11 (8 blink-LEDs, 2 USB LEDs, 1 WiFi LED)

Buttons: 7 (4 direction, 2 fire, 1 power button)

Audio: 3.5 mm jack with 4 contacts (analog stereo + digital audio or composite video)

Video: GPDI connector with 3.3V-5V I2C bidirectional level shifter

Display: placeholder for 0.96" SPI COLOR OLED [SSD1331](https://drive.google.com/file/d/0B5lkVYnewKTGRlpxcEdWaXNvWnM/view)

WiFi+bluetooth: placeholder for [ESP-32](https://www.espressif.com/sites/default/files/documentation/esp32_datasheet_en.pdf) (Standalone JTAG web interface over WiFi)

Antenna: 88-108/433 MHz FM/ASK onboard

ADC: 8 channels, 12 bit, 1 MSa/s [MAX11125](https://datasheets.maximintegrated.com/en/ds/MAX11120-MAX11128.pdf) (4/8-ch, 8/10/12-bit, 0.5/1 MSa/s)

Power: 3 Switching voltage regulators: 1.1V, 2.5V, 3.3V (1.5/2A)

Clock: 25 MHz onboard, external differential clock input

Low power sleep: 5uA/5V standby, RTC [MCP7940N](http://ww1.microchip.com/downloads/en/DeviceDoc/20005010F.pdf) clock wakeup, power button, 32768 Hz quartz and battery

GPDI is General Purpose Differential Interface,
Electrically LVDS, mostly TMDS tolerant
female receptacle more-or-less compatible
with digital monitors/TVs

# Production

Independent production
like [q3k](https://twitter.com/q3k/status/1029010026269167618) or
[samlittlewood](https://twitter.com/samlittlewood/status/1108531208001077250) is
welcome and desirable under conditions of [modified MIT LICENSE](/LICENSE.md).
If you do manual assembly here is [minimal parts list](/doc/MINIMAL.md).

ZIP the gerbers and send them to manufacturer:

    zip -r /tmp/ulx3s.zip plot/ulx3s

If you are going to order this project by yourself, it is important
what manufacturer to choose for PCBA (PCB and Assembly) service.

Parts can be ordered from [Detailed BOM](/doc/ulx3s_bom.csv)
or from [ULX3S at Kitspace](https://kitspace.org/boards/github.com/emard/ulx3s),
which automatically submits [Simplified 1-click BOM](/1-click-bom.tsv) by
clicking on "Digikey" or "Mouser" button. On each click, Digikey and Mouser will keep
accumulating the BOM in the shopping cart. Number of unique parts on Digikey and Mouser
should be equal but DigiKey may split some parts (LEDs) in multiple rows.
To reset shopping cart, click "New Cart" or "New Basket".
Kitspace may be updated with about 1 day delay after this project update.

Choose PCBA manufacturer which can produce PCB of IPC CLASS 3 quality,
5/5 mil trace resolution and 0.2 mm holes.
Avoid manufacturer who claims "quality" and "satisfaction" but doesn't
really know what will be IPC CLASS rating for this project.

PCBA manufacturer prices for the parts should be approximately equal as those
from distributors like [Mouser](http://www.mouser.com) or [DigiKey](http://www.digikey.com).
Avoid any PCBA manufacturer who asks 3$ for the 1$ part or 40$ for the 30$ part.
Select [Mouser](http://www.mouser.com) language/location icon to PCBA manufacturer
country of origin and $-currency to check is PCBA manufacturer telling the truth
about prices.

Before soldering the parts, ask manufacturer for [pictures](/pic/ulx3sb-v18.jpg) of PCB.
CLASS 3 demands, among other things, that all drill holes stay inside of VIA pads.
If some holes [break-out](/pic/ulx3sb-v18-breakout-c19.png) from pads,
ask manufacturer to make new PCBs with better drill and copper layer alignment.

[PCBCART](http://www.pcbcart.com) offers CLASS 3 quality and assembly at reasonable cost.
Prices for the parts are equal to [Mouser](http://www.mouser.com).

Don't pay everything at once. Following payment phases during the
PCBA production are recommended:

    1. Pay for the parts
    2. Manufacturer orders the parts and optionally negotiates with you about part numbers.
       Depending on market availability, some parts may come in different physical package.
    3. Send updated gerbers which fit to ordered parts.
    4. Pay for PCB
    5. Manufacturer sends pictures of produced PCB for your inspection.
       If anything looks suspicious, ask also for X-ray imaging.
    6. Pay for the assembly and shipping.

Nobody wants quality issues, so it is good to ask if manufacturer has qualified personnel
able to follow instructions 
for [ULX3S self-test](https://github.com/emard/ulx3s-bin) before shipping.

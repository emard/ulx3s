# ULX3S PCB

This is work-in-progress place for putting
some wishes of a small FPGA board.

Instead of describing in written, 
it is better explained when drawn in kicad:

    kicad ulx3s.pro

Currently this is only partial schematics and partial floorplanning.
PCB is not routed. Some footprintes are collected and some are incomplete.

An overview if the parts will fit in the space
how it will look.

From production of this, we are far, far away :)

# Features

3.5 mm jack footprint

Switching voltage regulators

USB footprints without thru-holes

SPI OLED placeholder (thru hole probably)

FTDI 2232 usb-jtag chip

SPI flash chip

SDRAM chip

LEDs: 8 blinkleds, 1 usb led

RTC clock, quartz and battery

3.3V-5V I2C bidirectional level shifter for GPDI

GPDI is General Purpose Differential Interface,
Electrically LVDS, mostly TMDS tolerant
female receptacle more-or-less compatible
with digital monitors/TVs

# Todo

Completing FPGA IO bank shcematics blocks

Check SD card slot footprint

Oscillators (25/50/100 MHz)

rearrange PushButtons: 6 (2+4)

             U
    A B    L D R

IR camera placeholder

OV767 color camera placeholder

2.54 mm external JTAG header

# ULX3S PCB

This is work-in-progress place for putting
some wishes of a small FPGA board.

Instead of describing in written, 
it is better explained when drawn in kicad:

    kicad ulx3s.pro

Schematics and PCB floorplanning are mostly complete.
PCB routing is not complete (about 50 routes missing).

# Features

Power: Switching voltage regulators

Low power: RTC clock wakeup, quartz and battery

USB: FTDI FT231XS (1Mbit JTAG and 3Mbit usbserial)

GPIO: All differential, PMOD-friendly

RAM: SDRAM

Flash: SPI flash chip for FPGA config

Storage: Micro-SD slot

LEDs: 16 (8 blink-LEDs, 2 USB leds)

Buttons: 6 (4 direction and 2 fire buttons)

Audio: 3.5 mm jack footprint

Video: GPDI connector with 3.3V-5V I2C bidirectional level shifter

Display: placeholder for 0.96-1.3" SPI OLED COLOR or B/W

WiFi+bluetooth: placeholder for ESP-32 (JTAG and serial over WiFi possible)


GPDI is General Purpose Differential Interface,
Electrically LVDS, mostly TMDS tolerant
female receptacle more-or-less compatible
with digital monitors/TVs

# Board

[Schematics](/doc/schematics.pdf)

3D preview

![TOP](/pic/ulx3st.jpg)
![BOTTOM](/pic/ulx3sb.jpg)

# Todo

Improve Power supply routing

2.54 mm external JTAG header

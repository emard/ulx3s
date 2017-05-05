# ULX3S PCB

This is work-in-progress place for putting
some wishes of a small (94x51 mm) FPGA board.

Instead of describing in written, 
it is better explained when drawn in kicad:

    kicad ulx3s.pro

[Schematics](/doc/schematics.pdf) is mostly complete.
PCB routing is not complete (about 50 routes missing).

3D preview

![TOP](/pic/ulx3st.jpg)
![BOTTOM](/pic/ulx3sb.jpg)

# Features

FPGA: Lattice ECP5 LFE5U-25F-6BG381C

USB: FTDI FT231XS (1Mbit JTAG and 3Mbit usbserial)

GPIO: All differential, PMOD-friendly

RAM: SDRAM

Flash: SPI flash chip for FPGA config

Storage: Micro-SD slot

LEDs: 16 (8 blink-LEDs, 2 USB leds)

Buttons: 6 (4 direction and 2 fire buttons)

Audio: 3.5 mm stereo jack

Video: GPDI connector with 3.3V-5V I2C bidirectional level shifter

Display: placeholder for 0.96-1.3" SPI OLED COLOR or B/W

WiFi+bluetooth: placeholder for ESP-32 (JTAG and serial over WiFi possible)

Power: 3 Switching voltage regulators: 1.2V, 2.5V, 3.3V

Low power sleep: RTC clock wakeup, quartz and battery


GPDI is General Purpose Differential Interface,
Electrically LVDS, mostly TMDS tolerant
female receptacle more-or-less compatible
with digital monitors/TVs


# Todo

Finish routing and especially improve Power
section (thicker power lines, separately routed feedback)

2.54 mm external JTAG header

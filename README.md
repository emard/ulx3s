# ULX3S PCB

This is work-in-progress place for putting
some wishes of a small (94x51 mm) FPGA board.

Instead of describing in written, 
it is better explained when drawn in kicad:

    kicad ulx3s.pro

[Schematics](/doc/schematics.pdf) is mostly complete.
PCB routing is complete, but needs improvement
mainly for the power supply.

3D preview

![TOP](/pic/ulx3st.jpg)
![BOTTOM](/pic/ulx3sb.jpg)

# Features

FPGA: Lattice ECP5 LFE5U-25F-6BG381C

USB: FTDI FT231XS (1Mbit JTAG and 3Mbit usbserial)

GPIO: All differential, PMOD-friendly

RAM: 32MB SDRAM MT48LC16M16

Flash: 8MB SPI flash S25FL164 for FPGA config

Storage: Micro-SD slot

LEDs: 10 (8 blink-LEDs, 2 USB leds)

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

    [x] Resistors for LEDs
    [x] Move USB LEDs from bottom to top side
    [ ] Improve SDRAM routing - use VIAs for closest pins
    [x] Increase thickness of power lines (5V, 3.3V, 2.5V)
    [x] Compile a f32c bitstream using the schematics
    [ ] Compile differential GPDI output
    [ ] Connect more lines from ESP-32 to FPGA
    [ ] Connect FPGA USB D+/D- with 1.5k pullup in USB 1.1 (full speed) mode
    [ ] Jumpers to switch 2.5V/3.3V for left IO banks
    [x] External JTAG header
    [ ] Move WiFi Disable jumper above the buttons
    [x] Sprinkle 2.2F capacitors on power lines
    [ ] Spice simulation of power-up/shutdown network
    [ ] Dedicated antenna pin
    [x] 27ohm D+/D- to FT231XS
    [ ] DIP switch (4 switches)
    [ ] MAX11123 ADC SPI
    


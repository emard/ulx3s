# PCB v1.7 upgrade

This is the first board produced, most important
parts work which is mirracle in itself, and there
are some mistakes, luckily most of them can be fixed.

FIX: Replace this parts:

    D11=LED (High efficiency RED recommended)
    R4,R25,R26=4.7k

D11 and R4 are are on the back side on the left,
under the edge of SDRAM chip.

R25 and R26 are on the back side top,
under the GPDI connector.

Optionally, as alternative software shutdown, 
connected J2 "25-" pin to R13-D15 junction.

Mount:

    SDCARD:  SCHD3A0100
    U11 I2C:     PCA9306D SOIC-8 150-mil
    U10 FLASH:   IS25LP032D-JNLE-TR SOIC-8 150mil
    U9 WIFI:     ESP32, but not all pins! read below:

Don't connect ESP32 pins leading to SD card
those are 6 central pins from on the top 10-pin row of
ESP32 chip (only 2 pins on left side and 2 pins on right
side shuould be connected). Either cut the traces or carefully
solder without touching SD card pins.

# What is fixed

Shutdown:

on assembled PCB v1.7, D11=1N4148 and R4=15k will
keep waking the board up after shutdown signal because FT231x internal
regulator will provide enough voltage (cca 2.5V will appear at 3.3V line)
and that is enough to wakeup the board because voltage
on ENABLE pin at switching regulators will be above its turn on
threshold of 1.5V.

Using higher voltage drop diode (RED, YELLOW or GREEN LED cca 1.7-2V, not
BLUE or WHITE) and adequate resistor, the voltage at ENABLE pin is now about
1.3V, inside of the switching regulator's hysteresis range. ENABLE is
not above turn-on threshold neither below turn-off threshold so it will
self-hold switching regulator during normal operation and at controlled
shutdown signal, it will drop below turn-off threshold, allowing reliable
shutdown.

Software shutdown is not routed to BGA pads so alternative patch is
to connect any GPIO (we recommend "25-") to SHUTDOWN.

I2C:

Too low pull up resistors (470 ohm) are at 5V side of the level converter PCA9306
and some monitors won't tolerate that. Data traffic at i2c will be
errorneously received by some monitors and some serious problem may arrise
if monitor interprets some data garbage as random write command, overwriting
its internal settings, then monitor will become useless.

Correct pull up resistors are 4.7k and they work properly.

WIFI:

On PCB v1.7, SD card is connected to ESP32 pins that are widely advertised
as SD card pins, but the problem is those pins are shared with internal flash
chip and ESP32 won't boot from its SPI FLASH if anything is connected there.
SD card should be connected on some other pins, probably HSPI. It has not
yet been verified will that work.

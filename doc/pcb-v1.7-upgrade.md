# PCB v1.7 upgrade

This is the first board produced, most important
parts work which is mirracle in itself, and there
are some mistakes, luckily most of them can be fixed.

Mount:

    U3, U4, U5:  TLV62569DBV
    SDCARD:      SCHD3A0100
    U11 I2C:     PCA9306D SOIC-8 150-mil
    U10 FLASH:   IS25LP032D-JNLE-TR SOIC-8 150mil
    U9 WIFI:     ESP32, but not all pins! read below:

FIX: Replace this parts:

    D11=LED (High efficiency RED recommended)
    R4,R25,R26=4.7k

D11 and R4 are are on the back side on the left,
under the edge of SDRAM chip.

R25 and R26 are on the back side top,
under the GPDI connector.

Optionally, as alternative software shutdown, 
connect J2 "25-" pin to R13-D15 junction.


Don't connect ESP32 pins leading to SD card,
in the top 10-pin row, connect only 2 pins on left side and 2 pins on right
and leave 6 central pins unconnected. GND and VCC
can be connected, but no other SD signal pins.
Either cut the traces or carefully solder without 
touching those pads.

Cut WIFIEN trace and connect it to the junction of
R35 and J3, jumper should work then.

# What is fixed

Shutdown:

PCB v1.7 assembled comes with D11=1N4148 and R4=15k, those will
keep waking up the board after shutdown signal because FT231x internal
regulator will provide some voltage (cca 2.5V will appear at 3.3V line)
and that is enough to wake up the board because voltage
on ENABLE pin at switching regulators will be above its turn on
threshold of 1.5V.

Using higher voltage drop diode (RED, YELLOW or GREEN LED cca 1.7-2V, not
BLUE or WHITE) and adequate resistor, the voltage at ENABLE pin is now about
1.3V, inside of the switching regulator's hysteresis range. ENABLE is
not above turn-on threshold neither below turn-off threshold so it will
self-hold switching regulator during normal operation and at controlled
shutdown signal, it will drop below turn-off threshold, allowing reliable
shutdown.

Software shutdown is not routed to BGA pads. It is possible to connect
any GPIO (we recommend "25-") to SHUTDOWN.

I2C:

Too low pull up resistors (470 ohm) are at 5V side of the level converter PCA9306
and some monitors will receive niose with that. If data traffic at i2c is
not received 100% error-free, some monitors will get into serious problems.
When monitor interprets some data garbage as random write command and
overwrites its internal settings, such monitor might become premanently
useless. Correct pull up resistors are 4.7k and they should work properly.

WIFI:

On PCB v1.7 SD card is connected to those ESP32 pins which are widely advertised
as SD card pins, but those pins are shared with internal SPI FLASH.
So ESP32 won't boot if anything is connected there.
SD card could be connected on other pins, probably shared with OLED.
It has not yet been tested, so no patch recommendation yet.

WiFi-OFF jumper J3 doesn't have priority over FPGA enable.
If ESP32 needs to be disabled (for example, it keeps driving JTAG)
and FPGA runs bitstream which holds WiFi enabled, then J3 jumper will not
disable WiFi chip because WIFIEN is connected to wrong pin of R35.

# ULX3S Examples - Open Source Blinky

This blinky is based on the [ULX3S-Blinky project](https://github.com/DoctorWkt/ULX3S-Blinky) from @Doctorwkt. This example blinks an LED using FPGA code.

It is assumed the yosys, nextpnr toolchain has been already installed. If not, see [instructions here](../../OpenSource-toolchain/README.md)

Optionally copy a fresh [ulx3s_v20.lpf constraint file](../../../doc/constraints/ulx3s_v20.lpf).

```
cp -f ../../../doc/constraints/ulx3s_v20.lpf ./ # optionally copy an updated lpf file
```

On linux, the regular `ujprog` can be used:

```
make clean
make ulx3s.bit
../../bin/ujprog ulx3s.bit
```

For Windows WSL, there is no USB support, but the Windows executable `ujprog.exe` can be used.

```
make clean
make ulx3s.bit
../../bin/ujprog.exe ulx3s.bit
```

for the 12F on WSL:

```
make clean
make ulx3s.bit -f Makefile.12F
../../bin/ujprog.exe ulx3s.bit
```

See also [other examples](../../README.md)

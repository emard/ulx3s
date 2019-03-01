# ULX3S Examples - Open Source Blinky

This blinky is based on the [ULX3S-Blinky project](https://github.com/DoctorWkt/ULX3S-Blinky) from @Doctorwkt. This example blinks an LED using FPGA code.

```
# cp -f ../../../doc/constraints/ulx3s_v20.lpf ./ 
make clean
make ulx3s.bit
../../bin/ujprog.exe ulx3s.bit
```

for the 12F:

```
make clean
make ulx3s.bit -f Makefile.12F
../../bin/ujprog.exe ulx3s.bit
```

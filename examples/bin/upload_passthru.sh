#!/bin/bash
# upload_passthu.sh by gojimmypi
#
# Successful output should look like this:
#
# ULX2S / ULX3S JTAG programmer v 3.0.92 (built Feb 18 2019 10:55:47)
# Using USB cable: ULX3S FPGA 12K v3.0.3
# Programming: 100%

# note WSL does not current support native USB drivers, but we can call the Windows exe that does
if grep -q Microssoft /proc/version; then
  # if WSL, then use Windows ujprog.exe
  ./ujprog.exe passthru_implementation_12F.bit
else
  # use the linux ujprog
  ./ujprog     passthru_implementation_12F.bit
fi
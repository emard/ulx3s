#!/bin/bash
# upload_blinky.sh by gojimmypi
#
# set ULXS3_COM environment variable for ULX3S com port (COMnn or /dev/ttySnn)
#
# for Windows users: 
#   when editing this file, it *must* be saved using only "unix style" LF line delimiters
#   see also sudo apt-get install dos2unix
#   the esptool.exe can only be used with WSL here due to line continuation chars (^ for DOS)

# see https://github.com/Microsoft/WSL/issues/423#issuecomment-221627364 

# check to see if there's already a ULXS3_COM, perhaps from .bashrc or prior export.
if [ -n "$ULXS3_COM" ]; then
  echo Found existing ULXS3_COM=$ULXS3_COM
else  
  # if we don't yet have a value for ULXS3_COM, check to see if we are in WSL or regular inux
  if grep -q Microssoft /proc/version; then
    ULXS3_COM=${ULXS3_COM:="COM13"}
  else
    ULXS3_COM=${ULXS3_COM:="/dev/ttyS13"}
  fi
  echo Using ULXS3_COM=$ULXS3_COM
fi


if grep -q Microssoft /proc/version; then
  # call the esptool.exe when in WSL
  ./esptool.exe --chip esp32                        \
                --port $ULXS3_COM                   \
                --baud 921600                       \
                --before default_reset              \
                --after hard_reset write_flash      \
                -z                                  \
                --flash_mode dio                    \
                --flash_freq 80m                    \
                --flash_size detect 0xe000  boot_app0.bin          \
                                    0x1000  bootloader_dio_80m.bin \
                                    0x10000 Blink.ino.bin          \
                                    0x8000  Blink.ino.partitions.bin
else 
  # call the python method otherwise
  python esptool.py --chip esp32                    \
                --port $ULXS3_COM                   \
                --baud 921600                       \
                --before default_reset              \
                --after hard_reset write_flash      \
                -z                                  \
                --flash_mode dio                    \
                --flash_freq 80m                    \
                --flash_size detect 0xe000  boot_app0.bin          \
                                    0x1000  bootloader_dio_80m.bin \
                                    0x10000 Blink.ino.bin          \
                                    0x8000  Blink.ino.partitions.bin
fi
                                
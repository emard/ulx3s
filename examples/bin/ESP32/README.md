# ULX3S examples bin/ESP32

These are the binary files to get started quickly with ESP32. 

Be sure to have the passthru app loaded before attempting to program the EESP32.

These 4 files are loaded with the `--flash_size detect` parameter for `esptool` at these ESP32 addresses:

	 0xe000  boot_app0.bin          
	 0x1000  bootloader_dio_80m.bin  
	 0x10000 Blink.ino.bin           
	 0x8000  Blink.ino.partitions.bin

`esptool.exe` - Windows / WSL executable for programming the ESP32

`esptool.py` - python script for programming the ESP32

[upload_blinky.bat](./upload_blinky.bat) - DOS batch file for uploading blinky to ESP32

[upload_blinky.sh](./upload_blinky.sh) - BASH script for uploading blinky to ESP32



if "%ULXS3_COM%" == "" SET ULXS3_COM=COM13
@echo using ULXS3_COM=%ULXS3_COM%

esptool.exe     --chip esp32                        ^
                --port "%ULXS3_COM%"                ^
                --baud 921600                       ^
                --before default_reset              ^
                --after hard_reset write_flash      ^
                -z                                  ^
                --flash_mode dio                    ^
                --flash_freq 80m                    ^
                --flash_size detect 0xe000  boot_app0.bin          ^
                                    0x1000  bootloader_dio_80m.bin ^
                                    0x10000 Blink.ino.bin          ^
                                    0x8000  Blink.ino.partitions.bin
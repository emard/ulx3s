# Diamond passthru

This FPGA passthru app, needed to program the ESP32 since is it not directly accessible, is written in VHDL.

Open the Diamond lpf project file:

![Diamond-open-passthru](../images/Diamond-open-passthru.PNG )

Next, click on the Process tab, check the Bitstream File checkbox, right-click "Run all": 

![Diamond-open-passthru](../images/Diamond-process-create-bitstream.PNG )

Once the `passthru_implementation.bit` FPGA binary file is created (or copied from [examples/bin](../../bin/README.md)), it can be loaded onto the ULX3S with `ujprog`:

```
ujprog.exe Diamond_Blinky_Implementation.bit
```


For a more detailed example using Diamondd, see the [Diamond Blinky Example](../../blinky/Diamond/README.md)

See also [other examples](../../README.md)

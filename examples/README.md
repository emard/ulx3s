# ULX3S Examples

# Blinky in Lattice Diamond for Windows
This blinky is based on the [blinky project](https://github.com/DoctorWkt/ULX3S-Blinky) from @Doctorwkt.

To create a Lattice Diamond project, click on File - New - Project ...
![alt text](./blinky/images/diamond-project-step0.PNG )

Give the project a name, in this case "Blinky", then click "Next":

![alt text](./blinky/images/diamond-project-step1.PNG )

add the `blinky.v` source file, then click "Next".

![alt text](./blinky/images/diamond-project-step2.PNG )
 
specify your target (in this case a 12F is shown), then click "next":

![alt text](./blinky/images/diamond-project-step3.PNG )

The default is Lattise LSE, then click "Next":

![alt text](./blinky/images/diamond-project-step4.PNG )

Project summary information will be shown, then click "Next":

![alt text](./blinky/images/diamond-project-step5.PNG )

next, add the [lpf constraint file](../doc/constraints/ulx3s_v20.lpf) to the project (or copy the contents to `Blinky.lpf`:

![alt text](./blinky/images/diamond-project-add-lpf.PNG )

To make the bitfile, click on the Process tab, and check the Bitstream File checkbox. Then right-click and "Run"

![alt text](./blinky/images/diamond-project-make-bitfile.PNG )

If the file was created successfully, there will be an indication in the Output View:

![alt text](./blinky/images/diamond-Blinky-bitfile-success-output.PNG )

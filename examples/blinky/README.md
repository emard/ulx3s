# ULX3S Examples

# Blinky in Lattice Diamond for Windows
This blinky is based on the [ULX3S-Blinky project](https://github.com/DoctorWkt/ULX3S-Blinky) from @Doctorwkt.

To create a Lattice Diamond project, click on File - New - Project ...
![new project step 0](./images/diamond-project-step0.PNG )

Give the project a name, in this case "Diamond", then click "Next":

![new project step 1](./images/diamond-project-step1.PNG )

add the `blinky.v` source file, then click "Next".

![new project step 2](./images/diamond-project-step2.PNG )
 
specify your target (in this case a 12F is shown), then click "next":

![new project step 3](./images/diamond-project-step3.PNG )

The default is Lattise LSE, then click "Next":

![new project step 4](./images/diamond-project-step4.PNG )

Project summary information will be shown, then click "Next":

![new project step 5](./images/diamond-project-step5.PNG )

next, add the [lpf constraint file](../doc/constraints/ulx3s_v20.lpf) to the project (or copy the contents to `Blinky.lpf`):

![add lpf](./images/diamond-project-add-lpf.PNG )

To make the bitfile, click on the Process tab, and check the `Bitstream File` checkbox in the `Export Files` section. Then right-click and select "Run:

![makew bitfile](./images/diamond-project-make-bitfile.PNG )

If the file was created successfully, there will be an indication in the Output View:

!bitfile success](./images/diamond-Blinky-bitfile-success-output.PNG )

Unfortunately, Lattice Diamond does not see the FTDI FT232 chip:

![no FT232 detected](./images/diamond-programmer-no-FT232-detected.PNG )

So we'll need to use the [ujprog](https://github.com/f32c/tools/tree/master/ujprog) utility. Precompiled binaries can be found in [emard/ulx3s-bin](https://github.com/emard/ulx3s-bin), such as [this one](https://github.com/emard/ulx3s-bin/tree/master/usb-jtag/win64mingw).

Note there may be some issues running the Windows version in WSL. See https://github.com/f32c/tools/issues/8 and https://github.com/f32c/tools/pull/9, specifically it seems when [launching from VoIFS](https://github.com/f32c/tools/pull/9#issuecomment-465693978) in WSL. See also [this blog](https://gojimmypi.blogspot.com/2019/02/ulx3s-ujprog-on-windows-wsl-or-minggw.html) for tips on compiling `ujprog` for Windows.

The bitfile can be found in the implementation directory (in this case Blinky_Implmentation):

![bitfile location](./images/diamond-bitfile-location.PNG )

You can open a DOS command prompt simply by typing CMD in the path, and press enter:

![bitfile location command prompt](./images/diamond-bitfile-location-cmd.PNG )

Assuming the f32c tools are in c:\workspace\f32c_tools like this:

```
c:
cd\workspace
git clone https://github.com/f32c/tools.git f32c_tools
```

The bitfile can be uploaded like this:

```
\workspace\f32c_tools\ujprog\ujprog.exe Diamond_Blinky_Implementation.bit
```

![ujprog upload](./images/diamond-bitfile-ujprog-upload.PNG )

If the LED's are not blinking, ensure the proper ldf file is in bold as the Active Preference File.

![set active lpf](./images/diamond-project-active-lpf.PNG )


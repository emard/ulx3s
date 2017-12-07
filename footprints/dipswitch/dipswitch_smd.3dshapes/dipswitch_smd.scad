/*
Open freecad, select Workbench OpenSCAD
import file, select group and export to
VRML 2.0 (wrl file)
https://www.freecadweb.org/wiki/Import_OpenSCAD_code
*/

n_switches=4; // number of dip switches
pitch=2.54; // pin pitch

body=[(n_switches+0.5)*pitch, 3*pitch, 1.5*pitch];
height=pitch/8; // body above z axis

swhole=[pitch*0.5,pitch,pitch*0.5];
button=[pitch*0.4,pitch*0.4,pitch*0.5];

font = "Liberation Sans";
letter_size = pitch/2;
letter_height = pitch/16;

module letter(l)
{
  // Use linear_extrude() to make the letters 3D objects as they
  // are only 2D shapes when only using text()
  linear_extrude(height = letter_height)
  {
	text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
  }
}

// 2 pins for 1 switch
module pin_smd()
{
  translate([0,0,pitch/8])
      cube([pitch/3,pitch*0.75,pitch/4],center=true);
}

module dipsw_smd()
{
  translate([0,0,body[2]/2+height]) // little above
    union()
    {
      // cut off holes for switches
      difference()
      {
        color("maroon")
          cube(body,center=true);
        // holes for switches
        for(i = [0:n_switches-1])
        {
          color("maroon")
          translate([(i-n_switches/2+0.5)*pitch,0,body[2]/2-swhole[2]/2+0.01])
            cube(swhole,center=true);
        }
      }
      // place the switch buttons and letters
      for(i = [0:n_switches-1])
      {
        translate([(i-n_switches/2+0.5)*pitch,swhole[1]/2-button[1]/2-(swhole[0]-button[0])/2,body[2]/2-button[2]/2+0.01])
          color("white")
            cube(button,center=true);
        translate([(i-n_switches/2+0.5)*pitch,-body[1]/2+letter_size,body[2]/2])
          color("white")
            letter(chr(48+(i+1)%10));

      }
      // text "ON"
      translate([(0-n_switches/2+0.5)*pitch,    body[1]/2-letter_size,body[2]/2])
          color("white")
            letter("ON");
      // the pins
      for(i = [0:n_switches-1])
      {
        // pins
        for(j = [-1:2:1])
          translate([(i-n_switches/2+0.5)*pitch,  j*(body[1]/2+pitch*0.75/2),-body[2]/2-height+pitch/8])
            color("white")
              cube([pitch/3,pitch*0.75,pitch/4],center=true);
      }
   }
}

//scale(1/2.54) // required scale for KiCAD VRML file dipswitch_smd.wrl
//  rotate([0,0,90])
    dipsw_smd();

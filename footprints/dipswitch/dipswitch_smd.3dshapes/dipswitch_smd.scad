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
color_body="maroon";

swhole=[pitch*0.5,pitch,pitch*0.5];
button=[pitch*0.4,pitch*0.4,pitch*0.5];
color_button="white";

font = "Liberation Sans";
letter_size = pitch/2;
letter_height = pitch/16;
color_letter="white";
enable_letter=0; // letters don't work after exporting to VRML

color_pin="white";

module letter(l,scale=1)
{
  // Use linear_extrude() to make the letters 3D objects as they
  // are only 2D shapes when only using text()
  linear_extrude(height = letter_height*scale)
  {
	text(l, size = letter_size*scale, font = font, halign = "center",
     valign = "center", $fn = 16);
  }
}


module inscription(scale=1)
{
  translate([
    (0-n_switches/2+0.5)*pitch,
    body[1]/2-letter_size,
    body[2]/2-letter_height*scale])
      letter("ON");
  for(i = [0:n_switches-1])
  {
    translate([
    (i-n_switches/2+0.5)*pitch,
      -body[1]/2+letter_size,
      body[2]/2-letter_height*scale])
      letter(chr(48+(i+1)%10));
  }
}

module dipsw_smd()
{
  translate([0,0,body[2]/2+height]) // little above
    // union()
    {
      // cut off holes for switches
      difference()
      {
        color(color_body)
          cube(body,center=true);
        {
        // holes for switches - imports to freecad but exports wrong to VRML of Kicad
        for(i = [0:n_switches-1])
        {
          translate([(i-n_switches/2+0.5)*pitch,0,body[2]/2-swhole[2]/2+0.0001])
            color(color_body)
              cube(swhole,center=true);
        }
        // pin 1 mark
        translate([(-body[0])/2+pitch/3,-body[1]/2+pitch/2,body[2]/2])
        color(color_letter)
          cylinder(r=pitch/8,h=0.1,$fn=6,center=true);
        // cut off space for letters
        if(enable_letter>0.5)
        translate([0,0,0.1])
          color(color_letter)
            inscription();
        }
      }

      // buttons
      if(1)
      for(i = [0:n_switches-1])
      {
        translate([(i-n_switches/2+0.5)*pitch,swhole[1]/2-button[1]/2-(swhole[0]-button[0])/2,body[2]/2-button[2]/2+0.2])
          color(color_pin)
            cube(button,center=true);
      }

      // the pins
      for(i = [0:n_switches-1])
      {
        // pins
        for(j = [-1:2:1])
          translate([(i-n_switches/2+0.5)*pitch,  j*(body[1]/2+pitch*0.6/2),-body[2]/2-height+pitch/12])
            color(color_pin)
              cube([pitch/3,pitch*0.6,pitch/6],center=true);
      }
      
   }
}

// scale(1/2.54) // required scale for KiCAD VRML file dipswitch_smd.wrl
//  rotate([0,0,90])
    dipsw_smd();

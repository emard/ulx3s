/*
Open freecad, select Workbench OpenSCAD
import file, select group, save as freecad file,
close, open freecad file and export to VRML 2.0 (wrl file)
https://www.freecadweb.org/wiki/Import_OpenSCAD_code
*/

n_pins=7; // number of pins
pin_pitch=2.54; // pin pitch
pin_thick=0.7;

// 0.96" COLOR OLED SSD1331
body=[27.2,30.7,2]; // PCB dimensions of the display
height=6; // body above z axis
hole_d=2.5; // hole diameter
hole_edge=2; // hole center to body edge
color_body=[0.03,0.03,0.15];
color_rgbw=[[1,0,0],[0,1,0],[0,0,1],[1,1,1]];

// pin protrusions
pin_above=1; // above the display
pin_below=2; // below the height
color_pin="white";


font = "Liberation Sans";
letter_size = pitch/2;
letter_height = pitch/16;
color_letter="white";
enable_letter=0; // letters don't work after exporting to VRML

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

module oled()
{
      translate([0,(body[1]/2-pin_pitch*0.75),-body[2]/2+height])
          difference()
          {
            color(color_body)
              cube(body, center=true);
            union()
            {
            // color stripes display simulation
            for(i=[0:len(color_rgbw)-1])
            translate([0,-body[1]/8*(i-len(color_rgbw)/2+0.5),body[2]/2])
              color(color_rgbw[i])
                cube([body[0]*0.9,body[1]/8,0.1],center=true);
            // holes
              for(i=[-1:2:1])
                for(j=[-1:2:1])
                  translate(
                  [
                    i*(body[0]/2-hole_edge),
                    j*(body[1]/2-hole_edge),
                    0
                  ])
                    cylinder(d=hole_d,h=body[2]+0.1,$fn=24,center=true);
            }
          }
      // the pins
      for(i = [0:n_pins-1])
      {
        // pins
          translate([(i-n_pins/2+0.5)*pin_pitch,0,-body[2]/2*0+(height+pin_above+pin_below)/2-pin_below])
            color(color_pin)
              cube([pin_thick,pin_thick,height+pin_above+pin_below],center=true);
      }
}

// scale(1/2.54) // required scale for KiCAD VRML file dipswitch_smd.wrl
oled();

dim=[8.7, 3.2, 2.4];
color_body=[0.15,0.15,0.15]; // dark gray
above=0.1;

// pad_pos=[5.5, 2.3]; // pads raster (assumed touching z=0)
pin_pos=[5.5, 2.6]; // pins centers at z=0
dim_pin=[0.6,0.9,1.2]; // simple pin
color_pin="white";

color_writing="white";


module abs25()
{
  translate([0,0,dim[2]/2+above])
  difference()
  {
    color(color_body)
      cube(dim, center=true);
    // body cut pin 1 mark
    translate([-dim[0]/2,0,dim[2]/2])
    rotate([0,-45,0])
      color(color_body)
        cube([dim[1]*0.5,dim[1]+0.1,dim[2]*0.5],center=true);
    // white cut pin 1 marking
    translate([-pin_pos[0]/2,0,dim[2]/2])
      color(color_writing)
        cube([dim[0]*0.05,dim[1]*0.8,0.1],center=true);
  }
  // add pins
  for(i=[-1:2:1])
    for(j=[-1:2:1])
      translate([i*pin_pos[0]/2,j*pin_pos[1]/2,dim[2]/2-dim_pin[2]/2])
        color(color_pin)
          cube(dim_pin,center=true);
}

// scale(1/2.54) // scale required for kicad vrml
// scale is not applied here because object will loose
// color in freecad
abs25();

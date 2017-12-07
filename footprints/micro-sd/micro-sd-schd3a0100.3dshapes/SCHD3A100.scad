dim=[12.43,16.8,1.7]; // base dimensions
above=0.0; // base above the PCB clearance
color_base=[0.2,0.1,0.1];

dim_pin_small=[1.1,0.4,0.1];
pos_pin_small=[
  [-dim[0]/2-dim_pin_small[0]/2,dim[1]/2-2.75,0.05],
  [ dim[0]/2+dim_pin_small[0]/2,dim[1]/2-14.45,0.05]
];

dim_pin_big=[1.1,1.4,0.1];
pos_pin_big=[
  [-dim[0]/2-dim_pin_big[0]/2,dim[1]/2-4.45,0.05],
  [ dim[0]/2+dim_pin_big[0]/2,dim[1]/2-4.45,0.05],
  [-dim[0]/2-dim_pin_big[0]/2,dim[1]/2-12.75,0.05],
  [ dim[0]/2+dim_pin_big[0]/2,dim[1]/2-12.75,0.05]
];
color_pin="white";

module SCHD3A100()
{
  translate([0,0,dim[2]/2+above])
    difference()
    {
      color(color_base)
        cube(dim, center=true);
      // cut SD card area
      translate([0,0,dim[2]/2-1/2+0.01])
        color(color_base)
          cube([11,15,1],center=true);
      // cut pin soldering area
      translate([-1.3/2,dim[1]/2-10.15,0])
        color(color_base)
          cube([8.9,2,4],center=true);
      // cut pin spring area
      translate([-1.3/2,dim[1]/2-5,0])
        color(color_base)
          cube([8.9,6,4],center=true);
    }
    
    for(i=[0:len(pos_pin_big)-1])
    translate(pos_pin_big[i])
      color(color_pin)
        cube(dim_pin_big,center=true);

    for(i=[0:len(pos_pin_small)-1])
    translate(pos_pin_small[i])
      color(color_pin)
        cube(dim_pin_small,center=true);

}

SCHD3A100();

dim=[12.43,16.8,1.7]; // base dimensions
above=0.1; // base above the PCB clearance
color_base=[0.2,0.1,0.1];

// 2 small pins (small) GND
dim_pin_small=[1.1,0.4,0.1];
pos_pin_small=[
  [-dim[0]/2-dim_pin_small[0]/2,dim[1]/2-2.75,0.05],
  [ dim[0]/2+dim_pin_small[0]/2,dim[1]/2-14.45,0.05]
];

// mounting 4 side pins (big)
dim_pin_big=[1.1,1.4,0.1];
pos_pin_big=[
  [-dim[0]/2-dim_pin_big[0]/2,dim[1]/2-4.45,0.05],
  [ dim[0]/2+dim_pin_big[0]/2,dim[1]/2-4.45,0.05],
  [-dim[0]/2-dim_pin_big[0]/2,dim[1]/2-12.75,0.05],
  [ dim[0]/2+dim_pin_big[0]/2,dim[1]/2-12.75,0.05]
];

// Pins for signal solder contacts
pin_th = 0.1; // Thickness
pin_W = 0.4;  // Pin width
pin_L = 7.3;  // Total Length
pin_H = 0.3+pin_th/2; // Pin height (from bottom to top)
pin_l = 0.9;  // Length of the bottom part
pin_a = 115;  // Bending angle

pin_pitch = 1.1;
pin_count = 8;

color_pin="white";

// Bent pin
// _L - whole pin length
// _l - length of bottom part
// _H - whole pin height
// _th - pin thickness
// _a - bending angle
// _W - pin width
module pin(_L,_l,_H,_th,_a,_W)
{
    // Internal variables
    _d1 = _th*sin(_a) / (1-cos(_a));
    _d2 = (_th-_H)*cos(_a) / sin(_a);

    rotate([90,0,90])
    // Extrude the following polygon
    linear_extrude(height = _W, center = true, convexity = 10, twist = 0)
        polygon([[0,0],
                 [_l,0],
                 [_l+_d2,_H-_th],
                 [_L,_H-_th],
                 [_L,_H],
                 [_l+_d2-_d1,_H],
                 [_l-_d1,_th],
                 [0,_th]]);
}

// Array of pins
// _cnt - number of pins
// _distance - distance between pin centres
module pins_array(_cnt, _distance)
{
    if (_cnt>0)
    color(color_pin)
    {
        for (_i = [0:_cnt-1])
        {
            translate([_distance*_i,0,0])
                pin(pin_L,pin_l,pin_H,pin_th,pin_a,pin_W);
        }
    }
}


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

    translate([3.2-(pin_count-1)*pin_pitch,-2.2,0])
      pins_array(pin_count, pin_pitch);
}

SCHD3A100();

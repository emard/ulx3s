// Case dimensions
case_x=22.42;        // Case X dimension
case_y=10.16;        // Case Y dimension
case_z=1.2;        // Case Z dimension
dot_radius=0.3; // Notch radius
dot_depth=0.1;  // Notch depth
dot_off_x=0.5;  // Notch offset X
dot_off_y=0.5;  // Notch offset Y
color_case=[0.15,0.15,0.15]; // dark gray
color_dot=[1,1,1]; // white

// Pin arrays parameters
side1_pins = 27;
side2_pins = 0;
side3_pins = 27;
side4_pins = 0;
pin_distance =0.808;    // Pin step
color_pin=[1,1,1]; // white

// Pin parameters
pin_th = 0.15; // Thickness
pin_W = 0.375;  // Pin width
pin_L = 0.8;  // Total Length
pin_H = case_z/2+pin_th/2; // Pin height (from bottom to top)
pin_l = 0.4;  // Length of the bottom part
pin_a = 115;  // Bending angle

translate_to_center=[-(side1_pins-1)*pin_distance/2,-(case_y+pin_L*2)/2,0];

// Bended pin
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

// Simple case with notch
module case()
{
    difference()
    {
        translate([case_x/2,case_y/2,case_z/2])
        color(color_case)
          cube([case_x,case_y,case_z],center=true);
        translate([dot_radius+dot_off_x,dot_radius+dot_off_y,case_z])
          color(color_dot)
            cylinder(h=dot_depth*2, r = dot_radius, center= true, $fn = 10);
    }
}


// Complete model
// scale(1/2.54) // 1/2.54=0.3937 scale for Kicad
module ic()
{
  // Case
  translate([-(case_x-(side1_pins-1)*pin_distance)/2,pin_L,0]+translate_to_center)
      case();

  translate(translate_to_center)
  union()
  {
    // Top pins
    translate([(side1_pins-side3_pins)*pin_distance/2,case_y+pin_L*2,0])
        mirror([0,1,0])
            pins_array(side3_pins, pin_distance);

    // Bottom pins
    pins_array(side1_pins, pin_distance);

    // Left pins
    translate([-(case_x-(side1_pins-1)*pin_distance)/2 - pin_L,pin_L+case_y/2-(side4_pins-1)*pin_distance/2,0])
        mirror([1,0,0])
            rotate([0,0,90])
                pins_array(side4_pins, pin_distance);

    // Right pins
    translate([-(case_x-(side1_pins-1)*pin_distance)/2-pin_L+case_x+2*pin_L,pin_L+case_y/2-(side2_pins-1)*pin_distance/2,0])
        mirror([0,1,0])
            mirror([0,1,0])
                rotate([0,0,90])
                    pins_array(side2_pins, pin_distance);
    }
}

ic();

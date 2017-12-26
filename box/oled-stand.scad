
body=[28,5,11.0];
hole_d=2.2;
hole_h=2.0;
hole_dist=23.75;

difference()
{
  union()
  {
    cube(body,center=true);
    // screw pins
    for(i=[-1:2:1])
      translate([hole_dist/2*i,0,body[2]/2+hole_h/2])
      cylinder(d=hole_d,h=hole_h+0.1,$fn=6,center=true);
  }
  // cut clearing for ribbon cable
  translate([0,0,body[2]/2])
    cube([hole_dist-5,10,2],center=true);
  // cut bottom stand
  // hdmi
  translate([-body[0]/2,0,-body[2]/2])
    cube([34,10,13],center=true);
  // audio jack
  translate([body[0]/2,0,-body[2]/2])
    cube([4,10,10],center=true);   
}

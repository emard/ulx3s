
body=[27,10,3.4];
hole_d=1.6;
hole_h=2.7;
hole_dist=23.4;

hdmi_width=17;
hdmi_height=14;
audio_width=5;
audio_height=13;
voltage_width=8;
voltage_height=7;

difference()
{
  union()
  {
    cube(body,center=true);
    // screw pins
    for(i=[-1:2:1])
      translate([hole_dist/2*i,3,body[2]/2+hole_h/2])
      cylinder(d=hole_d,h=hole_h+0.1,$fn=6,center=true);
  }
  // cut clearing for ribbon cable
  if(0)
  translate([0,0,body[2]/2])
    cube([hole_dist-5,20,2],center=true);
  // cut bottom stand
  // dip switch 
  // hdmi capacitors
  if(0)
  translate([-hole_dist/2+hdmi_width/2-3,+5,-body[2]/2])
    cube([hdmi_width,10,hdmi_height],center=true);
  // voltage selector
  if(0)
  translate([+hole_dist/2-voltage_width/2+0.01,-6,-body[2]/2])
    cube([voltage_width,10,voltage_height],center=true);
  // audio jack
  if(0)
  translate([hole_dist/2+audio_width/2,0,-body[2]/2])
    cube([audio_width,10,audio_height],center=true);
  // 45 deg transition
  if(1)
  translate([0,7.5,0])
    rotate([45,0,0])
      cube([40,40,audio_width],center=true);
}

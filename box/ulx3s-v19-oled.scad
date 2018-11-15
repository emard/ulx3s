
body=[27,5,11];
hole_d=2.2; // 2.2 narrow, 2.3 wide
hole_h=2.0;
hole_dist=23.60;

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
      translate([hole_dist/2*i,0,body[2]/2+hole_h/2])
      cylinder(d=hole_d,h=hole_h+0.1,$fn=6,center=true);
  }
  // cut clearing for ribbon cable
  translate([0,0,body[2]/2])
    cube([hole_dist-5,10,2],center=true);
  // cut bottom stand
  // dip switch 
  // hdmi capacitors
  translate([-hole_dist/2+hdmi_width/2-3,+5,-body[2]/2])
    cube([hdmi_width,10,hdmi_height],center=true);
  // voltage selector
  translate([+hole_dist/2-voltage_width/2+0.01,-6,-body[2]/2])
    cube([voltage_width,10,voltage_height],center=true);
  // audio jack
  translate([hole_dist/2+audio_width/2,0,-body[2]/2])
    cube([audio_width,10,audio_height],center=true);
  // 45 deg transtion
  translate([hole_dist/2+audio_width/2+1,0,-body[2]/2+audio_height-audio_width-1.5])
    rotate([0,45,0])
      cube([audio_width,10,audio_width],center=true);
}

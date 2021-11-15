module boxhook(dim=[10,1.2,10],notch=0.8,dim_add=[0,0,0],notch_add=0)
{
  difference()
  {
    cube(dim+dim_add,center=true);
    translate([0,-dim[1]/2,-dim[2]/2])
      rotate([90,0,0])
        rotate([45,0,0])
          cube([dim[0]+0.1,dim[1]*1.4,dim[1]*1.4]+dim_add,center=true);
  }
  translate([0,dim[1]/2,dim[2]/2-notch/2])
    rotate([0,90,0])
      cylinder(d=notch+notch_add,h=dim[0]+dim_add[0],$fn=32,center=true);
}

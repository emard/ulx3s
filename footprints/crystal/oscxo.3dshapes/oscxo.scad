size=[7,5,1.4];
color_body="white";
dot_r=0.5;
color_dot="black";

module oscxo()
{
translate([0,0,dim[3]/2]);
  difference()
  {
    color(color_body)
      cube(size, center=true);
    translate([-size[0]*0.5+2*dot_r,-size[1]*0.5+2*dot_r,size[2]*0.5])
      color(color_dot)
        cylinder(r=dot_r,h=0.1,$fn=6,center=true);
  }
}

oscxo();

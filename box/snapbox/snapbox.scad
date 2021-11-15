// Snap-on Screwless Box
// Top and Bottom half snap and lock when pushed together


/*
// PCB

pcb_dim = [20,18,1.6];
pcb_pos = [0,0,-4]; // from center
pcb_holes_grid = [16,14];
pcb_hole_dia = 2.2;

// BOX

dim_box_inner = [21,19,12]; // xyz inside space
dim_box_thick = 2;
dim_box_outer = dim_box_inner+[dim_box_thick,dim_box_thick,dim_box_thick]*2; // xyz outer dim
dim_box_round = 3;
dim_box_split = 1; // split line 0:half +:to top -:to bottom

dim_boxhook = [8,1.2,5]; // xyz hook size
dim_notch_boxhook = 0.7; // hook notch dia
dim_depth_boxhook = [0.3,0.3,2]; // xyz hook depth
dim_hook_clr = [0.3,0.3,0.4]; // xyz added to cut for clearance
dim_notch_clr = 0.2; // added to diameter for clearance

dim_step_cut = 1*[0.9,0.9]; // [depth, inside_width]
dim_step_cut_clr = 1*[0.6,0.6]; // [depth, inside_width] clearance

// PCB columns
pcb_col_top_dia = [4,5]; // top col: top,bot dia
pcb_col_bot_dia = [4,5]; // bot col: top,bot dia
pcb_col_clr = 0.4; // pcb col clearance
pcb_col_pin_dim = [2,2.8]; // pin dia,height
pcb_col_pin_clr = [0.5,0.5]; // pin dia,height clearance
*/

include <boxhook.scad>

module box()
{
  difference()
  {
    minkowski()
    {
      cube(dim_box_outer-[dim_box_round,dim_box_round,dim_box_round],center=true);
      sphere(d=dim_box_round,$fn=32);
    }
    minkowski()
    {
      cube(dim_box_inner-[dim_box_round,dim_box_round,dim_box_round]/2,center=true);
      sphere(d=dim_box_round/2,$fn=32);
    }
  }
}

// cut   0:not cut, 1:cut
// side -1:inside, 1:outside
module step_fit(cut=0,side=1)
{
  inside_round=dim_box_round/2+dim_box_round/2*dim_step_cut[1]/dim_box_thick;
  if(side < 0)
  translate([0,0,dim_box_split-dim_step_cut[0]-cut*dim_step_cut_clr[0]+0.01])
    linear_extrude(dim_step_cut[0]+cut*dim_step_cut_clr[0])
    difference()
    {
      minkowski()
      {
          square([dim_box_inner[0],dim_box_inner[1]]+[dim_step_cut[1],dim_step_cut[1]]*2+cut*[dim_step_cut_clr[1],dim_step_cut_clr[1]]-[inside_round,inside_round],center=true);
          circle(d=inside_round,$fn=32);
      }
      minkowski()
      {
          square([dim_box_inner[0],dim_box_inner[1]]-[dim_box_round,dim_box_round]/2,center=true);
          circle(d=dim_box_round/2-0.01,$fn=32);
      }
    }
  if(side > 0)
  translate([0,0,dim_box_split-dim_step_cut[0]+0.01])
  {
    linear_extrude(dim_step_cut[0]+cut*dim_step_cut_clr[0]/2)
    difference()
    {
      minkowski()
      {
          square([dim_box_outer[0],dim_box_outer[1]]
                -[dim_box_round,dim_box_round],
                center=true);
          circle(d=dim_box_round,$fn=32);
      }
      minkowski()
      {
          square([dim_box_outer[0],dim_box_outer[1]]
                -[dim_step_cut[1],dim_step_cut[1]]*2
                -cut*[dim_step_cut_clr[1],dim_step_cut_clr[1]]
                -[inside_round,inside_round],
                center=true);
          circle(d=inside_round,$fn=32);
      }
    }
    // clearance cut
    if(cut > 0.5)
      translate([0,0,dim_box_outer[2]/2+dim_step_cut[0]-dim_step_cut_clr[0]])
        cube(dim_box_outer,center=true);
  }
}

module hooks(cut=0)
{
  for(k=[-1,0,1]) // 1,2 or 3 hooks offset from center
  {
    // hooks x
    for(i=[-1,1])
      translate([i*dim_box_inner[0]/2-i*dim_boxhook[1]/2+i*dim_depth_boxhook[0],k*dim_pos_boxhook[1],dim_box_split-dim_boxhook[2]/2+dim_depth_boxhook[2]])
          rotate([0,0,-90*i])
          rotate([0,180,0])
            boxhook(dim=dim_boxhook,notch=dim_notch_boxhook,dim_add=cut*dim_hook_clr,notch_add=cut*dim_notch_clr);
    // hooks y
    for(i=[-1,1])
      translate([k*dim_pos_boxhook[0],i*dim_box_inner[1]/2-i*dim_boxhook[1]/2+i*dim_depth_boxhook[1],dim_box_split-dim_boxhook[2]/2+dim_depth_boxhook[2]])
          rotate([0,0,90-90*i])
          rotate([0,180,0])
            boxhook(dim=dim_boxhook,notch=dim_notch_boxhook,dim_add=cut*dim_hook_clr,notch_add=cut*dim_notch_clr);
  }
}

module pcb()
{
  translate(pcb_pos)
  difference()
  {
    cube(pcb_dim,center=true);
    for(i=[-1,1])
      for(j=[-1,1])
        translate([i*pcb_holes_grid[0]/2,j*pcb_holes_grid[1]/2,0])
          cylinder(d=pcb_hole_dia,h=pcb_dim[2]+0.01,$fn=16,center=true);
  }
}

module pcb_pin(cut=0)
{
  // pin
  translate([0,0,pcb_dim[2]/2-pcb_col_pin_dim[1]/2+pcb_col_clr/2])
    cylinder(d=pcb_col_pin_dim[0]+cut*pcb_col_pin_clr[0],h=pcb_col_pin_dim[1]+cut*pcb_col_pin_clr[1],$fn=16,center=true);
}

module pcb_columns(side=1)
{
  for(i=[-1,1])
    for(j=[-1,1])
      translate([i*pcb_holes_grid[0]/2,j*pcb_holes_grid[1]/2,0]+pcb_pos)
      {
        if(side > 0)
        {
          // top column
          translate([0,0,pcb_dim[2]/2+pcb_col_clr/2])
            cylinder(d1=pcb_col_top_dia[0],d2=pcb_col_top_dia[1],h=dim_box_inner[2]/2-pcb_dim[2]/2-pcb_pos[2],$fn=16);
          // pin
          pcb_pin(cut=0);
          //translate([0,0,pcb_dim[2]/2-pcb_col_pin_dim[1]/2+pcb_col_clr/2])
            //cylinder(d=pcb_col_pin_dim[0],h=pcb_col_pin_dim[1],$fn=16,center=true);
        }
        if(side < 0)
        {
          // bottom column
          difference()
          {
            translate([0,0,-pcb_dim[2]/2-pcb_col_clr/2])
              rotate([180,0,0])
                cylinder(d1=pcb_col_bot_dia[0],d2=pcb_col_bot_dia[1],h=dim_box_inner[2]/2-pcb_dim[2]/2+pcb_pos[2],$fn=16);
                // pin inside cut
            pcb_pin(cut=1);
          }
        }
      }
}

// side=1 top
// side=-1 bottom
// stepside=1 outer step (force compensation, less bending, more fragile)
// stepside=-1 inner step (less fragile, more bending)
module boxpart(side=1,stepside=1)
{
  // half-cut
  difference()
  {
    box();
    // cut half
    translate([0,0,dim_box_split-side*dim_box_outer[2]])
      cube(dim_box_outer*2,center=true);
    if(side < 0)
    {
      hooks(cut=1);
      step_fit(cut=1,side=stepside);
    }
  }
  if(side > 0)
  {
    hooks(cut=0);
    step_fit(cut=0,side=stepside);
  }
  pcb_columns(side);
}

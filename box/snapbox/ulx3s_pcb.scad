module ulx3s_pcb(header_type = 1)
{
// display_type:
// 0:none
// 1:ST7789  240x240 1.3"
// 2:ST7789  240x240 1.54"
// 3:SSD1331  96x64  0.96"
// 4:SSD1351 128x128 1.54"
// 5:SSD1306 128x64  0.96"
display_type = 1;
box_y_enlarge = display_type == 2 ? 1 : 0;
display_center = [1,0,0]; // XYZ center adjust X +right - left, Y +up -down, Z 0
// display_center = [1,0,0]; // v3.1.7 st7789 1.3"
// display_center = [0,-0.5,0]; // v3.0.8 st7789 1.3"
// display_center = [0,0,0]; // v3,0.8 st7789 1.3" (untested)
// display_center = [1.7,-1,0]; // v3.1.7 st7789 1.54"
// display_center = [0.7,-0.5.0]; // v3.0.8 st7789 1.54"
display_rotation = 0; // display z-rotation  adjust deg +cw -ccw


  pcb_dim = [37*2.54,20*2.54,1.6];
  pcb_pos = [0,0,0]; // from center
  pcb_holes_grid = [30,17]*2.54; // assumed center
  pcb_hole_dia = 3.2;

  screw_hole = 1*[1.8,8]; // d,h hole screws to hold box


  // xyz positions of all buttons
  // relative to lower left hole
  button_pos =
  [
  [68.58,34.29,0], // btn0
  [2.54,19.05,0], // btn1
  [13.97,19.05,0], // btn2
  [57.15,8.89,0], // btn3
  [57.15,0,0], // btn4
  [45.72,0,0], // btn5
  [68.58,0,0] // btn6  
  ];

  // pcb();
  translate(pcb_pos)
  difference()
  {
    cube(pcb_dim,center=true);
    for(i=[-1,1])
      for(j=[-1,1])
        translate([i*pcb_holes_grid[0]/2,j*pcb_holes_grid[1]/2,0])
          cylinder(d=pcb_hole_dia,h=pcb_dim[2]+0.01,$fn=16,center=true);
  }

  // esp32
  dim_esp32=[18,31.4,0.8];
  dim_esp32_can=[15,22,3];
  pos_esp32=[-pcb_dim[0]/2+dim_esp32[0]/2+14.22,-6.3,0];
  translate(pcb_pos+[0,-pcb_dim[1]/2+dim_esp32[1]/2,-pcb_dim[2]/2-dim_esp32[2]/2-0.01]+pos_esp32)
    {
      cube(dim_esp32,center=true);
      translate([0,dim_esp32[1]/2-dim_esp32_can[1]/2-(dim_esp32[0]-dim_esp32_can[0])/2,-dim_esp32[2]/2])
        cube(dim_esp32_can,center=true);
    }
  
  // LCD
  dim_st7789=[20,20,1];
  pos_st7789=[0,3,15];
  translate(pcb_pos+pos_st7789)
    cube(dim_st7789,center=true);

  // headers side
  header_dim=[8.4,51.2,5];
  header_above_pcb=0.5;
  header_from_pcb=1.27;
  if(header_type==1)
  for(i=[-1,1])
    translate(pcb_pos+[i*((pcb_dim[0]+header_dim[0])/2+header_from_pcb),0,pcb_dim[2]/2+header_dim[2]/2+header_above_pcb])
      cube(header_dim,center=true);

  // header pins down
  pin_dim=[0.5,0.5,11];
  if(header_type==2)
  for(k=[-1,1]) // sides
    for(i=[-0.5,0.5]) // 2 pin rows
      for(j=[0:19]) // each pin
        translate(pcb_pos+[(17.5*k+i)*2.54,(j-9.5)*2.54,-3.5])
          cube(pin_dim,center=true);

  // BTNs
  btn_d=4.5;
  btn_h=5;
  btn_box=[7,7,4];
  translate(pcb_pos+[-pcb_holes_grid[0]/2,-pcb_holes_grid[1]/2,pcb_dim[2]/2+btn_h/2])
  {
    // btn
    for(i = [0:6])
      translate(button_pos[i])
      {
        cylinder(d=btn_d,h=btn_h,$fn=24,center=true);
        translate([0,0,-btn_h/2+btn_box[2]/2-0.01])
          cube(btn_box,center=true);
      }
  }    
}

// %ulx3s_pcb();


include <upbox.scad>

/* [STL element to export] */
// Top shell
  TShell        = 1; // [0:No, 1:Yes]
// Bottom shell
  BShell        = 1; // [0:No, 1:Yes]
// Front panel ULX3S text
  FPanel        = 1; // [0:No, 1:Yes]
// Rear panel DB9 opening
  BPanel        = 1; // [0:No, 1:Yes]
// Font color: at height 2.7: M600; change filament
// button pins
  Pins          = 1; // button pins
  Pin           = 0; // one pin

// Flat Cable holes
  FlatCable     = 1;

// Front text
  Text          = 1;// [0:No, 1:Yes]

// display_type:
// 0:none
// 1:ST7789  240x240 1.3"
// 2:ST7789  240x240 1.54"
// 3:SSD1331  96x64  0.96"
// 4:SSD1351 128x128 1.54"
// 5:SSD1306 128x64  0.96"
display_type = 1;
display_center = 0; // Y center adjust +up -down
display_rotation = 0; // display z-rotation  adjust deg +cw -ccw

// multicolor front panel
/*
;BEFORE_LAYER_CHANGE
;2.7
M600 ; Pause print to change filament
*/

/*//////////////////////////////////////////////////////////////////
              -   Heartman/Hearty 2016     -                   
              -   http://heartygfx.blogspot.com    -                  
              -       OpenScad Parametric Box      -                     
              -         CC BY-NC 3.0 License       -                      
////////////////////////////////////////////////////////////////////                                                                                                             
12/02/2016 - Fixed minor bug 
28/02/2016 - Added holes ventilation option                    
09/03/2016 - Added PCB feet support, fixed the shell artefact on export mode. 

*/////////////////////////// - Info - //////////////////////////////

// All coordinates are starting as integrated circuit pins.
// From the top view :

//   CoordD           <---       CoordC
//                                 ^
//                                 ^
//                                 ^
//   CoordA           --->       CoordB


////////////////////////////////////////////////////////////////////


////////// - Box parameters - /////////////

/* [PCB_Feet--TheBoard_Will_NotBeExported) ] */
//All dimensions are from the center foot axis
// - Coin bas gauche - Low left corner X position
PCBPosX         = 0;
// - Coin bas gauche - Low left corner Y position
PCBPosY         = 0;
// - Longueur PCB - PCB Length
PCBLength       = 30*2.54;
// - Largeur PCB - PCB Width
PCBWidth        = 17*2.54;
// Thickness of PCB
PCBThick        = 1.6;
PCBThickTol     = 0.0;
BFclr = 0.7; // bottom feet clearance
// - Heuteur pied - Feet height
FootHeight      = 7;
// - Diamètre pied - Foot diameter
FootDia         = 6;
// - Diamètre trou - Hole diameter
FootHole        = 1.8;
// - 3-foot mode, one foot width-asymmetric, 0 for normal 4-foot mode
Foot3Width = 0*2.54;

// those clearances should be larger than
// the PCB edge to hole centers distances
FootClrX = 11; // foot center to panel clearance 25 for DB-9, 11 for tight
FootClrY = 10-3; // foot center to shell wall clearance
FootmvY = 3; // move foot out of center y direction

// - Wall thickness  
Thick           = 2;//[2:5]  

/* [Box dimensions] */
// - Length  
  Length        = PCBLength+2*(2*Thick+FootClrX);
// - Width add +1.5 for 1.5" display
  Width         = PCBWidth+2*(1*Thick+FootClrY+1.5);
// - Height 25 without flat cable, 28 with flat cable
  Height        = 28.7;

/* [Box options] */
// Pieds PCB - PCB feet (x4) 
  PCBFeet       = 1;// [0:No, 1:Yes]
// - Decorations to ventilation holes
  Vent          = 0;// [0:No, 1:Yes]
// - Decoration-Holes width (in mm)
  Vent_width    = 1.5;   
// - Text you want
  txt           = "ULX3S";
// - Font size  
  TxtSize       = 6;                 
// - Font  
  Police        ="Arial Black"; 
// - Diamètre Coin arrondi - Filet diameter  
  Filet         = 2;//[0.1:12] 
// - lissage de l'arrondi - Filet smoothness  
  Resolution    = 20;//[1:100] 
// - Tolérance - Tolerance (Panel/rails gap)
  m             = 0.9;
  mz            = 1.0; // panels height tolerance
// mounting legs clearance
  MountClearance = 0.1;
  // clearance between Top and Bottom shell
  ShellClearance = 0.0;


// mounting hole diameters
MountOuterHole = 2.0;
MountInnerHole = 1.8;

// fixation leg size
MountLegSize = 0; // 10
// fixation hole z-position from center
MountHolePos = 2.5;
// distance of leg to the edge
MountLegEdge = 0*MountLegSize;

  
/* [Hidden] */
// - Couleur coque - Shell color  
Couleur1        = "Orange";       
// - Couleur panneaux - Panels color    
Couleur2        = "OrangeRed";    
// Thick X 2 - making decorations thicker if it is a vent to make sure they go through shell
Dec_Thick       = Vent ? Thick*2 : Thick; 
// - Depth decoration
Dec_size        = Vent ? Thick*2 : 0.8;

//////////////////// Oversize PCB limitation -Actually disabled - ////////////////////
//PCBL= PCBLength+PCBPosX>Length-(Thick*2+7) ? Length-(Thick*3+20+PCBPosX) : PCBLength;
//PCBW= PCBWidth+PCBPosY>Width-(Thick*2+10) ? Width-(Thick*2+12+PCBPosY) : PCBWidth;
PCBL=PCBLength;
PCBW=PCBWidth;
//echo (" PCBWidth = ",PCBW);

// flat cable connector spacing between centers
flatcable_spacing = 35*2.54;



///////////////////////////////////// - Main - ///////////////////////////////////////

  // mounting hole xy-position
  Footx = 2*Thick+FootClrX;
  Footy = Thick+FootClrY+FootmvY;
  Fh = 16.7; // top feet height

  // foot xy positions
  Fxy = [
  [Footx, Footy, 0],
  [Footx+PCBLength, Footy, 0],
  [Footx, Footy+PCBWidth, 0],
  [Footx+PCBLength, Footy+PCBWidth, 0]
  ];

module connector_cut()
{
  // mounting hole x-position
  //footx = 2*Thick+FootClrX;
  //footy = Thick+FootClrY;
  cy = 60-8;
  translate([Footx,Footy,Height-Fh-9])
  {
      // cut off for WiFi
      translate([24-10,-10,7])
        cube([21,3,3],center=true);
      // cut off for HDMI
      translate([42.3+0.2,cy,11.5])
        cube([22,10,13],center=true);
      // cut off for AUDIO
      translate([21.47-0.3,cy,11.2+0.5])
        rotate([90,0,0])
          cylinder(d=13.5,h=10,$fn=32,center=true);
      // cut off for 2.5/3.3V jumper
      translate([27.07+2.54,cy,11])
        cube([13,10,7],center=true);
      // cut off for USB1
      translate([8.89+0.2,cy,9.7])
        cube([13,10,9],center=true);
      // cut off for USB2
      translate([67.31+0.2,cy,9.7])
        cube([13,10,9],center=true);
  }    
}

// xyz positions of all buttons
// relative to feet
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

tube_h=9; // btn tube height
tube_id=7; // button tube inner diameter
tube_od=9; // tube outer diameter

// addition to top shell - button tubes
module top_add()
{
  // mounting hole xy-position
  //footx = 2*Thick+FootClrX;
  //footy = Thick+FootClrY;
  translate([Footx,Footy,Height-tube_h/2])
  {
      // btn hole
    for(i = [0:6])
      translate(button_pos[i])
        cylinder(d=tube_od,h=tube_h,$fn=24,center=true);
  }
  for(i = [0:3])
  {
    upbase=1;
    translate([0,0,Height-Fh/2])
    translate(Fxy[i])
    {
      translate([0,0,-upbase/2])
      cylinder(d1=6,d2=11,h=Fh-upbase,$fn=24,center=true);
      // small in-hole centering cylinders
      if(0)
      translate([0,0,-Fh/2-(PCBThick-PCBThickTol-0.001)])
        cylinder(d=3,h=PCBThick-PCBThickTol,$fn=32);
    }
  }
}

module button_pin()
{
  pin_d1=6; // top dia
  pin_h=14; // total height
  pin_d2=8; // button touch dia
  pin_h2=2.5; // button touch h

      union()
      {
        cylinder(d=pin_d1,h=pin_h,$fn=32);
        cylinder(d=pin_d2,h=pin_h2,$fn=32);
      }
}

module button_pins()
{
  translate([Footx,Footy,Height-12])
  for(i = [0:6])
    translate(button_pos[i])
      button_pin();
}


module top_cut()
{
  // mounting hole xy-position
  //footx = 2*Thick+FootClrX;
  //footy = Thick+FootClrY;
  translate([Footx,Footy,Height])
  {
      // 8-led view slit
      translate([8.89,28.81,0])
        cube([20,4,10],center=true);
      // 3-led view slit 
      translate([25.4,2.54,0])
        cube([10,4,10],center=true);
      // display (screen)
      xadj=-1.0;
      yadj=1.0;
      if(display_type==1) // ST7789 1.3"
      translate([PCBLength/2-0.2+xadj,PCBWidth/2+2+yadj+display_center,0])
        rotate([0,0,-display_rotation])
          cube([26,26,10],center=true);
      if(display_type==2) // ST7789 1.54"
      translate([PCBLength/2-2.5+xadj,PCBWidth/2+4.5+yadj+display_center,0])
        rotate([0,0,-display_rotation])
          cube([30,30,10],center=true);
      if(display_type==3) // SSD1331 0.96"
      translate([PCBLength/2-1+xadj,PCBWidth/2-2+yadj+display_center,0])
        rotate([0,0,-display_rotation])
          cube([23,16,10],center=true);
      if(display_type==4) // SSD1351 1.5"
      translate([PCBLength/2-1.2+xadj,PCBWidth/2+3+yadj+display_center,0])
        rotate([0,0,-display_rotation])
          cube([30,30,10],center=true);
      if(display_type==5) // SSD1306 0.96"
      translate([PCBLength/2-1+xadj,PCBWidth/2-4+yadj+display_center,0])
        rotate([0,0,-display_rotation])
          cube([23,12,10],center=true);
      // display socket
      if(0)
      translate([PCBLength/2,8.5,0])
        cube([20,4,10],center=true);
      // btn hole
      translate([0,0,-tube_h/2])
      for(i = [0:6])
        translate(button_pos[i])
          cylinder(d=tube_id,h=tube_h+1,$fn=24,center=true);
    // btn cuts
    for(i = [0:6])
      translate([0,0,-tube_h*3/2])
      translate(button_pos[i])
        cylinder(d=tube_od+0.5,h=tube_h,$fn=12,center=true);
  }
  // screw holes on top legs
  screwhole_h=10; // depth of the screw hole
  for(i=[0:3])
    translate([0,0,Height-Fh/2])
    translate(Fxy[i])
      translate([0,0,-screwhole_h/2-PCBThick])
      cylinder(d=1.8,h=screwhole_h,$fn=6,center=true);
}

// add bottom custom feet
module bottom_add()
{
  upbase=1;
  bfh=Height-Fh-PCBThick-BFclr; // bottom feet height
  for(i=[0:3])
    translate(Fxy[i])
    {
      translate([0,0,upbase])
      cylinder(d2=6.5,d1=8,h=bfh-upbase,$fn=24,center=false);
      translate([0,0,bfh])
        cylinder(d=3,h=0.8,$fn=12,center=false);
    }

}

// cut holes in bottom feet
module bottom_cut()
{
  transition=2;
  bfhole=Height-Fh-PCBThick-BFclr-(Thick+transition/2);
  for(i=[0:3])
    translate([0,0,-0.01])
    translate(Fxy[i])
    union()
    {
      cylinder(d=MountOuterHole,h=Height,$fn=12,center=false);
      // conical transition
      translate([0,0,bfhole-0.01])
        cylinder(d1=5,d2=MountOuterHole,h=transition+0.02,$fn=12,center=false);
      // screw head hole
      cylinder(d=5,h=bfhole,$fn=12,center=false);
    }
    // cut rails for PCB
    if(1)
    translate((Fxy[0]+Fxy[3])/2+[0,24.6,Height/2+(Height-Fh-PCBThick-BFclr)])
      cube([99,2.1,Height],center=true);
}

module flatcable_cut()
{
  height=Height-Fh-2.54;
  width=6.8;
  length=57;
  notch=2;
  notch_length=5;
  translate((Fxy[0]+Fxy[3])/2)
  {
    for(i=[-1:2:1])
      translate([flatcable_spacing*i/2,0,height/2-0.01])
      {
        cube([width,length,height],center=true);
        translate([-i*notch,0,0])
        cube([width,notch_length,height],center=true);
      }
  }
}


if(BPanel==1)
//Back Panel
translate ([-m/2,0,0]){
  difference()
  {
    union()
    {
      Panels();
      // screw extenders
       for(i=[-1:2:1])
         translate([Thick*1.5*0+m,25.4/2*i+Width/2,Height/2])
           rotate([0,90,0])
             cylinder(d=4,h=Thick*2,$fn=32,center=true);
    }
       if(1)
       {
       // cut off opening for DB-9 connector
       translate([Thick*1.5+m,Width/2,Height/2])
         cube([Thick*2,19,10],center=true);
       // cut off screw holes
       for(i=[-1:2:1])
         translate([Thick*1.5+m-1.9,25.4/2*i+Width/2,Height/2])
           rotate([0,90,0])
             cylinder(d=1.8,h=6,$fn=12,center=true);
       }

  }
}

if(FPanel==1)
{
  //Front Panel
  rotate([0,0,180])
    translate([-Length-m/2,-Width,0])
       Panels();

  if(Text==1)
   // Front text
   color(Couleur1)
   {
     translate([
       Length-(Thick)-m/2,
       Width/2,
       Height/2])
     {// x,y,z
          rotate([90,0,90]){
              linear_extrude(height = 1.0){
              text(txt, font = Police, size = TxtSize,  valign ="center", halign ="center");
                        }
                 }
     }
   }
}

if(BShell==1)
// Coque bas - Bottom shell
color(Couleur1){
difference()
{
   union()
   {
      Coque(top=0);
      bottom_add();
   }
   connector_cut();
   bottom_cut();
   if(FlatCable)
     flatcable_cut();
}
  if(0)
  if (PCBFeet==1)  // Feet
  {
    footx = 2*Thick+FootClrX;
    footy = Thick+FootClrY;

    difference()
    {
    union()
    {
      translate([PCBPosX,PCBPosY,0])
        Feet();
      // add centering cylinder for 3.2 mm hole
      if(0)
      for(i=[0:1])
        for(j=[0:1])
          translate([footx+i*PCBLength,footy+j*PCBWidth,FootHeight-Thick+1.5])
            cylinder(d=3,h=1.5,$fn=32);
    }
      // drill holes 1.8 mm for screws
      for(i=[0:1])
        for(j=[0:1])
          translate([footx+i*PCBLength,footy+j*PCBWidth,FootHeight-Thick+1.5-4])
            cylinder(d=2.5,h=Height,$fn=32);
    }
  }
}


if(TShell==1)
// Coque haut - Top Shell
color( Couleur1,1){
  difference()
  {
    union()
    {
      translate([Length,0,Height+ShellClearance])
        rotate([0,180,0])
          Coque(top=1);
      top_add();
    }
    connector_cut();
    top_cut();
  }
}

if(Pins==1)
    button_pins();

if(Pin==1)
    button_pin();

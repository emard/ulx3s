include <upbox.scad>

/* [STL element to export] */
//Coque haut - Top shell
  TShell        = 1;// [0:No, 1:Yes]
//Coque bas- Bottom shell
  BShell        = 1;// [0:No, 1:Yes]
//Panneau arrière - Rear panel  
  BPanel        = 1;// [0:No, 1:Yes]
//Panneau avant - Front panel
  FPanel        = 1;// [0:No, 1:Yes]
// button pins
  Pins          = 1; // button pins

//Texte façade - Front text
  Text          = 1;// [0:No, 1:Yes]

/*//////////////////////////////////////////////////////////////////
              -  mjesečno po svojem parkir  FB Aka Heartman/Hearty 2016     -                   
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


////////// - Paramètres de la boite - Box parameters - /////////////

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
FootClrX = 10; // foot center to panel clearance 25 for DB-9, 10 for tight
FootClrY = 10-3; // foot center to shell wall clearance
FootmvY = 3; // move foot out of center y direction

// - Epaisseur - Wall thickness  
Thick           = 2;//[2:5]  


/* [Box dimensions] */
// - Longueur - Length  
  Length        = PCBLength+2*(2*Thick+FootClrX);
// - Largeur - Width
  Width         = PCBWidth+2*(Thick+FootClrY);
// - Hauteur - Height  
  Height        = 26;
  
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
  m             = 0.5;
  mz            = 1.0; // panels height tolerance
// mounting legs clearance
  MountClearance = 0.1;
  // clearance between Top and Bottom shell
  ShellClearance = 0.0;


// mounting hole diameters
MountOuterHole = 2.5;
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



///////////////////////////////////// - Main - ///////////////////////////////////////

  // mounting hole xy-position
  Footx = 2*Thick+FootClrX;
  Footy = Thick+FootClrY+FootmvY;
  Fh = 17.5; // top feet height
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
  translate([Footx-10,Footy,0])
  {
      // cut off for WiFi
      translate([24,-10,6])
        cube([21,3,3],center=true);
      // cut off for HDMI
      translate([52,cy,12])
        cube([22,10,13],center=true);
      // cut off for AUDIO
      translate([31.5,cy,11])
        rotate([90,0,0])
          cylinder(d=13,h=10,$fn=32,center=true);
      // cut off for USB1
      translate([19.0,cy,9.5])
        cube([13,10,9],center=true);
      // cut off for USB2
      translate([77.30,cy,9.5])
        cube([13,10,9],center=true);
  }    
}

// xyz positions of all buttons
// relative to feet
button_pos =
[
  [PCBLength-7.5,PCBWidth-8.5,0], // btn0
  [1.5,18.5,0], // btn1
  [13.0,18.5,0], // btn2
  [PCBLength-19,8.5,0], // btn3
  [PCBLength-19,0,0], // btn4
  [PCBLength-30.5,0,0], // btn5
  [PCBLength-7.5,0,0] // btn6  
];

// addition to top shell - button tubes
module top_add()
{
  // mounting hole xy-position
  //footx = 2*Thick+FootClrX;
  //footy = Thick+FootClrY;
  tube_h=Height/2-3;
  tube_od=9; // tube outer diameter
  translate([Footx,Footy,Height-tube_h/2])
  {
      // btn hole
    for(i = [0:6])
      translate(button_pos[i])
        cylinder(d=tube_od,h=tube_h,$fn=12,center=true);
  }
  for(i = [0:3])
  {
    translate([0,0,Height-Fh/2])
    translate(Fxy[i])
    {
      cylinder(d=6,h=Fh,$fn=12,center=true);
      // small in-hole centering cylinders
      translate([0,0,-Fh/2-(PCBThick-0.1-0.001)])
        cylinder(d=3,h=PCBThick-0.1,$fn=32);
    }
  }
}


module button_pins()
{
  pin_d1=6; // top dia
  pin_h=Height/2+2; // total height
  pin_d2=8; // button touch dia
  pin_h2=2; // button touch h

  //footx = 2*Thick+FootClrX;
  //footy = Thick+FootClrY;

  translate([Footx,Footy,Height/2+0.5])
  for(i = [0:6])
    translate(button_pos[i])
      union()
      {
        cylinder(d=pin_d1,h=pin_h,$fn=32);
        cylinder(d=pin_d2,h=pin_h2,$fn=32);
      }
}


module top_cut()
{
  // mounting hole xy-position
  //footx = 2*Thick+FootClrX;
  //footy = Thick+FootClrY;
  tube_h=Height/2-3;
  tube_id=7; // button tube inner diameter
  translate([Footx,Footy,Height])
  {
      // 8-led view slit 
      translate([6,PCBWidth-11,0])
        cube([20,4,10],center=true);
      // 3-led view slit 
      translate([25,3,0])
        cube([10,4,10],center=true);
      // display (screen)
      if(1)
      translate([PCBLength/2-1,PCBWidth/2,0])
        cube([23,16,10],center=true);
      // display socket
      if(0)
      translate([PCBLength/2,8.5,0])
        cube([20,4,10],center=true);
      // btn hole
      translate([0,0,-tube_h/2])
      for(i = [0:6])
        translate(button_pos[i])
          cylinder(d=tube_id,h=tube_h+1,$fn=12,center=true);
  }
  // screw holes on top legs
  screwhole_h=10; // depth of the screw hole
  for(i=[0:3])
    translate([0,0,Height-Fh/2])
    translate(Fxy[i])
      translate([0,0,-screwhole_h/2-PCBThick])
      cylinder(d=1.8,h=screwhole_h,$fn=6,center=true);
}

BFclr = 0.5; // bottom feet clearance
// add bottom custom feet
module bottom_add()
{
  bfh=Height-Fh-PCBThick-BFclr; // bottom feet height
  for(i=[0:3])
    translate(Fxy[i])
      cylinder(d=6.5,h=bfh,$fn=12,center=false);

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
      cylinder(d=1.8,h=Height,$fn=12,center=false);
      // conical transition
      translate([0,0,bfhole-0.01])
        cylinder(d1=5,d2=1.8,h=transition+0.02,$fn=12,center=false);
      // screw head hole
      cylinder(d=5,h=bfhole,$fn=12,center=false);
    }
    // cut rails for PCB
    if(1)
    translate((Fxy[0]+Fxy[3])/2+[0,0,Height/2+(Height-Fh-PCBThick-BFclr)])
      cube([99,51.15,Height],center=true);

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

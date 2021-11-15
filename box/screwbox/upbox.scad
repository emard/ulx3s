/*//////////////////////////////////////////////////////////////////
              -    FB Aka Heartman/Hearty 2016     -                   
              -   http://heartygfx.blogspot.com    -                  
              -       OpenScad Parametric Box      -                     
              -         CC BY-NC 3.0 License       -                      
////////////////////////////////////////////////////////////////////                                                                                                             
12/02/2016 - Fixed minor bug 
28/02/2016 - Added holes ventilation option                    
09/03/2016 - Added PCB feet support, fixed the shell artefact on export mode. 
25/01/2018 - emard: separate upbox file to be included and customization

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
//PCBPosX         = 0;
// - Coin bas gauche - Low left corner Y position
//PCBPosY         = 0;
// - Longueur PCB - PCB Length
//PCBLength       = 15*2.54;
// - Largeur PCB - PCB Width
//PCBWidth        = 18*2.54;
// - Heuteur pied - Feet height
//FootHeight      = 6;
// - Diamètre pied - Foot diameter
//FootDia         = 7;
// - Diamètre trou - Hole diameter
//FootHole        = 1.8;
// - 3-foot mode, one foot width-asymmetric, 0 for normal 4-foot mode
//Foot3Width = 0;

// those clearances should be larger than
// the PCB edge to hole centers distances
//FootClrX = 7; // foot center to panel clearance
//FootClrY = 6; // foot center to shell wall clearance

// - Epaisseur - Wall thickness  
//Thick           = 2;//[2:5]  


/* [Box dimensions] */
// - Longueur - Length  
//  Length        = PCBLength+2*(2*Thick+FootClrX);
// - Largeur - Width
//  Width         = PCBWidth+2*(Thick+FootClrY);
// - Hauteur - Height  
//  Height        = 29;
  
/* [Box options] */
// Pieds PCB - PCB feet (x4) 
//  PCBFeet       = 1;// [0:No, 1:Yes]
// - Decorations to ventilation holes
//  Vent          = 0;// [0:No, 1:Yes]
// - Decoration-Holes width (in mm)
//  Vent_width    = 1.5;   
// - Text you want
//  txt           = "Name";
// - Font size  
//  TxtSize       = 5;                 
// - Font  
//  Police        ="Arial Black"; 
// - Diamètre Coin arrondi - Filet diameter  
//  Filet         = 2;//[0.1:12] 
// - lissage de l'arrondi - Filet smoothness  
//  Resolution    = 20;//[1:100] 
// - Tolérance - Tolerance (Panel/rails gap)
//  m             = 1.5;
// mounting legs clearance
//  MountClearance = 0.1;
  // clearance between Top and Bottom shell
//  ShellClearance = 0.1;


// mounting hole diameters
//MountOuterHole = 2.5;
//MountInnerHole = 1.8;

// fixation leg size
//MountLegSize = 16;
// fixation hole position from center
//MountHolePos = 2.5;



  
/* [Hidden] */
// - Couleur coque - Shell color  
//Couleur1        = "Orange";       
// - Couleur panneaux - Panels color    
//Couleur2        = "OrangeRed";    
// Thick X 2 - making decorations thicker if it is a vent to make sure they go through shell
//Dec_Thick       = Vent ? Thick*2 : Thick; 
// - Depth decoration
//Dec_size        = Vent ? Thick*2 : 0.8;

//////////////////// Oversize PCB limitation -Actually disabled - ////////////////////
//PCBL= PCBLength+PCBPosX>Length-(Thick*2+7) ? Length-(Thick*3+20+PCBPosX) : PCBLength;
//PCBW= PCBWidth+PCBPosY>Width-(Thick*2+10) ? Width-(Thick*2+12+PCBPosY) : PCBWidth;
//PCBL=PCBLength;
//PCBW=PCBWidth;
//echo (" PCBWidth = ",PCBW);



/////////// - Boitier générique bord arrondis - Generic Fileted box - //////////

module RoundBox($a=Length, $b=Width, $c=Height){// Cube bords arrondis
                    $fn=Resolution;            
                    translate([0,Filet,Filet]){  
                    minkowski (){                                              
                        cube ([$a-(Length/2),$b-(2*Filet),$c-(2*Filet)], center = false);
                        rotate([0,90,0]){    
                        cylinder(r=Filet,h=Length/2, center = false);
                            } 
                        }
                    }
                }// End of RoundBox Module

      
////////////////////////////////// - Module Coque/Shell - //////////////////////////////////         

module Coque(top=0){//Coque - Shell  
    Thick = Thick*2;  
    difference(){    
        difference(){//sides decoration
            union(){    
                     difference() {//soustraction de la forme centrale - Substraction Fileted box
                      
                        difference(){//soustraction cube median - Median cube slicer
                            union() {//union               
                            difference(){//Coque    
                                RoundBox();
                                translate([Thick/2,Thick/2,Thick/2]){     
                                        RoundBox($a=Length-Thick, $b=Width-Thick, $c=Height-Thick);
                                        }
                                        }//Fin diff Coque                            
                                difference(){//largeur Rails        
                                     translate([Thick+m,Thick/2,Thick/2]){// Rails
                                          RoundBox($a=Length-((2*Thick)+(2*m)), $b=Width-Thick, $c=Height-(Thick*2));
                                                          }//fin Rails
                                     translate([((Thick+m/2)*1.55),Thick/2,Thick/2+0.1]){ // +0.1 added to avoid the artefact
                                          RoundBox($a=Length-((Thick*3)+2*m), $b=Width-Thick, $c=Height-Thick);
                                                    }           
                                                }//Fin largeur Rails
                                    }//Fin union                                   
                               translate([-Thick,-Thick,Height/2]){// Cube à soustraire
                                    cube ([Length+100, Width+100, Height], center=false);
                                            }                                            
                                      }//fin soustraction cube median - End Median cube slicer
                               translate([-Thick/2,Thick,Thick]){// Forme de soustraction centrale 
                                    RoundBox($a=Length+Thick, $b=Width-Thick*2, $c=Height-Thick);       
                                    }                          
                                }                                          

                if(top < 0.5)
                for(i = [0:1])
                difference(){// Fixation box legs
                    union(){
                        translate([i*(Length-6*Thick-2*MountLegEdge)+3*Thick+MountLegEdge,Thick,Height/2]){
                            rotate([90,0,0]){
                                    $fn=6;
                                    cylinder(d=MountLegSize,Thick/2);
                                    }   
                            }
                       

                        translate([i*(Length-6*Thick-2*MountLegEdge)+3*Thick+MountLegEdge,Width-Thick,Height/2]){
                            rotate([-90,0,0]){
                                    $fn=6;
                                    cylinder(d=MountLegSize,Thick/2);
                                    }   
                            }

                        }
                            // angular cut 45 deg
                            translate([4,Thick+Filet,Height/2-57]){   
                             rotate([45,0,0]){
                                   cube([Length,40,40]);    
                                  }
                           }
                            // angular cut 45 deg
                            translate([4,Width-(Thick+Filet),Height/2-57]){   
                             rotate([45,0,0]){
                                   cube([Length,40,40]);    
                                  }
                           }
                           // clearance cut
                           translate([0,-(Thick*1.5-MountClearance),Height/2]){
                                cube([Length,Thick*2,10]);
                           }
                           // clearance cut
                           translate([0,Width-Thick*2+(Thick*1.5-MountClearance),Height/2]){
                               rotate([0,0,0])
                                cube([Length,Thick*2,10]);
                           }
                    } //Fin fixation box legs
            }

        union(){// outbox sides decorations
            //if(Thick==1){Thick=2;
            for(i=[0:Thick:Length/4]){

                // Ventilation holes part code submitted by Ettie - Thanks ;) 
                    translate([10+i,-Dec_Thick+Dec_size,1]){
                    cube([Vent_width,Dec_Thick,Height/4]);
                    }
                    translate([(Length-10) - i,-Dec_Thick+Dec_size,1]){
                    cube([Vent_width,Dec_Thick,Height/4]);
                    }
                    translate([(Length-10) - i,Width-Dec_size,1]){
                    cube([Vent_width,Dec_Thick,Height/4]);
                    }
                    translate([10+i,Width-Dec_size,1]){
                    cube([Vent_width,Dec_Thick,Height/4]);
                    }
  
                
                    }// fin de for
               // }
                }//fin union decoration
            }//fin difference decoration

            if(MountLegSize > 0.001)
            if(top < 0.5)
            for(i = [0:1])
            union(){ //sides inner holes
                $fn=20;
                translate([i*(Length - 6*Thick-2*MountLegEdge) + 3*Thick+MountLegEdge,20,Height/2+MountHolePos]){
                    rotate([90,0,0]){
                    cylinder(d=MountInnerHole,20);
                    }
                }
                translate([i*(Length - 6*Thick-2*MountLegEdge) + 3*Thick+MountLegEdge,Width-20,Height/2+MountHolePos]){
                    rotate([-90,0,0]){
                    cylinder(d=MountInnerHole,20);
                    }
                }
            }
            if(MountLegSize > 0.001)
            if(top > 0.5)
            for(i = [0:1])
            union() // sides outer holes
            {
                $fn=20;
                translate([i*(Length - 6*Thick-2*MountLegEdge) + 3*Thick+MountLegEdge,5,Height/2-MountHolePos+ShellClearance]){
                    rotate([90,0,0]){
                    cylinder(d=MountOuterHole,20);
                    }
                }
                translate([i*(Length - 6*Thick-2*MountLegEdge) + 3*Thick+MountLegEdge,Width+5,Height/2-MountHolePos+ShellClearance]){
                    rotate([90,0,0]){
                    cylinder(d=MountOuterHole,20);
                    }
                }
            }//fin de sides holes

        }//fin de difference holes
}// fin coque 

////////////////////////////// - Experiment - ///////////////////////////////////////////


///////////////////////////////// - Module Front/Back Panels - //////////////////////////
                            
module Panels(){//Panels
    color(Couleur2){
        translate([Thick+m,m/2,mz/2]){
             difference(){
                  translate([0,Thick,Thick]){ 
                     RoundBox(Length,Width-((Thick*2)+m),Height-((Thick*2)+mz));}
                  translate([Thick,-5,0]){
                     cube([Length,Width+10,Height]);}
                     }
                }
         }
}


/////////////////////// - Foot with base filet - /////////////////////////////
module foot(FootDia,FootHole,FootHeight){
    Filet=2;
    color("Orange")   
    translate([0,0,Filet-1.5])
    difference(){
    
    difference(){
            //translate ([0,0,-Thick]){
                cylinder(d=FootDia+Filet,FootHeight-Thick, $fn=100);
                        //}
                    rotate_extrude($fn=100){
                            translate([(FootDia+Filet*2)/2,Filet,0]){
                                    minkowski(){
                                            square(10);
                                            circle(Filet, $fn=100);
                                        }
                                 }
                           }
                   }
            cylinder(d=FootHole,FootHeight+1, $fn=100);
               }          
}// Fin module foot
  
module Feet(){     
//////////////////// - PCB only visible in the preview mode - /////////////////////    
    translate([2*Thick+2,Thick+5,FootHeight+(Thick/2)-0.5]){
    
    if(0)
    {
    %square ([PCBL+10,PCBW+10]);
       translate([PCBL/2,PCBW/2,0.5]){ 
        color("Olive")
        %text("PCB", halign="center", valign="center", font="Arial black");
       }
    } // Fin PCB 
    }
    
////////////////////////////// - 4 Feet - //////////////////////////////////////////     
    translate([2*Thick+FootClrX,Thick+FootClrY,Thick/2]){
        foot(FootDia,FootHole,FootHeight);
    }
    translate([2*Thick+FootClrX,(Thick)+PCBW+FootClrY,Thick/2]){
        foot(FootDia,FootHole,FootHeight);
    }   

    if(Foot3Width < 0.001)
    {
        // 4-foot mode
    translate([(2*Thick)+PCBL+FootClrX,(Thick)+PCBW+FootClrY,Thick/2]){
        foot(FootDia,FootHole,FootHeight);
        }        
    translate([(2*Thick)+PCBL+FootClrX,Thick+FootClrY,Thick/2]){
        foot(FootDia,FootHole,FootHeight);
        }
    }
    else
    {
        // 3-foot mode
    translate([(2*Thick)+PCBL+FootClrX,(Thick)+Foot3Width+FootClrY,Thick/2]){
        foot(FootDia,FootHole,FootHeight);
        }        
    }
} // Fin du module Feet
 

///////////////////////////////////// - Main - ///////////////////////////////////////

module rear_panel()
{
  translate([-m/2,0,0])
    Panels();
}

module front_panel()
{
  rotate([0,0,180])
    translate([-Length-m/2,-Width,0])
       Panels();

if(Text==1)
// Front text
color(Couleur1){     
     translate([Length-(Thick)-m/2,Width/2+Thick*0,(Height/2-(-Thick-m/2+(TxtSize/2)))]){// x,y,z
          rotate([90,0,90]){
              linear_extrude(height = 1.0){
              text(txt, font = Police, size = TxtSize,  valign ="center", halign ="center");
                        }
                 }
         }
}
}

module bottom_shell()
{
color(Couleur1){ 
Coque(top=0);
if (PCBFeet==1)  // Feet
  translate([PCBPosX,PCBPosY,0])
    Feet();
}
}

// Coque haut - Top Shell
module top_shell()
{
  color( Couleur1,1)
  {
    translate([Length,0,Height+ShellClearance]){
        rotate([0,180,0]){
                Coque(top=1);
                }
        }

  }
}

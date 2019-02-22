/* ========================================================
   Main sketch file for Proc-And-Shout project
   ======================================================*/

// Constants
final int SIZE_X = 940;
final int SIZE_Y = 645;
final color DIVCOLOR1 = #58B964;
final color DIVCOLOR2 = color(73, 184, 196);

final int DT = 2; // Delta used for distance between frames

// Scenario variables
CPanel[] panels;

// Special handlers
public void settings(){size(SIZE_X, SIZE_Y);}

void setup(){
  //smooth();
  background(0);
  
  /*************************/
  /* Frames configurations */
  /*************************/
  InitScenario(SIZE_X, SIZE_Y);
}

void draw(){
  background(0);
  DisplayScenario();
  
}
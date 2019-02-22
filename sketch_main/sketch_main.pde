/* ========================================================
   Main sketch file for Proc-And-Shout project
   ======================================================*/

// Constants
final int SIZE_X = 940;
final int SIZE_Y = 645;
final color DIVCOLOR1 = #58B964;
final color DIVCOLOR2 = color(73, 184, 196);
final int DT = 2; // Delta used for distance between frames

// Fonts
PFont FONT_TITLE;
final color FONT_TITLE_COLOR = #FFCC00;
PFont FONT_LOG;
final color FONT_LOG_COLOR = #BE3214;

// Scenario variables
CPanel[] panels;
CLabel[] title_labels;
CTextBox_Log event_log;

// Special handlers
public void settings(){size(SIZE_X, SIZE_Y);}
int i = 0;
  
void setup(){
  FONT_TITLE = createFont("Arial Black", 12);
  FONT_LOG   = createFont("Tahoma Bold", 10);
  
  //smooth();
  background(0);
  
  /*************************/
  /* Frames configurations */
  /*************************/
  InitScenario(SIZE_X, SIZE_Y);
  
  // Console messages
  //print(PFont.list());

  event_log.Append(str(i++));
}

void draw(){
  background(0);
  DisplayScenario();

  // Console messages
  event_log.Append(str(i++));

}

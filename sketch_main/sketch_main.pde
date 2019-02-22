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

PFont FONT_BUTTON;
final color COLOR_BUTTON_TEXT       = #FFCC00;

final color COLOR_BUTTON_ON_STROKE  = 0xff002D5A;
final color COLOR_BUTTON_ON         = BLUE;
final color COLOR_BUTTON_ON_HOVER   = 0xff00b4ea;

final color COLOR_BUTTON_OFF_STROKE = 0xffaa0000;
final color COLOR_BUTTON_OFF        = 0xff660000;
final color COLOR_BUTTON_OFF_HOVER  = RED;

// Scenario variables
CPanel[] panels;
CLabel[] title_labels;
CTextBox_Log event_log;
CButton[] monkeys;

// Special handlers
public void settings(){size(SIZE_X, SIZE_Y);}
int i = 0;
  
void setup(){
  FONT_TITLE  = createFont("Arial Black", 12);
  FONT_LOG    = createFont("Tahoma Bold", 10);
  FONT_BUTTON = createFont("Verdana", 10);
  
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

/* ========================================================
   Sketch responsible for managing the scenario drawings
   ======================================================*/

void InitScenario(int sx, int sy){
  
  // Panels definitions
  
  panels    = new CPanel[4];
  panels[0] = new CPanel(0, 0, sx, sy);
  panels[1] = new CPanel(DT, DT, 100*DT, sy-2*DT);
  panels[2] = new CPanel(panels[1].orig.x + panels[1].size.x + DT, 
                         panels[1].orig.y,
                         sx - panels[1].size.x - 3*DT,
                         panels[1].size.y - 51*DT);
  panels[3] = new CPanel(panels[1].orig.x + panels[1].size.x + DT, 
                         panels[2].size.y + DT,
                         sx - panels[1].size.x - 3*DT,
                         sy - panels[2].size.y - 2*DT);
  
  // Title labels definitions
  title_labels    = new CLabel[3];
  title_labels[0] = new CLabel(panels[1].orig.x + 2*DT, 
                               panels[1].orig.y + 7*DT,
                               "Events");
  title_labels[1] = new CLabel(panels[2].orig.x + 2*DT, 
                               panels[2].orig.y + 7*DT,
                               "Environment");
  title_labels[2] = new CLabel(panels[3].orig.x + 2*DT, 
                               panels[3].orig.y + 7*DT,
                               "Control");
                               
  // Event Log
  event_log = new CTextBox_Log(panels[1].orig.x + 2*DT,
                               title_labels[0].orig.y + 3*DT,
                               panels[1].size.x - 14*DT,
                               panels[1].size.y - 20*DT);

}

void DisplayScenario(){
  
  stroke(DIVCOLOR2);
  strokeWeight(2);
  noFill();
  
  for (int i = 0; i<panels.length; i++) panels[i].Show();
  for (int i = 0; i<title_labels.length; i++) title_labels[i].Show();
  event_log.Show();
}

/* ========================================================
   Sketch responsible for managing the scenario drawings
   ======================================================*/

void InitScenario(int sx, int sy){
  
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
  
}

void DisplayScenario(){
  
  stroke(DIVCOLOR2);
  strokeWeight(2);
  noFill();
  
  for (int i = 0; i<panels.length; i++) panels[i].drawRect();
}

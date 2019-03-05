/* ========================================================
 Sketch responsible for managing the scenario drawings
 ======================================================*/

class CButton0HAndler implements IGenericHandler {
  @Override
    public void HandleClicks(CButton src) {
      Boolean success;
      event_log.Append("Button0 clicked");
      if (!src.state) { // If not connected, connect
        src.state = ConnectClient();
      } 
      else { // If connected, disconnect
        src.state = !DisconnectClient(); // Disconnected with success indicates that the state is disconnected.
      }

      if (src.state) 
        src.SetText("[ON] Disconnect");
      else 
        src.SetText("[OFF] Connect");

      event_log.Append("Button0 new state = "+src.state + ".");
  }
}

class CButton1HAndler implements IGenericHandler {
  @Override
    public void HandleClicks(CButton src) {
    //event_log.Append("Button1 clicked");
    src.state = !src.state;
    if (src.state == true) 
      src.SetText("[ON] Disconnect");
    else 
    src.SetText("[OFF] Connect");

    event_log.Append("Button1 new state = "+src.state + ".");
  }
}

void InitScenario(int sx, int sy) {

  // ####################################
  // Panels definitions
  // ####################################
  
  panels    = new CPanel[4];
  
  // Out border panel
  panels[0] = new CPanel(0, 0, sx, sy);
  
  // Events logger panel
  panels[1] = new CPanel(DT, DT, 150*DT, sy-2*DT);
  
  // Environment panel
  panels[2] = new CPanel(panels[1].orig.x + panels[1].size.x + DT, 
    panels[1].orig.y, 
    sx - panels[1].size.x - 3*DT, 
    panels[1].size.y - 51*DT);
    
  // Control panel
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

  // Buttons
  monkeys = new CButton[2];
  monkeys[0] =new CButton(new CButton0HAndler(), 
    panels[2].orig.x + 2*DT, 
    title_labels[2].orig.y + 3*DT, 
    140, 20, "[OFF] Connect");
  monkeys[1] =new CButton(new CButton1HAndler(), 
    monkeys[0].orig.x + monkeys[0].size.x + 2*DT, 
    title_labels[2].orig.y + 3*DT, 
    140, 20, "[OFF] Connect");
}

void DisplayScenario() {

  stroke(DIVCOLOR2);
  strokeWeight(2);
  noFill();

  for (int i = 0; i<panels.length; i++) panels[i].Show();
  for (int i = 0; i<title_labels.length; i++) title_labels[i].Show();
  for (int i = 0; i<monkeys.length; i++) monkeys[i].Show();

  event_log.Show();
}

// Automatic event handler for mouse clicks
void mouseClicked() {
  for (int i = 0; i<monkeys.length; i++) if (monkeys[i]._handler != null) monkeys[i].HandleClicks();
}

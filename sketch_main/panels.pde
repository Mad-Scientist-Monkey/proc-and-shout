class CPoint{
    int x;
    int y;
    CPoint(int px, int py){x = px; y = py;}
}

class CPanel{
  CPoint orig;
  CPoint size;
  
  CPanel(int ox, int oy, int sx, int sy){
      orig = new CPoint(ox, oy);
      size = new CPoint(sx, sy);
  }
  
  CPoint getOrig(){return orig;}
  CPoint getSize(){return size;}
  
  void Show(){
    rect(orig.x, orig.y, size.x, size.y);
  }
}

class CLabel{
    CPoint orig;
    String _label;
    PFont  _font  = FONT_TITLE;
    color  _color = FONT_TITLE_COLOR;
    
    CLabel(int ox, int oy, String plabel){
      orig  = new CPoint(ox, oy);
      _label = plabel;
    }
    
    void SetFont(PFont pfont){_font = pfont;}
    void SetColor(color pcolor){_color = pcolor;}
    
    void Show(){
      textFont(_font);
      fill(_color);
      text(_label, orig.x, orig.y);
    }
}

class CTextBox{
   CPoint orig;
   CPoint size;
   String _text = "abigobalabigobalabigobalabigobalabigobalabigobalabigobal\nabigobal\nabigobal\nabigobal"+
                  "\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal"+
                  "\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal"+
                  "\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal"+
                  "\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal"+
                  "\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal"+
                  "\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal"+
                  "\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\nabigobal\n";
   PFont _font  = FONT_LOG;
   color _color = FONT_LOG_COLOR;
   
   CTextBox(int ox, int oy, int sx, int sy){
     orig = new CPoint(ox, oy);
     size = new CPoint(sx, sy);
   }
   
    void SetFont(PFont pfont){_font = pfont;}
    void SetColor(color pcolor){_color = pcolor;}
    
    void Set_Text(String t){_text = t;}
    void Append(String t){_text = t + "\n" + _text;}
    
    void Show(){
      textFont(_font);
      fill(_color);
      text(_text, orig.x, orig.y, orig.x + size.x, orig.y + size.y);
    }
}

class CTextBox_Log extends CTextBox{
   CTextBox_Log(int ox, int oy, int sx, int sy){super(ox, oy, sx, sy);}
   void Append(String t){_text = nf(hour(),2)+":"+nf(minute(),2)+":"+nf(second(),2)+">" + t + "\n" + _text;}
}

interface IGenericHandler{
  void HandleClicks(CButton src);
}

class CButton{
  CPoint orig;
  CPoint size;
  String _text;
  Boolean state = false;
  IGenericHandler _handler;
  
  PFont _font             = FONT_BUTTON;
  color _color_font       = COLOR_BUTTON_TEXT;
  color _color_on         = COLOR_BUTTON_ON;
  color _color_on_stroke  = COLOR_BUTTON_ON_STROKE;
  color _color_on_hover   = COLOR_BUTTON_ON_HOVER;
  color _color_off        = COLOR_BUTTON_OFF;
  color _color_off_stroke = COLOR_BUTTON_OFF_STROKE;
  color _color_off_hover  = COLOR_BUTTON_OFF_HOVER;
  
  CButton(IGenericHandler handler, int ox, int oy, int sx, int sy, String ptext){
    orig = new CPoint(ox, oy);
    size = new CPoint(sx, sy);
    _text = ptext;
    _handler = handler;
  }
   
  void SetFont(PFont pfont){_font = pfont;}
  void SetColor(color font, color on, color on_stroke, color on_hover, color off, color off_stroke, color off_hover){
    _color_font = font;
    _color_on = on;
    _color_on_stroke = on_stroke;
    _color_on_hover = on_hover;
    _color_off = off;
    _color_off_stroke = off_stroke;
    _color_off_hover = off_hover;
  }
  void SetText(String ptext){_text = ptext;}
  
  void Show(){

    color col_button = _color_off;
    if (state){
      if (IsHover()) col_button = _color_on_hover;
      else col_button = _color_on;
      stroke(_color_on_stroke);
    }
    else{ // not state
      if (IsHover()) col_button = _color_off_hover;
      else col_button = _color_off;
      stroke(_color_off_stroke);
    }
    fill(col_button);
    rect(orig.x, orig.y, size.x, size.y);
    
    textFont(_font);
    fill(_color_font);
    text(_text, orig.x + 3*DT, orig.y + 2*DT, orig.x + size.x, orig.y + size.y);
  }
  
  Boolean IsHover(){
    if (mouseX >= orig.x && mouseX <= orig.x + size.x &&
        mouseY >= orig.y && mouseY <= orig.y + size.y)
        return true;
     return false;
  }
  
  // Function void mouseClicked() has to be included somewhere and call this method
  // for this service to be run
  void HandleClicks(){
    if (IsHover()) _handler.HandleClicks(this);
  }
}

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
    
    void Write(String t){_text = t;}
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

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
    PFont  _font = FONT_TITLE;
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

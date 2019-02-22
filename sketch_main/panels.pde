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
    String label;
    
    CLabel(int ox, int oy, String plabel){
      orig  = new CPoint(ox, oy);
      label = plabel;
    }
    
    void Show(){
      text(label, orig.x, orig.y);
    }
}

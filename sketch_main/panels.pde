class CPoint{
    int x;
    int y;
    CPoint(int px, int py){x = px; y = py;}
}

class CPanel{
  CPoint orig;
  CPoint size;
  
  CPanel(int rx, int ry, int sx, int sy){
      orig  = new CPoint(rx, ry);
      size = new CPoint(sx, sy);
  }
  
  CPoint getOrig(){return orig;}
  CPoint getSize(){return size;}
  
  void drawRect(){
    rect(orig.x, orig.y, size.x, size.y);
  }

}

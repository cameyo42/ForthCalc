// *************************************************
// Button (click and go)
// *************************************************
//Button btn = new Button(x, y, btn_IMG, "text", textCol, "method");
class Button
{
  // parameters
  int x, y;
  PImage icon;
  String t;
  color ct;
  String m;

  // variables
  int ww; // icon width
  int hh; // icon height

  // constructor
  Button(int ix, int iy, PImage _icon, String it, color ict, String im)
  {
    x = ix; // start x (upper left)
    y = iy; // start y (upper left)
    icon = _icon; // icon tool
    t = it; // text string
    ct = ict; // text color
    m = im; // method (function)

    // variables
    ww = icon.width;
    hh = icon.height;
  }

  boolean isOver()
  {
    return(mouseX>=x&&mouseX<=x+ww&&mouseY>=y&&mouseY<=y+hh);
  }

  void onClick()
  {
    if (isOver() && !m.equals(""))
    {
      method(m);
    }
  }

  void show()
  {
    pushStyle();
    image(icon, x, y);
    if (t != "")
    {
      fill(ct);
      textAlign(CENTER);
      text(t,x+ww/2,y+hh+12);
    }
    popStyle();
  }
}
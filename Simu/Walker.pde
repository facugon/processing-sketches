
class Walker {
  int x;
  int y;
  Walker(int xpos, int ypos) {
    x = xpos;
    y = ypos;
  }
  
  void display() {
    stroke(0);
    ellipse(x,y,20,20);
  }
  
  void step() {
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    x += stepx;
    y += stepy;
  }
  
}



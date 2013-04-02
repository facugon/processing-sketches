
Walker w ;

void setup() {
  size(640,480);

  w = new Walker( int(random(width)), int(random(height)) );
  background(255);
}

void draw() {
  w.step();
  w.display();
}


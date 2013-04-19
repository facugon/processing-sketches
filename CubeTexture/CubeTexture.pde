import remixlab.proscene.*;

Scene scene;

PShape box ;
void setup()
{
  size(800, 600, P3D);
  scene = new Scene(this);
  noStroke();
  
  textureMode(NORMAL);
  PImage img = loadImage("briks3.jpg");
  box = createShape(QUADS);
  box.texture(img);


  box.vertex(-120, -20,  20, 0, 0);
  box.vertex( 120, -20,  20, 1, 0);
  box.vertex( 120,  20,  20, 1, 1);
  box.vertex(-120,  20,  20, 0, 1);

  box.vertex( 120, -20, -20, 0, 0);
  box.vertex(-120, -20, -20, 1, 0);
  box.vertex(-120,  20, -20, 1, 1);
  box.vertex( 120,  20, -20, 0, 1);

  box.vertex(-120,  20,  20, 0, 0);
  box.vertex( 120,  20,  20, 1, 0);
  box.vertex( 120,  20, -20, 1, 1);
  box.vertex(-120,  20, -20, 0, 1);

  box.vertex(-120, -20, -20, 0, 0);
  box.vertex( 120, -20, -20, 1, 0);
  box.vertex( 120, -20,  20, 1, 1);
  box.vertex(-120, -20,  20, 0, 1);

  box.vertex( 120, -20,  20, 0, 0);
  box.vertex( 120, -20, -20, 1, 0);
  box.vertex( 120,  20, -20, 1, 1);
  box.vertex( 120,  20,  20, 0, 1);

  box.vertex(-120, -20, -20, 0, 0);
  box.vertex(-120, -20,  20, 1, 0);
  box.vertex(-120,  20,  20, 1, 1);
  box.vertex(-120,  20, -20, 0, 1);

  box.translate(10,10,10);

  box.end(CLOSE);
}

void draw()
{
    background(0); 

    shape(box);
}

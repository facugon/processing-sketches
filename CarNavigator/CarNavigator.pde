import SimpleOpenNI.*;
import remixlab.proscene.*;

SimpleOpenNI kinect;

Scene scene;
PShape car;

PVector initialPosition = new PVector( 0.0, 340.0, 180.0 );

TheWall bwall ;
TheWall rwall ;
TheWall lwall ;
TheWall floor ;


void setup()
{
  size(800, 600, P3D);
  scene = new Scene(this);
  scene.setAxisIsDrawn(false);
  scene.setGridIsDrawn(false);
  scene.camera().setPosition( initialPosition );
  scene.camera().lookAt( scene.camera().sceneCenter() );
  scene.setRadius(200);

  /*
       kinect = new SimpleOpenNI(this);
   kinect.enableDepth();
   kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
   kinect.setMirror(true);
   */
  car = loadShape("data/Gta-spano-2010.obj");
  //println("aca"+model.width+model.height);
  //model.scale(5);
  car.enableStyle();
  //lo pongo derecho.
  car.rotateX(radians(-270));
  car.rotateY(radians(-180));


  bwall = new TheWall(
  new PVector(-240, -240, 0), 
  new PVector( 240, -240, 0), 
  new PVector( 120, 10, 100)
    );

  lwall = new TheWall(
  new PVector(-240, -200, 0), 
  new PVector(-240, 200, 0), 
  new PVector( 10, 120, 100)
    );

  rwall = new TheWall(
  new PVector( 240, -200, 0), 
  new PVector( 240, 200, 0), 
  new PVector( 10, 120, 100)
    );

  floor = new TheWall(
  new PVector(-240, -240, 0), 
  new PVector( 240, 240, 0), 
  new PVector( 120, 120, -10)
    );
  floor.setTexture(loadImage("briks2.jpg"));
  
    car.translate(0, 0, 10);

}

void draw() {

  lights();
  directionalLight(255, 200, 200, -1, -1, -1);
  background(0);  

  bwall.draw();
  lwall.draw();
  rwall.draw();
  floor.draw();

  shape(car, 0, 0);
}



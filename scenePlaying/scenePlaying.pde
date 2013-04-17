import SimpleOpenNI.*;
import remixlab.proscene.*;

SimpleOpenNI kinect;

Scene scene;
PShape model;

PVector initialPosition = new PVector( 50.0, 240.0, 180.0 );

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
  model = loadShape("data/Gta-spano-2010.obj");
  //println("aca"+model.width+model.height);
  //model.scale(5);
  model.enableStyle();
  //lo pongo derecho.
  model.rotateX(radians(-270));
  model.rotateY(radians(-180));
}

void draw() {

  background(0);  
  lights();
/**
  for(int x=0;x<18;x++){
      for(int y=0;y<18;y++){
          for(int z=0;z<18;z++){
              pushMatrix();                       
              scale(20);
              translate(x,y,z);
              fill(255);
              stroke(0);
              if( x==0 || x==17 || y==0 || y==17 || z==12)
                  box(1);
              popMatrix();
          }
      }
  }
**/
  pushMatrix();

  shape(model, 0, 0);
  popMatrix();
  
//  print(scene.center() + "\n");
//  print(scene.radius() + "\n");
}

/**
 * Camera Interpolation.
 * by Jean Pierre Charalambos.
 * 
 * This example (together with Frame Interpolation) illustrates the
 * KeyFrameInterpolator functionality.
 * 
 * KeyFrameInterpolator smoothly interpolate its attached Camera Frames over time
 * on a path defined by Frames. The interpolation can be started/stopped/reset,
 * played in loop, played at a different speed, etc...
 * 
 * In this example, a Camera path is defined by four InteractivedCameraFrames
 * which are attached to the first Camera path (the Camera holds five such paths).
 * The Frames can be moved with the mouse, making the path editable. The Camera
 * interpolating path is played with the shortcut '1'.
 * 
 * Press CONTROL + '1' to add (more) key frames to the Camera path.
 * 
 * Press ALT + '1' to delete the Camera path.
 *
 * The displayed texts are interactive. Click on them to see what happens.
 * 
 * The Camera holds 5 KeyFrameInterpolators, binded to [1..5] keys. Pressing
 * CONTROL + [1..5] adds key frames to the specific path. Pressing ALT + [1..5]
 * deletes the specific path. Press 'r' to display all the key frame camera paths
 * (if any). The displayed paths are editable.
 * 
 * Press 'h' to display the global shortcuts in the console.
 * Press 'H' to display the current camera profile keyboard shortcuts
 * and mouse bindings in the console.
 */

import remixlab.proscene.*;

Scene scene;
ArrayList buttons;
int h;
PShape model;

void setup() {
  size(800, 600, P3D);
  scene = new Scene(this);
    scene.setAxisIsDrawn(false);
  scene.setGridIsDrawn(false);
  
  model = loadShape("data/Gta-spano-2010.obj");
  //println("aca"+model.width+model.height);
  //model.scale(5);
  model.enableStyle();
  //lo pongo derecho.
  model.rotateX(radians(-180));
  model.rotateY(radians(-180));


}

void draw() {
  background(0);  
  lights();
  translate(0,0,0);
  pushMatrix();
    translate(width/4,-height/4, 0);
    rotateY(radians(180));
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
  popMatrix();
  pushMatrix();
   translate(0, 0, 0);
   //rotateY(radians(180));
   //rotateX(radians(270));
  // box (30);
   //hace una sombra fea.
   shape(model,0,0);
  popMatrix();

}


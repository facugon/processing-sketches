import pbox2d.*;

import processing.opengl.*;
import SimpleOpenNI.*;
import saito.objloader.*;

SimpleOpenNI kinect;
OBJModel model;

void setup()
{
    size(1024, 768, OPENGL);
    model = new OBJModel(this, "model.obj", "relative", TRIANGLES);
    //model.translateToCenter();

    kinect = new SimpleOpenNI(this);
    kinect.enableDepth();
    kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
    kinect.setMirror(true);
    
    noStroke();
    noFill();
    //fill(255, 0, 0);
}

PImage colorImage;
boolean gotImage;

void draw() {
    kinect.update();
    background(255);

    translate(width/2, height/2, 0);

    rotateX(radians(180));
    scale(1.5);
    
    IntVector userList = new IntVector();
    kinect.getUsers(userList);
    if (userList.size() > 0) {
        int userId = userList.get(0);
        if ( kinect.isTrackingSkeleton(userId)) {
            
          drawSkeleton(userId);
            
            PVector position = new PVector();
            
            kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HAND, position);
            
            PMatrix3D orientation = new PMatrix3D();
            
            float confidence = kinect.getJointOrientationSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, orientation);


            pushMatrix();
            stroke(255,0,0);
            strokeWeight(1);
            //rotateX(radians(90));// 180 + 90 = 270º

             translate(position.x, position.y, position.z);
            applyMatrix(orientation);
            // lights();
                        scale(20);
            model.draw();
            popMatrix();
        }
    }
}

// user-tracking callbacks!
void onNewUser(int userId) {
    println("start pose detection");
    kinect.startPoseDetection("Psi", userId);
}
void onEndCalibration(int userId, boolean successful) {
    if (successful) {
        println(" User calibrated !!!");
        kinect.startTrackingSkeleton(userId);
    }
    else {
        println(" Failed to calibrate user !!!");
        kinect.startPoseDetection("Psi", userId);
    }
}
void onStartPose(String pose, int userId) {
    println("Started pose for user");
    kinect.stopPoseDetection(userId);
    kinect.requestCalibrationSkeleton(userId, true);
}


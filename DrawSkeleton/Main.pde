import processing.opengl.*;
import SimpleOpenNI.*;

SimpleOpenNI kinect;

void setup() {
    size(1028, 768, OPENGL);
    kinect = new SimpleOpenNI(this);
    kinect.enableDepth();
    kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
    kinect.setMirror(true);
    fill(255, 0, 0);
}

void draw() {
    kinect.update();
    background(255);
    translate(width/2, height/2, 0);
    rotateX(radians(180));
    IntVector userList = new IntVector();
    kinect.getUsers(userList);
    if (userList.size() > 0) {
        int userId = userList.get(0);
        if ( kinect.isTrackingSkeleton(userId)) {
            PVector position = new PVector();
            kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_TORSO, position);
            PMatrix3D orientation = new PMatrix3D();
            float confidence = kinect.getJointOrientationSkeleton(userId,SimpleOpenNI.SKEL_TORSO,orientation);
            println(confidence);
            drawSkeleton(userId);
            pushMatrix();
            // move to the position of the TORSO
            translate(position.x, position.y, position.z);
            // adopt the TORSO’s orientation
            // to be our coordinate system
            applyMatrix(orientation);
            // draw x-axis in red
            stroke(255, 0, 0);
            strokeWeight(3);
            line(0, 0, 0, 150, 0, 0);
            // draw y-axis in blue
            stroke(0, 255, 0);
            line(0, 0, 0, 0, 150, 0);
            // draw z-axis in green
            stroke(0, 0, 255);
            line(0, 0, 0, 0, 0, 150);
            popMatrix();
        }
    }
}



void drawHappy(int userId)
{
  
  noStroke();
  noFill();
  

    PVector joint = new PVector();

    float confidence = kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_HEAD, joint);
    if(confidence < 0.5) return;

    PVector convertedJoint = new PVector();
    kinect.convertRealWorldToProjective(joint, convertedJoint);
    
    stroke(0);
    strokeWeight(5);
    fill(255,0,0);
    ellipse(convertedJoint.x, convertedJoint.y, 100, 100);

}

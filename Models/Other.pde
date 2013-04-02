
void drawSkeleton(int userId)
{
    drawLimb(userId, SimpleOpenNI.SKEL_HEAD,            SimpleOpenNI.SKEL_NECK);
    drawLimb(userId, SimpleOpenNI.SKEL_NECK,            SimpleOpenNI.SKEL_LEFT_SHOULDER);
    drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER,            SimpleOpenNI.SKEL_LEFT_ELBOW);
    drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW,            SimpleOpenNI.SKEL_LEFT_HAND);
    drawLimb(userId, SimpleOpenNI.SKEL_NECK,            SimpleOpenNI.SKEL_RIGHT_SHOULDER);
    drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER,            SimpleOpenNI.SKEL_RIGHT_ELBOW);
    drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW,            SimpleOpenNI.SKEL_RIGHT_HAND);
    drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER,            SimpleOpenNI.SKEL_TORSO);
    drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER,            SimpleOpenNI.SKEL_TORSO);
    drawLimb(userId, SimpleOpenNI.SKEL_TORSO,            SimpleOpenNI.SKEL_LEFT_HIP);
    drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP,            SimpleOpenNI.SKEL_LEFT_KNEE);
    drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE,            SimpleOpenNI.SKEL_LEFT_FOOT);
    drawLimb(userId, SimpleOpenNI.SKEL_TORSO,            SimpleOpenNI.SKEL_RIGHT_HIP);
    drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP,            SimpleOpenNI.SKEL_RIGHT_KNEE);
    drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE,            SimpleOpenNI.SKEL_RIGHT_FOOT);
    drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP,            SimpleOpenNI.SKEL_LEFT_HIP);
}
void drawLimb(int userId,int jointType1,int jointType2)
{
    PVector jointPos1 = new PVector();
    PVector jointPos2 = new PVector();
    float confidence;
    confidence = kinect.getJointPositionSkeleton(userId,jointType1,jointPos1);
    confidence += kinect.getJointPositionSkeleton(userId,jointType2,jointPos2);
    stroke(100);
    strokeWeight(5);
    if(confidence > 1)
    {
        line(jointPos1.x, jointPos1.y, jointPos1.z, jointPos2.x, jointPos2.y, jointPos2.z);
    }
}

boolean globalsetstroke=true;

void keyPressed(){
    if(key == '1'){        model.shapeMode(LINES);    }
    else if (key == '2'){        model.shapeMode(TRIANGLES);    }
    else if (key == '3'){        model.shapeMode(POINT);    }
    else if (key == '4'){        model.shapeMode(QUADS);    }
    else if (key == '5'){        model.shapeMode(POLYGON);    }
    else if (key == '6'){
      if( globalsetstroke )
         globalsetstroke=false;
      else 
      globalsetstroke=true;
    }

}


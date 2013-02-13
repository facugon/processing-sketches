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
void onStartPose(String pose, int userId)
{
    println("Started pose for user");
    kinect.stopPoseDetection(userId);
    kinect.requestCalibrationSkeleton(userId, true);
}


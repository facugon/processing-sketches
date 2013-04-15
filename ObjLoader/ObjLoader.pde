
BaneBoss boss; 

float rotateX;
float rotateY;
float rotateZ;

float eyeX, eyeY, eyeZ ;
float centerX, centerY, centerZ ;
float upX, upY, upZ ;

void setup()
{
    size(640, 480, P3D);
    boss = new BaneBoss(width/2, height/2, -200);

    reset();

    noStroke();
}

void reset() {
    upX = 0.0 ;
    upY = 1.0 ;
    upZ = 0.0 ;

    centerX = width/2 ; 
    centerY = height/2 ;
    centerZ = 0.0 ;

    eyeX = width/2 ;
    eyeY = height/2 ;
    eyeZ = (height/2) / tan(PI*30.0/180.0) ;
}

void draw()
{
    background(0);
    boss.draw();

    camera( 
            eyeX, eyeY, eyeZ, 
            centerX, centerY, centerZ, 
            upX, upY, upZ  );
}

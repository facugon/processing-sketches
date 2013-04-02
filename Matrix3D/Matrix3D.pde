
import processing.opengl.*;

void setup() {
    size(800, 800, OPENGL);
}

void draw() {
    background(0);
    int separacion=40;

    println(width);
    println(height);

    stroke(255); 
    rotateX(radians(-45));
    rotateY(radians(45));


    // plano x/y
    for(int x=0;x<=width;x+=separacion)
    { 
        line(x,0,x,height);

        //// plano x/z
        for (int z=0;z<=800;z+=separacion)
        {
            line(x,height,0,x,height,800);
        }
    }

    for(int y=0;y<=height;y+=separacion)
    {
        line(0,y,width,y);
    }

    /// plano x/z
    for (int z=0;z<=800;z+=separacion)
    {
        line(0,height,z,width,height,z);
    }



//    save("end.png");
}

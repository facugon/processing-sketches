

class TheWall {
    //
    // H A R D C O D E D - P R O P E R T I E S
    //
    PVector start ;
    PVector end ;

    PVector direction;
    
    PImage aTexture ;
    PShape box ;

    int cols = 5 ;
    int rows = 1 ;

    PVector sides ;

    TheWall(PVector dStart,PVector dEnd,PVector dSides)
    {
        start = dStart;
        end = dEnd;
        sides = dSides;

        textureMode(NORMAL);
        aTexture = loadImage("briks3.jpg");
        
        direction = PVector.sub(end, start);
        direction.normalize();
        
        print(direction);

        box = texturedBox(sides.x, sides.y, sides.z);
    }
    
    void setTexture(PImage t){
      aTexture = t;
    }

    PShape texturedBox(float xs,float ys,float zs)
    {
        noStroke();
        xs = xs / 2;
        ys = ys / 2;
        zs = zs / 2;

        box = createShape(QUADS);
        box.texture(aTexture);

        box.vertex(-1*xs , -1*ys ,  1*zs , 0 , 0);
        box.vertex( 1*xs , -1*ys ,  1*zs , 1 , 0);
        box.vertex( 1*xs ,  1*ys ,  1*zs , 1 , 1);
        box.vertex(-1*xs ,  1*ys ,  1*zs , 0 , 1);

        box.vertex( 1*xs , -1*ys , -1*zs , 0 , 0);
        box.vertex(-1*xs , -1*ys , -1*zs , 1 , 0);
        box.vertex(-1*xs ,  1*ys , -1*zs , 1 , 1);
        box.vertex( 1*xs ,  1*ys , -1*zs , 0 , 1);

        box.vertex(-1*xs ,  1*ys ,  1*zs , 0 , 0);
        box.vertex( 1*xs ,  1*ys ,  1*zs , 1 , 0);
        box.vertex( 1*xs ,  1*ys , -1*zs , 1 , 1);
        box.vertex(-1*xs ,  1*ys , -1*zs , 0 , 1);

        box.vertex(-1*xs , -1*ys , -1*zs , 0 , 0);
        box.vertex( 1*xs , -1*ys , -1*zs , 1 , 0);
        box.vertex( 1*xs , -1*ys ,  1*zs , 1 , 1);
        box.vertex(-1*xs , -1*ys ,  1*zs , 0 , 1);

        box.vertex( 1*xs , -1*ys ,  1*zs , 0 , 0);
        box.vertex( 1*xs , -1*ys , -1*zs , 1 , 0);
        box.vertex( 1*xs ,  1*ys , -1*zs , 1 , 1);
        box.vertex( 1*xs ,  1*ys ,  1*zs , 0 , 1);

        box.vertex(-1*xs , -1*ys , -1*zs , 0 , 0);
        box.vertex(-1*xs , -1*ys ,  1*zs , 1 , 0);
        box.vertex(-1*xs ,  1*ys ,  1*zs , 1 , 1);
        box.vertex(-1*xs ,  1*ys , -1*zs , 0 , 1);
        
        box.translate(0,0,sides.z/2);
        box.end(CLOSE);
        return box;
    }

    void draw()
    {
        for (int row=0 ; row<rows ; row++) {
            
            for (int col=0 ; col<cols ; col++) {

                PVector center = centerxy(row,col);

                shape(box, center.x, center.y);
            }
        }
    }

    PVector centerxy(int row, int col)
    {
        float x = start.x + direction.x * col * sides.x;
        float y = start.y + direction.y * col * sides.y;

        return new PVector(x,y);
    }
}


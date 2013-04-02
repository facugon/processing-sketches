
import processing.opengl.*;
Simon simon ;

void setup ()
{
  size(480, 800, OPENGL);

  simon = new Simon() ;
  simon.emptySequense();
  simon.nextRandomLevel();
}

void draw()
{
  background(0);

  simon.draw();

  if ( simon.isSimonTurn() )
  {
    simon.playSequense();
  }
  else if ( simon.isPlayerTurn() )
  {
    println("player turn");
    simon.checkPlayerSequense();
  }
  else {
    println("next lvl");
    //simon.nextRandomLevel();
  }
}


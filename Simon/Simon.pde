
import processing.opengl.*;
SimonGame simon ;

void setup ()
{
  size(480, 800, OPENGL);

  simon = new SimonGame() ;
  simon.nextRandomLevel();
}

void draw()
{
  background(0);

  simon.draw();
  if ( simon.isSimonTurn() )
    simon.playSequense();
  else   simon.nextRandomLevel();

}


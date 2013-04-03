
class BaneBoss
{
  PShape boss ;
  BaneBoss(int posX, int posY, int posZ)
  {
    pushMatrix();
    lights();
  
    boss = loadShape("BaneBoss.obj");  
    boss.translate(posX, posY, 0);
    boss.rotateX(radians(90));
    boss.rotateZ(radians(180));
    popMatrix();

    boss.translate(posX, posY, posZ);
  }

  void draw()
  {
    shape(boss);
  }
}


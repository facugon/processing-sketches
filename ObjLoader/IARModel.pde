import saito.objloader.*;

abstract class IARModel  {

  protected OBJModel model ;
  
  protected boolean globalsetstroke = true;
  
  IARModel()
  {
  }

  public void display3DModel(PVector position, PMatrix3D orientation)
  {
    pushMatrix();

    translate(position.x, position.y, position.z);
    applyMatrix(orientation);

    setupDisplay();
    
    model.draw();
    
    this.display3DAxis();
    
    popMatrix();
  }
  
  abstract public IARModel setupDisplay();

  public void display3DAxis()
  {
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
  }

  public void keyPressed()
  {
    if(key == '1'){ model.shapeMode(LINES); }
    else if (key == '2'){ model.shapeMode(TRIANGLES); }
    else if (key == '3'){ model.shapeMode(POINT); }
    else if (key == '4'){ model.shapeMode(QUADS); }
    else if (key == '5'){ model.shapeMode(POLYGON); }
    else if (key == '6'){
      if( globalsetstroke ) globalsetstroke=false;
      else globalsetstroke=true;
    }
  }
}


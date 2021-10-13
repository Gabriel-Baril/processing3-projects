public class ComponentRect
{
  PVector pos;
  PVector dim;
  
  color borderLeftColor;
  float borderLeftWeight;
  
  color borderTopColor;
  float borderTopWeight;
  
  color borderRightColor;
  float borderRightWeight;
  
  color borderBottomColor;
  float borderBottomWeight;
  
  color fillColor;
  
  public ComponentRect(PVector pos, PVector dim)
  {
    this.pos = pos;
    this.dim = dim;
    borderLeftColor = color(0, 0, 255, 255);
    borderTopColor = color(255, 0, 0, 255);
    borderRightColor = color(0, 255, 0, 255);
    borderBottomColor = color(255, 255, 0, 255);
    
    borderLeftWeight = 2;
    borderTopWeight = 2;
    borderRightWeight = 2;
    borderBottomWeight = 2;
    
    fillColor = color(255, 0, 255, 255);
  }

  public void render()
  {
    fill(fillColor);
    rect(pos.x, pos.y, dim.x, dim.y);
    noStroke();
    
    stroke(borderLeftColor);
    strokeWeight(borderLeftWeight);
    line(pos.x, pos.y, pos.x, pos.y + dim.y);
    
    stroke(borderTopColor);
    strokeWeight(borderTopWeight);
    line(pos.x, pos.y, pos.x + dim.x, pos.y);
    
    stroke(borderRightColor);
    strokeWeight(borderRightWeight);
    line(pos.x + dim.x, pos.y, pos.x + dim.x, pos.y + dim.y);
    
    stroke(borderBottomColor);
    strokeWeight(borderBottomWeight);
    line(pos.x, pos.y + dim.y, pos.x + dim.x, pos.y + dim.y);
    
  }
}

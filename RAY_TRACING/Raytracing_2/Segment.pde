
public PVector line_line_intersection(Segment s1,Segment s2)
{
  float x1 = s1.start.x;
  float y1 = s1.start.y;
  float x2 = s1.end.x;
  float y2 = s1.end.y;
  float x3 = s2.start.x;
  float y3 = s2.start.y;
  float x4 = s2.end.x;
  float y4 = s2.end.y;
  
  float den = (x1 - x2)*(y3 - y4) - (y1 - y2)*(x3 - x4);
  
  if(den == 0) return null;
  
  float t = ( (x1 - x3)*(y3 - y4) - (y1 - y3)*(x3 - x4) ) / den;
  float u = -( (x1 - x2)*(y1 - y3) - (y1 - y2)*(x1 - x3) ) / den;
  if(u > 0 && u < 1 && t > 0) return new PVector(x3 + u*(x4-x3),y3 + u*(y4-y3));
  return null;
}

public class Segment extends Shape
{
  PVector start;
  PVector end;
  
  public Segment(float x1,float y1,float x2,float y2)
  {
    this.start = new PVector(x1,y1);
    this.end = new PVector(x2,y2);
  }
  
  public void render(color c)
  {
    strokeWeight(1);
    stroke(c);
    line(this.start.x,this.start.y,this.end.x,this.end.y);
  }
  
  public ArrayList<PVector> collide(PVector source,PVector ray)
  {
    ArrayList<PVector> intersections = new ArrayList<PVector>();
    PVector intersection = line_line_intersection(new Segment(source.x,source.y,source.x + ray.x,source.y + ray.y),this);
    if(intersection != null) intersections.add(intersection);
    return intersections;
  }
  
  public void onMouseUserInput(float x,float y)
  {
    if(dist(x,y,this.start.x,this.start.y) < anchorThickness)
    {
      this.start.x = x;
      this.start.y = y;
      return;
    }
    
    if(dist(x,y,this.end.x,this.end.y) < anchorThickness)
    {
      this.end.x = x;
      this.end.y = y;
      return;
    }
  }
  
  public void renderBulb()
  {
    strokeWeight(10);
    stroke(255);
    point(start.x,start.y);
    point(end.x,end.y);
  }
}

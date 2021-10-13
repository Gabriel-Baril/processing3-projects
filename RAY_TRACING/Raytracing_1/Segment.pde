public class Segment
{
  PVector p1;
  PVector p2;
  
  public Segment(int x1,int y1,int x2,int y2)
  {
    this.p1 = new PVector(x1,y1);
    this.p2 = new PVector(x2,y2);
  }
  
  public void render()
  {
    stroke(0);
    line(this.p1.x,this.p1.y,this.p2.x,this.p2.y);
  }
  
  
  public double x_1(double y)
  {
    return ( (y - ls.pos.y + ((ls.pos.y - p1.y)/(ls.pos.x - p1.x))*ls.pos.x) )/((ls.pos.y - p1.y)/(ls.pos.x - p1.x));
  }
  
  public double y_1(double x)
  {
    return ((ls.pos.y - p1.y)/(ls.pos.x - p1.x))*x + (ls.pos.y - ((ls.pos.y - p1.y)/(ls.pos.x - p1.x))*ls.pos.x);
  }
  
  public double y_2(double x)
  {
    return (ls.pos.y/p2.y)*x + (ls.pos.y - (ls.pos.y/p2.y)*ls.pos.x);
  }
}

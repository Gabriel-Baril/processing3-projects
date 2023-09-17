public class Line
{
  PVector point;
  PVector direction;
  
  public PVector intersect(Line line2)
  {
    float r1 = this.direction.y / this.direction.x;
    float r2 = line2.direction.y / line2.direction.x;
    
    float x_intersect = (r1 * this.point.x - r2 * line2.point.x - this.point.y + line2.point.y) / ( r1 - r2);
    
    float b = this.point.y - r1*this.point.x;
    float y_intersect = r1*x_intersect + b;
    
    return new PVector(x_intersect, y_intersect);
  }
}

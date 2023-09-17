public class CornerData
{
  public PVector origin;
  public PVector startPoint;
  public PVector endPoint;
  public float radius;
  
  public float getAngleRadians()
  {
    PVector p1 = PVector.sub(startPoint, origin);
    PVector p2 = PVector.sub(endPoint, origin);
    
    return PVector.angleBetween(p1, p2);
  }
}

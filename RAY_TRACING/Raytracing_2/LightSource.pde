PVector getClosestIntersection(PVector relativeTo,ArrayList<PVector> intersections)
{
  float record = Float.POSITIVE_INFINITY;
  PVector closest = null;
  for(int i = 0;i < intersections.size();i++)
  {
    float dist = dist(relativeTo.x,relativeTo.y,intersections.get(i).x,intersections.get(i).y);
    if(dist < record)
    {
      record = dist;
      closest = intersections.get(i);
    }
  }
  return closest;
}


public class LightSource
{
  PVector pos;
  double d_theta_radians;

  public LightSource(float x,float y,double d_theta_radians)
  {
    this.pos = new PVector(x,y);
    this.d_theta_radians = d_theta_radians;
  }
  
  public void setPos(float x,float y)
  {
    pos.x = x;
    pos.y = y;
  }
  
  public void update()
  {
    strokeWeight(0.5);
    stroke(255,100);
    for(float i = 0;i < 2*PI;i+=this.d_theta_radians)
    {
      PVector dir = PVector.fromAngle(i);
      ArrayList<PVector> all_intersections = new ArrayList<PVector>();
      for(int j = 0;j < shapes.size();j++)
      {
        ArrayList<PVector> intersections = shapes.get(j).collide(pos,dir);
        for(int k = 0;k < intersections.size();k++)
        {
          all_intersections.add(intersections.get(k));
        }
      }
      if(all_intersections.size() == 0) line(pos.x,pos.y,pos.x + dir.x * height * 2,pos.y + dir.y * height * 2);
      else
      {
        PVector closest = getClosestIntersection(pos,all_intersections);
        line(pos.x,pos.y,closest.x,closest.y);
      }
    }
  }
  
  
  
}

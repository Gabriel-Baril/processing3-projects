static float anchorThickness = 10;

public class Polygon
{
  public ArrayList<PVector> points;
  float mass = 250;
  
  public Polygon(ArrayList<PVector> points)
  {
    this.points = points;
  }

  public void update()
  {
    for(int i = 0;i < points.size();i++)
    {
        if(mouseX > points.get(i).x - anchorThickness &&
           mouseX < points.get(i).x + anchorThickness && 
           mouseY > points.get(i).y - anchorThickness &&
           mouseY < points.get(i).y + anchorThickness)
        {
          points.get(i).x = mouseX;
          points.get(i).y = mouseY;
        }
    }
  }


  public void render(boolean render_extracted)
  {
    strokeWeight(1);
    stroke(0);
    
    for(int i = 0;i < points.size();i++)
    {
      int next = (i == points.size() - 1) ? 0 : i + 1;
      line(points.get(i).x,points.get(i).y,points.get(next).x,points.get(next).y);
    }
    
    if(render_extracted)
    {
      stroke(255,0,0);
      strokeWeight(1);
      ArrayList<PVector> p_ = extract_points(4, 4);
      for(int i = 0;i < p_.size();i++)
      {
        point(p_.get(i).x,p_.get(i).y);
      }
    }
  }
  
  public float min_x()
  {
    float min_x = points.get(0).x;
    for(int i = 1;i < points.size(); i++)
      if(points.get(i).x < min_x)
        min_x = points.get(i).x;
    return min_x;
  }
  
  
  public float max_x()
  {
    float max_x = points.get(0).x;
    for(int i = 1;i < points.size(); i++)
      if(points.get(i).x > max_x)
        max_x = points.get(i).x;
    return max_x;
  }
   
  public float min_y()
  {
    float min_y = points.get(0).y;
    for(int i = 1;i < points.size(); i++)
      if(points.get(i).y < min_y)
        min_y = points.get(i).y;
    return min_y;
  }
  
  public float max_y()
  {
    float max_y = points.get(0).y;
    for(int i = 1;i < points.size(); i++)
      if(points.get(i).y > max_y)
        max_y = points.get(i).y;
    return max_y;
  }
  
  public ArrayList<PVector> extract_points(float dx, float dy)
  {
    ArrayList<PVector> extracted_points = new ArrayList<PVector>();
    float m_x = max_x();
    float m_y = max_y();
    for(float i = min_x();i < m_x;i+=dx)
    {
      for(float j = min_y();j < m_y;j+=dy)
      {
        PVector p = new PVector(i,j);
        if(POLYPOINT_COLLIDING(p))
          extracted_points.add(p);
      }
    }
    return extracted_points;
  }
  
  public float get_moment_of_inertia(PVector anchor,float dx, float dy)
  {
    float moment = 0;
    ArrayList<PVector> materials = extract_points(dx, dy);
    
    for(int i = 0;i < materials.size();i++)
    {
      float d = dist(anchor.x,anchor.y,materials.get(i).x,materials.get(i).y);
      moment += (mass/materials.size())*d*d;
    }
    
    return moment;
  }
   
  public boolean POLYPOINT_COLLIDING(PVector point) {
    boolean collision = false;
    int next = 0;
    for(int i = 0;i < points.size();i++) {
      next = (i == points.size() - 1) ? 0 : i + 1;
      PVector vc = points.get(i);
      PVector vn = points.get(next);

      if( (vc.y > point.y) != (vn.y > point.y) && point.x < (vn.x-vc.x)*(point.y-vc.y) / (vn.y-vc.y) + vc.x)
        collision = !collision;
    }
    return collision;
  }

}

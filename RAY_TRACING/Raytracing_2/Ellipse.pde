public class Ellipse extends Shape
{
  PVector pos;
  float a_axis;
  float b_axis;
  
  public Ellipse(float x,float y,float a_axis,float b_axis)
  {
    this.pos = new PVector(x,y);
    this.a_axis = a_axis;
    this.b_axis = b_axis;
  }
  
  public void render(color c)
  {
    stroke(c);
    noFill();
    ellipse(this.pos.x,this.pos.y,a_axis*2,b_axis*2);
  }
  
  public ArrayList<PVector> collide(PVector source,PVector ray)
  {
    ArrayList<PVector> intersections = new ArrayList<PVector>();
    
    if(ray.dot(PVector.sub(pos,source)) < 0) return intersections;
    
    float a = ray.y/ray.x;
    float b = source.y - a*source.x;
    
    float a_d = b_axis*b_axis + a_axis*a_axis*a*a;
    float b_d = -2*b_axis*b_axis*pos.x + 2*a_axis*a_axis*a*b - 2*a_axis*a_axis*a*pos.y;
    float c_d = b_axis*b_axis*pos.x*pos.x + a_axis*a_axis*b*b - 2*a_axis*a_axis*b*pos.y + a_axis*a_axis*pos.y*pos.y - a_axis*a_axis*b_axis*b_axis;
    
    float delta = b_d*b_d - 4*a_d*c_d;
    
    if(delta > 0)
    {
      float x_1 = (-b_d + sqrt(delta)) / (2*a_d);
      float x_2 = (-b_d - sqrt(delta)) / (2*a_d);
      intersections.add(new PVector(x_1,a*x_1 + b));
      intersections.add(new PVector(x_2,a*x_2 + b));
    }
    
    if(delta == 0)
    {
      float x = -b_d/(2*a_d);
      intersections.add(new PVector(x,a*x + b));
    }
    return intersections;  
  }
  
  public void onMouseUserInput(float x,float y)
  {
      if(dist(x,y,this.pos.x,this.pos.y) < anchorThickness)
      {
          this.pos.x = x;
          this.pos.y = y;
      }
  }

}

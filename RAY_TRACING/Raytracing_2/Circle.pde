public class Circle extends Shape
{
  PVector pos;
  float rayon;
 
  public Circle(float x,float y,float rayon)
  {
    this.pos = new PVector(x,y);
    this.rayon = rayon;
  }
  
  public void render(color c)
  {
    stroke(c);
    noFill();
    ellipse(this.pos.x,this.pos.y,this.rayon*2,this.rayon*2);
  }
  
  public ArrayList<PVector> collide(PVector source,PVector ray)
  {
    ArrayList<PVector> intersections = new ArrayList<PVector>();
    if(ray.dot(PVector.sub(pos,source)) < 0) return intersections;
    
    float a = ray.y/ray.x;
    float b = source.y - a*source.x;
    float a_d;
    float b_d;
    float c_d;
    a_d = 1 + a*a;
    b_d = 2*(a*(b-pos.y) - pos.x);
    c_d = pos.x*pos.x + (b-pos.y)*(b-pos.y) - rayon*rayon;
    
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

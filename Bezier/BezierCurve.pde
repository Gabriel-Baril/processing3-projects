
static int offset = 15;
static float dt = 0.002;
static float curveThickness = 1;
static float deltaThickness = 1;

public class BezierCurve
{
  public ArrayList<PVector> points;
  protected ArrayList<Long> coefs;
  protected PVector pointSelected;
  protected boolean isStartEndInterpVisible;

  public BezierCurve(ArrayList<PVector> points)
  {
    this.points = points;
    isStartEndInterpVisible = true;
    calculateCoefs();
  }

  public void render()
  {
    stroke(255, 255, 255, 255);
    strokeWeight(0.5);
    for(int i = 0;i < points.size() - 1;i++)
    {
      line(points.get(i).x, points.get(i).y, points.get(i + 1).x, points.get(i + 1).y);
    }
    
    if(isStartEndInterpVisible)
    {
      strokeWeight(0.3);
      line(points.get(0).x, points.get(0).y, points.get(points.size() - 1).x, points.get(points.size() - 1).y);
    }
    
    strokeWeight(10);
    for(int i = 0;i < points.size();i++)
    {
      
      if(pointSelected == points.get(i)) stroke(128, 0, 0, 200);
      else stroke(255);
      
      point(points.get(i).x, points.get(i).y);
    }
    
    
    stroke(255, 0, 0, 60);
    
    strokeWeight(1);
    for(int i = 0;i < points.size();i++)
    {
      line(points.get(i).x, 0, points.get(i).x, height);
    }
    
    strokeWeight(curveThickness);
    for(float t = 0;t <= 1;t += dt)
    {
      float y_t = evalY(t);
      float y_t_dt = evalY(t - dt);
      float derivative_1 = ( y_t_dt - y_t)/t;
      float derivative_2 =  (evalY(t - 2*dt) - 2*y_t_dt + y_t)/(t*t);
      //if(derivative_2 >= -dt/15 && derivative_2 <= dt/15)
      //  stroke(255);
      if(derivative_2 > 0)
        stroke(255, 0, 0);
      else // if(derivative_2 < 0)
        stroke(0, 255, 255);
      
      if(derivative_1 >= -dt/derivative_1 && derivative_1 <= dt/derivative_1)
      {
        strokeWeight(curveThickness*4);
        //stroke(255, 255, 255);
        point(evalX(t), y_t);
        strokeWeight(curveThickness);
      }
      else
      {
        point(evalX(t), y_t);
      }
      
    }
    
    
  }
  
  public void update()
  {
    //println(pointSelected);
    if(mousePressed)
    {
      for(int i = 0;i < points.size();i++)
      {
        PVector back = (i != 0) ? points.get(i-1) : null;
        PVector next = (i != points.size() - 1) ? points.get(i+1) : null;
        
        if(
           points.get(i).x >= mouseX - offset && 
           points.get(i).x <= mouseX + offset &&
           points.get(i).y >= mouseY - offset && 
           points.get(i).y <= mouseY + offset)
        {
          if(back == null && mouseX < 0)           points.get(i).x = 0;
          else if(next == null && mouseX > width/2)  points.get(i).x = width/2;
          else if(back != null && mouseX < back.x) points.get(i).x = back.x;
          else if(next != null && mouseX > next.x) points.get(i).x = next.x;
          else
          {
            points.get(i).x = mouseX;
            points.get(i).y = mouseY;
          }
          pointSelected = points.get(i);
        }
      }
    }
    else
    {
      pointSelected = null;
    }
  }
  
  public void addControlPoint(PVector p)
  {
    if(points.size() != 0 && mouseX < points.get(points.size()-1).x)
    {
      p.x = points.get(points.size()-1).x;
    }
    points.add(p);
    calculateCoefs();
  }
  
  protected void calculateCoefs()
  {
    coefs = new ArrayList<Long>();
    for(int i = 0;i < points.size();i++)
    {
      coefs.add(pasc(points.size() - 1, i));
    }
  }
  
  public float evalX(float t)
  {
    float result = 0;
    for(int i = 0;i < coefs.size();i++)
    {
      result += coefs.get(i)*Math.pow(1 - t, points.size() - 1 - i)*Math.pow(t, i)*points.get(i).x;
    }
    return result;
  }
  
  public float evalY(float t)
  {
    float result = 0;
    for(int i = 0;i < coefs.size();i++)
    {
      result += coefs.get(i)*Math.pow(1 - t, points.size() - 1 - i)*Math.pow(t, i)*points.get(i).y;
    }
    return result;
  }
  
  protected void setStartEndInterp(boolean val)
  {
    isStartEndInterpVisible = val;
  }
}

public float curveThickness = 5;
public final PVector GRAVITY_CURVE = new PVector(0,0.2);


public class CurveSegment
{
  public ArrayList<PVector> data;
  color c;
  boolean applyGravity = false;
  PVector vel = new PVector();
  PVector acc = new PVector();
  
  public CurveSegment(color c)
  {
    this.c = c;
    data = new ArrayList<PVector>();
  }
  
  public void addData(PVector d)
  {
    data.add(d);
  }
  
  public void update()
  {
    if(applyGravity)
    {
      this.applyForce(GRAVITY_CURVE);
      this.vel.add(acc);
      for(int i = 0;i < data.size();i++)
      {
        this.data.get(i).add(vel);
        this.acc.mult(0);
      }
    }
  }
  
  public void applyForce(PVector force)
  {
    this.acc.add(force);
  }
  
  public void collideCurve()
  {
    PVector vec = new PVector();
    float dist;
    float overlapAmount = 0;
    for(int i = 0;i < segments.size();i++)
    {  
      if(this != segments.get(i))
      {
        for(int j = 0;j < segments.get(i).data.size();j++)
        {
          for(int k = 0;k < data.size();k++)
          {
            dist = dist(segments.get(i).data.get(j).x,segments.get(i).data.get(j).y,this.data.get(k).x,this.data.get(k).y);
            if(dist < curveThickness + curveThickness)
            {
              vec.add(PVector.sub(this.data.get(k),segments.get(i).data.get(j)));
              //line(this.pos.x,this.pos.y,segment.data.get(i).x,segment.data.get(i).y);
              overlapAmount = curveThickness + curveThickness - dist;
              //this.pos.add(PVector.sub(this.pos,segment.data.get(i)).normalize().mult(overlapAmount/2));
            }
          }
        }
        for(int j = 0;j < segments.get(i).data.size();j++)
        {
          if(segments.get(i).applyGravity)
            segments.get(i).vel.add(vec.normalize());
           segments.get(i).data.get(j).add(vec.normalize().mult(overlapAmount/2));
        }
      }
    }
  }
  
  public void render()
  {
    int counter = 0;
    //stroke(255,0,0);
    //strokeWeight(1);
    for(int i = 0;i < data.size();i+=renderPrecision)
    {
      if(i % renderPrecision == 0 && i != 0)
      {
        //stroke(255,0,0);
        //strokeWeight(1);
        //line(data.get(i - precision).x,data.get(i - precision).y,data.get(i).x,data.get(i).y);
        stroke(c);
        strokeWeight(curveThickness*2);
        point(data.get(i).x,data.get(i).y);
        counter++;
      }
    }
    //println(counter + " points rendered");
    //println((counter-1) + " lines rendered");
  }
}

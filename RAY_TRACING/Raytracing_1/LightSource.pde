public static final int thickness = 8;

public class LightSource
{
  PVector pos;
  public LightSource(int x,int y)
  {
    this.pos = new PVector(x,y);
  }
  
  public void update()
  {
    //stroke(0,0,0,100);
    PVector vect_1;
    PVector vect_2;
    for(int i = 0;i < segments.size();i++)
    {
        vect_1 = PVector.sub(segments.get(i).p1,pos).normalize().mult(width*2);
        vect_2 = PVector.sub(segments.get(i).p2,pos).normalize().mult(width*2);
        //line(pos.x,pos.y,pos.x + vect_1.x,pos.y + vect_1.y);
        //line(pos.x,pos.y,pos.x + vect_2.x,pos.y + vect_2.y);
        
        fill(0,175);
        beginShape();
          vertex(segments.get(i).p1.x,segments.get(i).p1.y);
          vertex(segments.get(i).p2.x,segments.get(i).p2.y);
          vertex(pos.x + vect_2.x,pos.y + vect_2.y);
          vertex(pos.x + vect_1.x,pos.y + vect_1.y);
        endShape(CLOSE);
    }
  }
  
  public void render()
  {
    noStroke();
    fill(200,0,0);
    ellipse(this.pos.x,this.pos.y,thickness,thickness);
  }
  
  public void ray()
  {
  
  }
  
  public void setPos(int x,int y)
  {
    this.pos.x = x;
    this.pos.y = y;
  }
}

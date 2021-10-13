public class Polygon
{
  ArrayList<PVector> vertices;
  PVector vel;
  PVector acc;
  
  public Polygon(ArrayList<PVector> vertices)
  {
    this.vertices = vertices;
    this.vel = new PVector(2,2);
    this.acc = new PVector(0,0.01);
  }
  
  public void update()
  {
    for(int i = 0;i < this.vertices.size();i++)
    {
      this.vertices.get(i).add(this.vel.add(this.acc));
      //this.acc.mult(0);
    }
  }
  
  public void render()
  {
    
    for(int i = 0;i < vertices.size();i++)
    {
      int next = i == vertices.size() - 1 ? 0 : i + 1;
      strokeWeight(4);
      point(this.vertices.get(i).x,this.vertices.get(i).y);
      strokeWeight(1.5);
      line(this.vertices.get(i).x,this.vertices.get(i).y,this.vertices.get(next).x,this.vertices.get(next).y);
    }
  }
}

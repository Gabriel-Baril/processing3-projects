public class Polygon extends Shape
{
  ArrayList<PVector> vertices;

  public Polygon(ArrayList<PVector> vertices)
  {
    this.vertices = vertices;
  }
  
  public void render(color c)
  {
    strokeWeight(1);
    stroke(c);
    int next;
    PVector current;
    for(int i = 0;i < this.vertices.size();i++)
    {
      next = (i == this.vertices.size() - 1) ? 0 : i + 1;
      current = this.vertices.get(i);
      line(current.x,current.y,this.vertices.get(next).x,this.vertices.get(next).y);
    }
  }
  
  public ArrayList<PVector> collide(PVector source,PVector ray)
  {
    ArrayList<Segment> poly_seg = this.getSegments();
    ArrayList<PVector> intersections = new ArrayList<PVector>();
    for(int k = 0;k < poly_seg.size();k++)
    {
      PVector intersection = line_line_intersection(new Segment(source.x,source.y,source.x + ray.x,source.y + ray.y),poly_seg.get(k));
      if(intersection != null) intersections.add(intersection);
    }
    return intersections;
  }
  
  public void onMouseUserInput(float x,float y)
  {
    for(int j = 0;j < this.vertices.size();j++)
    {
      if(dist(x,y,this.vertices.get(j).x,this.vertices.get(j).y) < anchorThickness)
      {
        this.vertices.get(j).x = x;
        this.vertices.get(j).y = y;
        break;
      }
    }
  }
  
  public ArrayList<Segment> getSegments()
  {
    ArrayList<Segment> output = new ArrayList<Segment>();
    int next;
    for(int i = 0;i < this.vertices.size();i++)
    {
      next = (i == this.vertices.size() - 1) ? 0 : i + 1;
      output.add(new Segment(this.vertices.get(i).x,this.vertices.get(i).y,this.vertices.get(next).x,this.vertices.get(next).y));
    }
    return output;
  }
}

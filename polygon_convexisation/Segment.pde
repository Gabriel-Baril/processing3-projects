public class Segment
{
  public PVector start;
  public PVector end;
  
  public Segment(PVector start, PVector end)
  {
    this.start = start;
    this.end = end;
  }
  
  public PVector getVector()
  {
    return new PVector(end.x - start.x,end.y - start.y);
  }
  
  public float seg_dist()
  {
    return dist(start.x, start.y, end.x, end.y);
  }
}

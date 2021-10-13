public class Segment{
  PVector start;
  PVector end;
  
  public Segment(PVector start,PVector end){
    this.start = start;
    this.end = end;
  }
  
  public void show(){
    line(start.x,start.y,end.x,end.y);
  }
  
  public float distance(){
    return dist(start.x,start.y,end.x,end.y);
  }
}
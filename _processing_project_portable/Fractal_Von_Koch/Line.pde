public class Line{
  PVector start;
  PVector end;
  float rot;

  public Line(PVector start,PVector end,float rot){
    this.start = start;
    this.end = end;
    this.rot = rot;
  }
  
  public Line(Line copy){
    this.start = copy.start.copy();
    this.end = copy.end.copy();
    this.rot = copy.rot;
  }
  
  public void show(){
    strokeWeight(2);
    line(start.x,start.y,end.x,end.y);
  }
  
  public void generate(ArrayList<Line> temp){
    float dist = dist(start.x,start.y,end.x,end.y);
    PVector s = new PVector(start.x,start.y);
    temp.add(new Line(s,rot(s,dist/3,this.rot),this.rot));
    PVector p = rot(s,dist/3,this.rot);
    temp.add(new Line(p, rot(p,dist/3,this.rot - 60),this.rot - 60));
    PVector pr = rot(p,dist/3,this.rot - 60);
    temp.add(new Line(pr,rot(pr,dist/3,this.rot + 60),this.rot + 60));
    PVector pr2 = rot(pr,dist/3,this.rot + 60); 
    temp.add(new Line(pr2,rot(pr2,dist/3,this.rot),this.rot));
  }
}

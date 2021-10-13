public class Segment{
  
  Vertex start;
  Vertex end;
  
  public Segment(Vertex start,Vertex end){
    this.start = start;
    this.end = end;
  }
  
  public void showDist(){
    textSize(7);
    String dist = new Integer((int)Math.sqrt((start.pos.x - end.pos.x)*(start.pos.x - end.pos.x) + (start.pos.y - end.pos.y)*(start.pos.y - end.pos.y))).toString();
    text(dist,(start.pos.x + end.pos.x)/2,(start.pos.y + end.pos.y)/2);
  }
  
  public void showEqu(){
    textSize(7);
    float pente = (start.pos.y - end.pos.y)/(start.pos.x - end.pos.x);
    float origin = end.pos.y - (pente * end.pos.x);
    if(-origin < 0){
      String equation = "y = " + String.format("%.2f",-pente) + " x" + " - " + (int)origin;
      text(equation,(start.pos.x + end.pos.x)/2,(start.pos.y + end.pos.y)/2 + 6);
    }else{
      String equation = "y = " + String.format("%.2f",-pente) + " x" + " + " + (int)-origin;
      text(equation,(start.pos.x + end.pos.x)/2,(start.pos.y + end.pos.y)/2 + 6);
    }
  }
  
  public void showLine(){
    strokeWeight(Constant.LINE_WEIGHT);
    line(start.pos.x,start.pos.y,end.pos.x,end.pos.y);
  }
  
  public void show(){
    showLine();
    showDist();
    showEqu();
  }
}
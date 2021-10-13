public class Line{
  PVector p1;
  PVector p2;
  
  float coef;
  float b;
  
  public Line(PVector p1,PVector p2){
    this.p1 = p1;
    this.p2 = p2;
    
    coef = (p2.y - p1.y)/(p2.x - p1.x);
    b = p1.y - coef*p1.x;
  }
  
  public void show(){
    line(p1.x,p1.y,width,coef*width + b);
  }
  
  public void showEqu(){
    println("y = " + coef + "x + " + b);
  }
}
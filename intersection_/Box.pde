public class Box{
  PVector pos;
  float w;
  float h;

  public Box(PVector pos,float w,float h){
    this.pos = pos;
    this.w = w;
    this.h = h;
  }
  
  public void show(){
    rect(pos.x,pos.y,w,h);
  }


}
public class Vertex{
  PVector pos;
  String name;
  Segment segment;
  
  public Vertex(float x,float y,String name){
    pos = new PVector(x,y);
    this.name = name;
  }
  
  public void render(){
    strokeWeight(Constant.POINT_WEIGHT);
    point(pos.x,pos.y);
    fill(0);
    textSize(10);
    text(name + "(" + (int)pos.x + "," + (int)pos.y + ")",pos.x,pos.y);
  }
  
  
  public void connectTo(Vertex v){
    segment = new Segment(this,v);
    segment.show();
  }
  
  public boolean collideWithMouse(){
    if(Math.sqrt((this.pos.x - mouseX)*(this.pos.x - mouseX) + (this.pos.y - mouseY)*(this.pos.y - mouseY)) < Constant.POINT_WEIGHT * 3){
      return true;
    }else{
      return false;
    }
  }
}
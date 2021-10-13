public class Obstacle{
  PVector pos;
  int w;
  int h;
    
    
  public Obstacle(int x,int y,int w,int h){
    pos = new PVector(x,y);
    this.w = w;
    this.h = h;
  }
  
  public boolean collide(float x,float y){
    if(x >= pos.x && x <= pos.x + w && y >= pos.y && y <= pos.y + h){
      return true;
    }
    return false;
  }
  
  public void show(){
    fill(0);
    rect(pos.x,pos.y,w,h);
  }

}

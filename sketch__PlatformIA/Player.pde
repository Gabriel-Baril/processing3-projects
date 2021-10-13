public class Player{
  PVector pos;
  PVector vel = new PVector(0,0);
  PVector acc = new PVector(0,0);
  int w;
  int h;
  float speed = 5;
  
  public Player(PVector pos,int w,int h){
    this.pos = pos;
    this.w = w;
    this.h = h;
  }
  
  public void render(color c){
    fill(c);
    rect(pos.x,pos.y,w,h);
  }
  
  public void update(){
    acc.limit(0.1);
    
    pos.add(vel);
    vel.add(acc);
  }
  
  public void collidePlatforms(){
    for(int i = 0;i < platforms.size();i++){
      
    }
  }
  
  public void applyforce(PVector force){
    acc.add(force);
  }


}
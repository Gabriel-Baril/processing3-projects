public class Platform{
  PVector pos;
  PVector vel;
  PVector acc;
  int w;
  int h;
  
  public Platform(PVector pos,int w,int h,PVector vel,PVector acc){
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
    this.w = w;
    this.h = h;
  }
  
  public void render(color c){
    fill(c);
    rect(pos.x,pos.y,w,h);
  }
  
  public void update(){
    pos.add(vel);
    vel.add(acc);
  }
  
  public void applyforce(PVector force){
    acc.add(force);
  }
}
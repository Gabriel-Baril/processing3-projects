public class Particle{
  color c;
  float w;
  float h;
  PVector pos;
  PVector vel;
  PVector acc;
  
  
  public Particle(float w,float h,float x,float y,float vx,float vy,float ax,float ay, color c){
    this.pos = new PVector(x,y);
    this.w = w;
    this.h = h;
    this.vel = new PVector(vx,vy);
    this.acc = new PVector(ax,ay);
    this.c = c;
  }
  
  public void update(){
    applyForce(new PVector(0,0.06));
    this.acc.mult(0.80);
    this.pos.add(this.vel);
    this.vel.add(this.acc);
    collide();
  }
  
  public void render(){
    fill(c);
    rect(this.pos.x,this.pos.y,this.w,this.h);
  }
  
  public void applyForce(PVector force){
    acc.add(force);
  }
  
  public void collide(){
    if(this.pos.x < 0 || this.pos.x + this.w > width){
      this.vel.x *= -1;
    }
    if(this.pos.y < 0 || this.pos.y + this.h > height){
      this.vel.y *= -1;
    }
  }
  
  public void collideEachOther(){
  
  }
}

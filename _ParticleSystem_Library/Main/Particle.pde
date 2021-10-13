public abstract class Particle{
  PVector pos;
  PVector vel;
  PVector acc;
  float angle;
  float aVel;
  float aAcc;
  int lifeSpan;
  
  
  public Particle(float x,float y,float dx,float dy,float xx,float yy,float angle,float aVel,float aAcc,int lifeSpan){
    pos = new PVector(x,y);
    vel = new PVector(dx,dy);
    acc = new PVector(xx,yy);
    this.angle = angle;
    this.aVel = aVel;
    this.aAcc = aAcc;
    this.lifeSpan = lifeSpan;
  }
  
  public void update(){
    this.angle += this.aVel;
    this.aVel += this.aAcc;
    pos.add(vel);
    vel.add(acc);
    this.lifeSpan--;
  }
  
  public void setVel(float x,float y){
    this.vel.x = x;
    this.vel.y = y;
  }
  
  public void setAcc(float x,float y){
    this.acc.x = x;
    this.acc.y = y;
  }
  public abstract void render(int r,int g,int b,int a);
}
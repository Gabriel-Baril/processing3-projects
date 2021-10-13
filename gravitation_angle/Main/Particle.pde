public class Particle{
  PVector pos;
  PVector vel = new PVector(0,0);
  PVector acc = new PVector(0,0);
  float angle;
  float aAcc = random(-0.001,0.001);
  float aVel = 0;
  float dx;
  float dy;
  float rapp;
  float angleMouse;
  float h;
  float w;
  
  public Particle(float x,float y,float h,float w){
    pos = new PVector(x,y);
    this.h = h;
    this.w = w;
  }
  
  public void update(){
    calcAngleMouse();
    PVector mouse = new PVector(mouseX,mouseY);
    this.angle += this.aVel;
    this.aVel += this.aAcc;
    pos.add(vel);
    vel.add(acc);
    mouse.sub(pos);
    mouse.setMag(0.1);
    this.acc = mouse;
    this.vel.limit(5);
    if(this.aVel >= random(0.2,0.5)){
      this.aVel -= 0.1;
    }
  }
  
  public void calcAngleMouse(){
    dx = mouseX - pos.x;
    dy = mouseY - pos.y;
    rapp = dy/dx;
    angleMouse = atan(rapp);
  }
  
  public void render(){
    pushMatrix();
    rectMode(CENTER);
    translate(this.pos.x,this.pos.y);
    rotate(this.angle);
    //rotate(this.angleMouse);
    line(0,0,0,20);
    rect(0,0,this.w,this.h);
    popMatrix();
  }
}
public class Rocket{
  PFont f = createFont("Arial",12,true);
  PVector pos;
  PVector vel = new PVector(0,-3);
  PVector acc = new PVector(0,0);
  float w;
  float h;
  float angle = 0;
  float aVel = 0;
  float aAcc = 0;
  float[] inputs = new float[2];
  float learningRate = 0.5;
  boolean guessPassed = false;
  
  public Rocket(float w,float h){
    this.w = w;
    this.h = h;
    pos = new PVector(width/2,height - this.h/2 - 10);
  }
  
  public void update(){
    calculateData();
    angle += aVel;
    aVel += aAcc;
    pos.add(vel);
    vel.add(acc);
    inputs[0] = this.pos.x;
    inputs[1] = this.pos.y;
  }
  
  public void render(boolean show){
    textFont(f,12);
    if(show){
      stroke(255,0,0,126);
      line(this.pos.x,this.pos.y,targ.pos.x,targ.pos.y);
      text(int(getDistTarg()),this.pos.x - 10,this.pos.y - 10);
    }
    pushMatrix();
    translate(this.pos.x,this.pos.y);
    rectMode(CENTER);
    fill(81);
    rotate(angle);
    rect(0,0,this.w,this.h);
    popMatrix();
  }
  
  public void applyForce(PVector force){
    acc.add(force);
  }
  
  public void goal(Target targ){
    if(dist(this.pos.x,this.pos.y,targ.pos.x,targ.pos.y) == 0){
    }
  }
  
  public void applyCollision(){
    if(this.pos.x <= 0){
      this.pos.x = this.w/2;
      stopMove();
    }
    if(this.pos.x - this.w/2 >= width){
      this.pos.x = width - this.w/2;
      stopMove();
    }
    if(this.pos.y <= 0){
      this.pos.y = this.h/2;
      stopMove();
    }
    if(this.pos.y + this.h/2 >= height){
      this.pos.y = height - this.h/2;
      stopMove();
    }
  }
  
  public void guess(){
    this.acc.y = random(-0.01,0);
    this.acc.x = random(-0.01,0.01);
    this.vel.x = random(-0.7,0.7);
    this.vel.y = random(-0.5,0);
  }
  
  public void calculateData(){
    if(!guessPassed){
      guess();
    }
    guessPassed = true;
  }
  
  public void stopMove(){
    this.acc.mult(0); 
    this.vel.mult(0);
    this.vel.y = 0.7;
    this.acc.y = 0.2;
  }
  
  public float getDistTarg(){
    return dist(this.pos.x,this.pos.y,targ.pos.x,targ.pos.y);
  }
  
  public float getDiffXTarg(){
    return (abs(this.pos.x - targ.pos.x));
  }
  
  public float getDiffYTarg(){
    return (abs(this.pos.y - targ.pos.y));
  }
  
  public void destroy(){
    if(this.pos.y == height - this.h/2){
      rockets.remove(this);
    }
  }
  
  public void bestProj(){
    for(int i = 0;i < ){
    }
  }
  
  public void nextGen(){
    if(this.pos.y == height - this.h/2){
      this.pos.x = width/2;
      this.pos.y = height - this.h/2 - 2;
      guessPassed = false;
    }
  }
}
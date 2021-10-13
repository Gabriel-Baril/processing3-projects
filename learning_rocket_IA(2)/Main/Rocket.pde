public class Rocket{
  public PVector pos;
  public PVector vel;
  public PVector acc;
  private float angle;
  private float angleVel;
  private float angleAcc;
  private float w;
  private float h;
  public boolean onGround = false;
  
  public Rocket(float x,float y,float w,float h,float dx,float dy,float xx,float yy){
    this.pos = new PVector(x,y);
    this.vel = new PVector(dx,dy);
    this.acc = new PVector(xx,yy);
    this.w = w;
    this.h = h;
  }
  
  public Rocket(float x,float y,float w,float h){
    this.acc = new PVector(random(-0.02,0.02),random(-0.02,0));
    this.vel = new PVector(random(-0.9,0.9),random(-0.8,0));
    this.pos = new PVector(x,y);
    this.w = w;
    this.h = h;
  }
  
  public void update(){
    this.pos.add(this.vel);
    this.vel.add(this.acc);
    this.angle += this.angleVel;
    this.angleVel += this.angleAcc;
  }
  
  public void render(color c){
    fill(c);
    pushMatrix();
    rect(this.pos.x,this.pos.y,this.w,this.h);
    popMatrix();
  }
  
  public void collideEdge(){
    if(this.pos.x + this.w > width){
      this.vel.x = 0;
      this.pos.x = width - this.w;
      this.acc.mult(0);
    }
    if(this.pos.x < 0){
      this.vel.x = 0;
      this.pos.x = 0;
      this.acc.mult(0);
    }
    if(this.pos.y < 0){
      this.vel.y = 0;
      this.pos.y = 0;
      this.acc.mult(0);
    }
    if(this.pos.y + this.h > height){
      this.vel.y = 0;
      this.pos.y = height - this.h;
      this.acc.mult(0);
      this.onGround = true;
    }
  }
  
  public void applyForce(PVector force){
    this.acc.add(force);
  }
  
  public float getAngle(){return this.angle;}
  public float getAngleVel(){return this.angleVel;}
  public float getAngleAcc(){return this.angleAcc;}
  public float getWidth(){return this.w;}
  public float getHeight(){return this.h;}
  public void setAngle(float angle){this.angle = angle;}
  public void setAngleVel(float angleVel){this.angleVel = angleVel;}
  public void setAngleAcc(float angleAcc){this.angleAcc = angleAcc;}
  public void setWidth(float w){this.w = w;}
  public void setHeight(float h){this.h = h;}
}
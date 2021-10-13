public class Ball{
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  int radius;
    
  Ball(){
    this.radius = 30;
    this.pos = new PVector(width/2,this.radius + 5);
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0.1);
  }
  
  public void update(){
    vel.add(acc);
    pos.add(vel);
  }
  
  public void applyForce(PVector force){
    acc.add(force);
  }
  
  public void bounce(){
    if(this.pos.x - this.radius/2 <= 0 || this.pos.x + this.radius/2 > width){
      this.vel.x = -this.vel.x;
      this.pos.x = height - this.radius/2;
    }
     if(this.pos.y - this.radius/2 <= 0 || this.pos.y + this.radius/2 > height){
      this.vel.y = -this.vel.y;
      this.pos.y = height - this.radius/2;
    }
  }
  
  public void show(){
    fill(0);
    ellipse(this.pos.x,this.pos.y,this.radius,this.radius);
  }
  
}
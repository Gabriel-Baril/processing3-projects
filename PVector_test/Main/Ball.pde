public class Ball{
  PVector pos;
  PVector vel;
  PVector acc;
  int radius;
    
  Ball(){
    this.pos = new PVector(random(10,width-10),random(10,height-10));
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0);
    this.radius = 3;
  }
  
  public void update(){
    PVector mouse = new PVector(mouseX,mouseY);
    mouse.sub(pos);
    mouse.setMag(0.1);
    acc = mouse;
    
    vel.add(acc);
    pos.add(vel);
    vel.limit(5);
  }
  
  public void bounce(){
    if(this.pos.x - this.radius/2 <= 0 || this.pos.x + this.radius > width){
      this.vel.x = -this.vel.x;
    }
     if(this.pos.y - this.radius/2 <= 0 || this.pos.y + this.radius > width){
      this.vel.y = -this.vel.y;
    }
  }
  
  public void show(){
    fill(0);
    ellipse(this.pos.x,this.pos.y,this.radius,this.radius);
  }
  
}
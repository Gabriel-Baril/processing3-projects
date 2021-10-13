public class Pendulum{
  PVector origin;
  PVector p;
  PVector p_vel;
  PVector p_acc;
  float radius;
  float angle;
  float aVel;
  float aAcc;
  float mass;
  float damping;
  
  public Pendulum(PVector origin,float angle,float radius,float damping,float mass){
    this.origin = origin;
    this.angle = angle;
    this.radius = radius;
    this.damping = damping;
    this.mass = mass;
  }
  
  public void go(){
    this.update();
    this.render();
  }
  
  public void update(){
    this.p = new PVector(radius*sin(angle),radius*cos(angle));
    
    this.aAcc = -GRAVITY * sin(this.angle);
    
    this.angle += this.aVel;
    this.aVel += this.aAcc;
    
    aVel *= this.damping;
  }
  
  public void render(){
    PVector tPos = new PVector(p.x + this.origin.x,p.y + this.origin.y);
    line(this.origin.x,this.origin.y,tPos.x,tPos.y);
    ellipse(tPos.x,tPos.y,mass,mass);
  }
  

}
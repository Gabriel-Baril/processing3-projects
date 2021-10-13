public class Dot
{
  public PVector pos;
  public PVector vel;
  public PVector acc;
  
  public Dot(float x,float y)
  {
    pos = new PVector(x,y);
    vel = new PVector();
    acc = new PVector();
  }
  
  public void update()
  {
    int x_i = int(pos.x/SCALE/2);
    int y_i = int(pos.y/SCALE/2);
    if(x_i < 0) x_i = 0;
    if(x_i >= width/SCALE) x_i = width/SCALE - 1;
    if(y_i < 0) y_i = 0;
    if(y_i >= height/SCALE) y_i = height/SCALE - 1;
    
    this.pos.add(vel);
    this.vel.add(gradient[x_i][y_i].copy().div(entitySpeedLimiter.getValue()));
    this.vel.add(this.acc);
    this.acc.mult(entityAccelerationFactorFriction.getValue());
    this.vel.mult(entitySpeedFactorFriction.getValue());
  }
  
  public void render()
  {
    stroke(255);
    strokeWeight(entityThickness.getValue());
    point(pos.x,pos.y);
  }
}

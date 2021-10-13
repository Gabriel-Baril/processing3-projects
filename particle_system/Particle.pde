public class Particle{
  PVector pos;
  PVector vel = new PVector(random(-2,2),random(0.1,0.5));
  PVector acc = new PVector(random(-0.1,0.1),random(-0.09,0.09));
  float r;
  int gradation = 255;
  color c = color(int(random(255)),int(random(255)),int(random(255)));

  public Particle(float x,float y,float r){
    pos = new PVector(x,y);
    this.r = r;
  }
  public void update(){
    this.pos.add(vel);
    this.vel.add(acc);
    this.gradation-=int(random(2,4));
  }
  
  public void render(){
    fill(0,gradation);
    stroke(0, gradation);
    ellipse(this.pos.x,this.pos.y,r*2,r*2);
  }
}
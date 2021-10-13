public class Particle {
  PVector pos;
  PVector vel = new PVector(random(-8, 8), random(-8, 8));
  PVector acc = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
  float w;
  float h;

  public Particle(float x, float y, float w, float h) {
    this.pos = new PVector(x, y);
    this.w = w;
    this.h = h;
  }

  public void update() {
    pos.add(vel);
    vel.add(acc);
  }

  public void render() {
    fill(102, 0, 0);
    rect(this.pos.x, this.pos.y, this.w, this.h);
  }

  public void applyForce(PVector force) {
    this.acc.add(force);
  }
  
}
public class Mitosis {
  PVector pos;
  PVector vel = new PVector(random(-2, 2), random(-2, 2));
  PVector acc = new PVector(0, 0);
  float radius;
  color c;

  public Mitosis(float x, float y, float radius, color c) {
    this.pos = new PVector(x, y);
    this.radius = radius;
    this.c = c;
  }

  public void update() {
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }

  public void render() {
    fill(this.c);
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
  }

  public void applyForce(PVector force) {
    this.acc.add(force);
  }

  public void collideEdges() {
    if (this.pos.x - this.radius/2 <= 0) {
      vel.x = -vel.x;
      this.pos.x = this.radius/2;
    }
    if (this.pos.x + this.radius/2 >= width) {
      vel.x = -vel.x;
      this.pos.x = width - this.radius/2;
    }
    if (this.pos.y - this.radius/2 <= 0) {
      vel.y = -vel.y;
      this.pos.y = this.radius/2;
    }
    if (this.pos.y + this.radius/2 >= height) {
      vel.y = -vel.y;
      this.pos.y = height - this.radius/2;
    }
  }

  public void delete() {
    mito.remove(this);
  }

  public void splitMit() {
    mito.add(new Mitosis(this.pos.x + this.radius/4, this.pos.y + this.radius/4, this.radius/2, this.c));
    mito.add(new Mitosis(this.pos.x -  this.radius/4, this.pos.y - this.radius/4, this.radius/2, this.c));
    this.delete();
  }
}
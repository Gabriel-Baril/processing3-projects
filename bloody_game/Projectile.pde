public class Projectile {
  PVector pos;
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  float w;
  float h;
  PVector oldMouse = new PVector(mouseX, mouseY);

  public Projectile(float x, float y, float w, float h) {
    this.pos = new PVector(x, y);
    this.w = w;
    this.h = h;
  }

  public void update() {
    this.pos.add(vel);
    this.vel.add(acc);
    this.acc.mult(0);
  }

  public void render() {
    fill(50);
    ellipse(this.pos.x, this.pos.y, this.w, this.h);
  }

  public void applyForce(PVector force) {
    this.acc.add(force);
  }

  public void defineTrajectory() {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(pos);
    mouse.setMag(3);
    acc = mouse;
    if (this.acc.x + this.acc.y > mouseX + mouseY) {
      projectiles.remove(this);
    }
  }

  public void collidePlatform() {
    for (int i = 0; i < platforms.size(); i++) {
      if (this.pos.x < platforms.get(i).getX() + platforms.get(i).getWidth() &&
        this.pos.x + this.w > platforms.get(i).getX() && 
        this.pos.y < platforms.get(i).getY() + platforms.get(i).getHeight() &&
        this.pos.y + this.h > platforms.get(i).getY()) {
        if (this.pos.x + this.w > platforms.get(i).getX() + platforms.get(i).getWidth()) {
          this.vel.x = 0;
          this.pos.x = platforms.get(i).x + platforms.get(i).w;
        } else if (this.pos.y + this.h > platforms.get(i).getY() + platforms.get(i).getHeight()) {
          this.vel.y = 0;
          this.pos.y = platforms.get(i).y + platforms.get(i).h;
        } else if (this.pos.y + this.h >= platforms.get(i).y && this.pos.x + this.w >= platforms.get(i).x && this.pos.y < platforms.get(i).y) {
          this.vel.y = 0;
          this.pos.y = platforms.get(i).y - this.h;
        } else if (this.pos.x + this.w >= platforms.get(i).x && this.pos.y + this.h > platforms.get(i).y) {
          this.vel.x = 0;
          this.pos.x = platforms.get(i).x - this.w;
        }
      }
    }
  }
}
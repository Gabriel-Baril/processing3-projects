public class Player {
  PVector pos;
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  float w;
  float h;
  boolean isShooting = false;
  boolean onGround = false;
  int test = 0;
  ParticleSystem deadAnimationPlayer;
  boolean dead = false;

  public Player(float x, float y, float w, float h) {
    this.pos = new PVector(x, y);
    this.w = w;
    this.h = h;
    deadAnimationPlayer = new ParticleSystem(this.pos.x, this.pos.y, 15);
  }

  public void update() {
    deadAnimationPlayer.pos.x = this.pos.x;
    deadAnimationPlayer.pos.y = this.pos.y;
    this.pos.add(vel);
    this.vel.add(acc);
    acc.mult(0);
    this.isShooting = false;
    if(this.dead){
      deadAnimationPlayer.update();
    }
  }

  public void render(color c) {
    fill(c);
    rect(this.pos.x, this.pos.y, this.w, this.h);
  }

  public void jump() {
    if (keyCode == 32) {
      this.vel.y = -3;
    }
  }

  public void move() {
    if (keyCode == 39 || keyCode == 68) {
      this.vel.x = 3;
    }
    if (keyCode == 37 || keyCode == 65) {
      this.vel.x = -3;
    }
  }


  public void collideWalls() {
    if (this.pos.x + this.w > width) {
      this.pos.x = width - this.w;
    }
    if (this.pos.x < 0) {
      this.pos.x = 0;
    }
    if (this.pos.y < 0) {
      this.pos.y = 0;
    }
    if (this.pos.y + this.h > height) {
      this.pos.y = height - this.h;
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
          onGround = true;
          onGround();
          this.pos.y = platforms.get(i).y - this.h;
        } else if (this.pos.x + this.w >= platforms.get(i).x && this.pos.y + this.h > platforms.get(i).y) {
          this.vel.x = 0;
          this.pos.x = platforms.get(i).x - this.w;
        }
        onGround = false;
      }
    }
  } 

  public void applyForce(PVector force) {
    this.acc.add(force);
  }

  public void shoot() {
    isShooting = true;
  }

  public void onGround() {
    if (onGround) {
    }
  }
}
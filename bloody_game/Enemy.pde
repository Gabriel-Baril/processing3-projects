public class Enemy {
  PVector pos;
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  float w;
  float h;
  ParticleSystem deadAnimation;
  boolean dead = false;
  boolean onGround = false;
  float speed = random(0.5, 2);
  float mutationRate = 0.05;

  public Enemy(float x, float y, float w, float h) {
    this.pos = new PVector(x, y);
    this.w = w;
    this.h = h;
    deadAnimation = new ParticleSystem(this.pos.x, this.pos.y, 5);
  }

  public void update() {
    deadAnimation.pos.x = this.pos.x;
    deadAnimation.pos.y = this.pos.y;
    this.pos.add(vel);
    this.vel.add(acc);
    acc.mult(0);
    if (this.dead) {
      deadAnimation.update();
    }
  }

  public void render() {
    fill(0, 124, 124);
    rect(this.pos.x, this.pos.y, this.w, this.h);
  }

  public void target(Player target) {
  }

  public void applyForce(PVector force) {
    this.acc.add(force);
  }

  public void explode() {
    for (int i = 0; i < enemies.size(); i++) {
      if (this.pos.x < mouseX &&
        this.pos.x + this.w > mouseX && 
        this.pos.y < mouseY &&
        this.pos.y + this.h > mouseY) {
        this.dead = true;
      }
    }
  }

  public void shooted() {
    for (int i = 0; i < projectiles.size(); i++) {
      if (this.pos.x < projectiles.get(i).pos.x + projectiles.get(i).w &&
        this.pos.x + this.w > projectiles.get(i).pos.x && 
        this.pos.y < projectiles.get(i).pos.y + projectiles.get(i).h &&
        this.pos.y + this.h > projectiles.get(i).pos.y) {
        projectiles.remove(i);
        this.dead = true;
      }
    }
  }

  public void collidePlatform() {
    for (int i = 0; i < platforms.size(); i++) {
      onGround = false;
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
          onGround = true;
          this.vel.y = 0;
          this.pos.y = platforms.get(i).y - this.h;
        } else if (this.pos.x + this.w >= platforms.get(i).x && this.pos.y + this.h > platforms.get(i).y) {
          this.vel.x = 0;
          this.pos.x = platforms.get(i).x - this.w;
        }
      }
      activeIA();
    }
  }

  public void collidePlayer() {
    for (int i = 0; i < enemies.size(); i++) {
      if (player.pos.x < enemies.get(i).pos.x + enemies.get(i).w &&
        player.pos.x + player.w > enemies.get(i).pos.x && 
        player.pos.y < enemies.get(i).pos.y + enemies.get(i).h &&
        player.pos.y + player.h > enemies.get(i).pos.y) {
          player.dead = true;
      }
    }
  }

  public void activeIA() {
    if (player.pos.x > this.pos.x) {
      this.pos.x += speed;
    }
    if (player.pos.x < this.pos.x) {
      this.pos.x -= speed;
    }
    if (random(1) < 0.01 && onGround) {
      this.vel.y = -3;
    }
  }

  public void particleCollidePlatform() {
    try {
      for (int i = 0; i < platforms.size(); i++) {
        for (int j = 0; j < this.deadAnimation.particles.size(); i++) {
          if (this.deadAnimation.particles.get(j).pos.x < platforms.get(i).getX() + platforms.get(i).getWidth() &&
            this.deadAnimation.particles.get(j).pos.x + this.deadAnimation.particles.get(i).w > platforms.get(i).getX() && 
            this.deadAnimation.particles.get(j).pos.y < platforms.get(i).getY() + platforms.get(i).getHeight() &&
            this.deadAnimation.particles.get(j).pos.y + this.deadAnimation.particles.get(i).h > platforms.get(i).getY()) {
            if (this.deadAnimation.particles.get(j).pos.x + this.deadAnimation.particles.get(j).w > platforms.get(i).getX() + platforms.get(i).getWidth()) {
              this.deadAnimation.particles.get(j).vel.x = 0;
              this.deadAnimation.particles.get(j).pos.x = platforms.get(i).x + platforms.get(i).w;
            } else if (this.deadAnimation.particles.get(j).pos.y + this.deadAnimation.particles.get(j).h > platforms.get(i).getY() + platforms.get(i).getHeight()) {
              this.deadAnimation.particles.get(j).vel.y = 0;
              this.deadAnimation.particles.get(j).pos.y = platforms.get(i).y + platforms.get(i).h;
            } else if (this.deadAnimation.particles.get(j).pos.y + this.deadAnimation.particles.get(j).h >= platforms.get(i).y && this.deadAnimation.particles.get(j).pos.x + this.deadAnimation.particles.get(j).w >= platforms.get(i).x && this.deadAnimation.particles.get(j).pos.y < platforms.get(i).y) {
              this.deadAnimation.particles.get(j).vel.y = 0;
              this.deadAnimation.particles.get(j).pos.y = platforms.get(i).y - this.deadAnimation.particles.get(j).h;
            } else if (this.deadAnimation.particles.get(j).pos.x + this.deadAnimation.particles.get(j).w >= platforms.get(i).x && this.deadAnimation.particles.get(j).pos.y + this.deadAnimation.particles.get(j).h > platforms.get(i).y) {
              this.deadAnimation.particles.get(j).vel.x = 0;
              this.deadAnimation.particles.get(j).pos.x = platforms.get(i).x - this.deadAnimation.particles.get(j).w;
            }
          }
        }
      }
    }
    catch(IndexOutOfBoundsException e) {
      e.printStackTrace();
    }
  }
}
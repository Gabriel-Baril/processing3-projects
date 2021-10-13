public class Player {
  public PVector pos;
  public PVector vel = new PVector(1, 0);
  public float radius;
  public color colorPlayer;
  public float speed;
  public int scoreBullet = 0;

  public Player(float x, float y, float radius, color c) {
    pos = new PVector(x, y);
    this.radius = radius;
    this.colorPlayer = c;
  }

  public void update() {
    pos.add(vel);
  }

  public void render() {
    fill(this.colorPlayer);
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
    fill(0);
    textSize(20);
    text(this.scoreBullet,this.pos.x - 10,this.pos.y + 7);
  }

  public void targetMouse() {
    PVector mouse = new PVector(mouseX/zoom, mouseY/zoom);
    speed = 1/(this.radius/100);
    if (speed < 1.3) {
      speed = 1.3;
    }else if(speed > 3.5){
      speed = 3.5;
    }
    this.vel = mouse.sub(pos);
    this.vel.normalize();
    this.vel.mult(speed);
    println(speed);
  }

  public void changeRadius() {
    this.radius += 1;
  }

  public void collideEachOther() {
    for (int i = 0; i < player.size(); i++) {
      float dx = this.pos.x - player.get(i).pos.x;
      float dy = this.pos.y - player.get(i).pos.y;
      float distance = sqrt(dx*dx + dy*dy);
      if (player.get(i) != this && distance < this.radius/2 + player.get(i).radius/2) {
        this.vel.mult(0);
      } 
    }
  }

  public void splitPlayer() {
    player.add(new Player(this.pos.x - random(-70, 70), this.pos.y - random(-70, 70), this.radius/2, this.colorPlayer));
    player.add(new Player(this.pos.x - random(-70, 70), this.pos.y - random(-70, 70), this.radius/2, this.colorPlayer));
    player.remove(this);
  }
}
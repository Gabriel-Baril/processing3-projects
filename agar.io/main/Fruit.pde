public class Fruit {
  public PVector pos;
  private float radius;
  private color fruitColor;

  public Fruit(float x, float y, float radius, color c) {
    pos = new PVector(x, y);
    this.radius = radius;
    this.fruitColor = c;
  }

  public void update() {
    this.ate();
  }

  public void render() {
    fill(this.fruitColor);
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
  }

  public void ate() {
    for (int i = 0; i < player.size(); i++) {
      float dx = this.pos.x - player.get(i).pos.x;
      float dy = this.pos.y - player.get(i).pos.y;
      float distance = sqrt(dx*dx + dy*dy);
      if (distance < this.radius/2 + player.get(i).radius/2) {
        player.get(i).scoreBullet++;
        this.destroy();
        player.get(i).changeRadius();
        this.respawn();
      }
    }
  }

  public void destroy() {
    fruits.remove(this);
  }

  public void respawn() {
    createFruit();
  }
}
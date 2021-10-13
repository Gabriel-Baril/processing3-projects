public class Platform {
  private float x;
  private float y;
  private float w;
  private float h;

  public Platform(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  public void render(color c) {
    fill(c);
    rect(this.x, this.y, this.w, this.h);
  }

  public float getX() {
    return this.x;
  }
  public float getY() {
    return this.y;
  }
  public float getWidth() {
    return this.w;
  }
  public float getHeight() {
    return this.h;
  }

  public void setX(float x) {
    this.x = x;
  }
  public void setY(float y) {
    this.y = y;
  }
  public void setWidth(float w) {
    this.w = w;
  }
  public void setHeight(float h) {
    this.x = h;
  }
}
final float RECT_WIDTH = 8;
final float RECT_HEIGHT = 15;

public abstract class ScrollBar
{
  private float value;
  private float min;
  private float max;
  private float x,y;
  private float len;
  private float incrementFactor;
  private float rectX;
  private float rectY;
  private String varName;
  
  public ScrollBar(float value,float min,float max,float x,float y,float len,float incrementFactor,String varName)
  {
    this.value = value;
    this.min = min;
    this.max = max;
    this.x = x;
    this.y = y;
    this.len = len;
    this.incrementFactor = incrementFactor;
    this.varName = varName;
  }
  
  public float getValue() { return this.value; }
  public void setValue(float value) { this.value = value; }
  public float getMin() { return this.min; }
  public void setMin(float min) { this.min = min; }
  public float getMax() { return this.max; }
  public void setMax(float max) { this.max = max; }
  public float getX() { return this.x; }
  public void setX(float x) { this.x = x; }
  public float getY() { return this.y; }
  public void setY(float y) { this.y = y; }
  public float getLen() { return this.len; }
  public void setLen(float len) { this.len = len; }
  public float getIncrementFactor() { return this.incrementFactor; }
  public void setIncrementFactor(float incrementFactor) { this.incrementFactor = incrementFactor; }
  public float getRectX() { return this.rectX; }
  public void setRectX(float rectX) { this.rectX = rectX; }
  public float getRectY() { return this.rectY; }
  public void setRectY(float rectY) { this.rectY = rectY; }
  public String getVarName() { return this.varName; }
  public void setVarName(String varName) { this.varName = varName; }
  
  
  public abstract void render();
  public abstract void update();
}

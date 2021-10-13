public abstract class ToggleButton
{
  PVector pos;
  float w;
  float h;
  boolean isOn;
  Object obj;
  
  public ToggleButton(float x, float y, float w, float h, boolean isOn, Object obj)
  {
    this.pos = new PVector(x, y);
    this.w = w;
    this.h = h;
    this.isOn = isOn;
    this.obj = obj;
  }

  public void render()
  {
    stroke(255);
    fill(255);
    rect(pos.x, pos.y, w, h);
    fill(0);
    stroke(0);
    if(isOn)
    {
      text("ON", pos.x + w/10, pos.y + 2*h/3);
    }
    else
    {
      text("OFF", pos.x + w/2, pos.y + 2*h/3);
    }
  }
  
  public void update()
  {
    if(clicked())
    {
      if(this.isOn) eventOff();
      else eventOn();
      
      this.isOn = !this.isOn;
    }
  }
  
  public abstract void eventOn();
  public abstract void eventOff();
  
  public boolean clicked()
  {
    return  
            pos.x <= mouseX && 
            pos.x + w >= mouseX &&
            pos.y <= mouseY && 
            pos.y + h >= mouseY;
  }
}

public class VScrollBar extends ScrollBar
{
  public VScrollBar(float value,float min,float max,float x,float y,float len,float incrementFactor,String varName)
  {
    super(value,min,max,x,y,len,incrementFactor,varName);
  }
  
   public void update()
  {
    if(mouseX >= getX() &&
       mouseX <= getX() + getLen() &&
       mouseY >= getY() - RECT_HEIGHT/2 &&
       mouseY <= getY() + RECT_HEIGHT/2) {
         setRectX(mouseX - RECT_WIDTH/2);
         setValue(((mouseX - getX())*(getMax()- getMin()))/( getLen() ) + getMin());
    }
  }
  
  public void render()
  {
    setRectY(getY() - RECT_HEIGHT/2);
    stroke(255);
    fill(255);
    strokeWeight(1);
    line(getX(),getY(),getX() + getLen(),getY());
    rect(getRectX(),getRectY(),RECT_WIDTH,RECT_HEIGHT);
    text(getVarName() + " : " + getValue(),getX() + getLen() + 5,getY() + 5);
  }
}

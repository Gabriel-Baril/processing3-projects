public class ButtonNumber extends Button{
  private int value;
  
  public ButtonNumber(float x,float y,float w,float h,int value){
    super(x,y,w,h);
    this.value = value;
  }
  
  public void render(color c){
    fill(c);
    rect(this.getX(),this.getY(),this.getWidth(),this.getHeight());
    fill(0);
    textFont(p,16);
    text(this.getValue(),this.getX() + this.getWidth()/2.5,this.getY() + this.getHeight()/1.5);
  }
  
  public void update(){
  }
  
  public boolean clicked(){
    if(hover() && mousePressed){
      text(this.getValue(),getResultBar().getX() + 10,getResultBar().getY() + 25);
      return true;
    }
    return false;
  }
  
  public int getValue(){return this.value;};
}
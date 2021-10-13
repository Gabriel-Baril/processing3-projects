public abstract class Bar{
  PFont p = createFont("Arial",16,true);
  private float x;
  private float y;
  private float w;
  private float h;
  
  public Bar(float x,float y,float w,float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void render(color c){
    textFont(p,16);
    fill(c);
    rect(this.getX(),this.getY(),this.getWidth(),this.getHeight());
  }
  
  public float getX(){return this.x;}
  public float getY(){return this.y;}
  public float getWidth(){return this.w;}
  public float getHeight(){return this.h;}
}
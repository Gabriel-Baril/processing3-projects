public abstract class Button{
  PFont p = createFont("Arial",16,true);
  private float x;
  private float y;
  private float w;
  private float h;
  private CalculusBar bar;
  
  public Button(float x,float y,float w,float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
    
  public abstract void render(color c);
  public abstract void update();
  public abstract boolean clicked();
  
  public boolean hover(){
    if(this.x < mouseX &&
       this.x + this.w > mouseX &&
       this.y < mouseY &&
       this.y + this.h > mouseY){
       return true;
    }
    return false;
  }
  
  public void setResultBar(CalculusBar bar){
    this.bar = bar;
  }
  
  public CalculusBar getResultBar(){
    return this.bar;
  }
  
  public float getX(){return this.x;}
  public float getY(){return this.y;}
  public float getWidth(){return this.w;}
  public float getHeight(){return this.h;}
}
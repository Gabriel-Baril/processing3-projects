public class Floor{
  private int x;
  private int y;
  private int w;
  private int h;
  
  public Floor(int x,int y,int w,int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void show(){
    fill(0);
    rect(getX(),getY(),getWidth(),getHeight());
  }
  
  public int getX(){return this.x;}
  public int getY(){return this.y;}
  public int getWidth(){return this.w;}
  public int getHeight(){return this.h;}
  
  public void setX(int x){this.x = x;}
  public void setY(int y){this.y = y;}
  public void setWidth(int w){this.w = w;}
  public void setHeight(int h){this.h = h;}
}
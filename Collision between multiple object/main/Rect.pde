public class Rect{
  private int x;
  private int y;
  private int b;
  private int h;
  private float dx;
  private float dy;
  
  Rect(int x,int y,int b,int h,float dx,float dy){
    this.x = x;
    this.y = y;
    this.b = b;
    this.h = h;
    this.dx = dx;
    this.dy = dy;
  }
  
  public int aire(){return b * h;}
  
  public int peri(){return b*2 + h*2;}
  
  public void translateX(int dx){this.x += dx;}
  public void translateY(int dy){this.y += dy;}
  public void move(int dx,int dy){this.x += dx; this.y += dy;}
  
  public int getX(){return this.x;}
  public int getY(){return this.y;}
  public int getWidth(){return this.b;}
  public int getHeight(){return this.h;}
  public float getDX(){return this.dx;}
  public float getDY(){return this.dy;}
  
  public void setX(int x){this.x = x;}
  public void setY(int y){this.y = y;}
  public void setWidth(int b){this.b = b;}
  public void setHeight(int h){this.h = h;}
  public void setDX(float dx){this.dx = dx;}
  public void setDY(float dy){this.dy = dy;}
  
  public void show(){
    fill(0);
    rect(x,y,b,h);
  }
  
  public void move(){
    this.x += dx;
    this.y += dy;
  }
  
  public void collisionBorder(){
    if(getX() <= 0 || getX() + getWidth() >= width){
      this.dx = -this.dx;
    }
    if(getY() <= 0 || getY() + getHeight() >= height){
      this.dy = -this.dy;
    }
  }
  
  public void collisionEachOther(){
    for(int i = 0;i < objects.size();i++){
      if(this.getX() < objects.get(i).getX() &&
         this.getX() + this.getWidth() > objects.get(i).getX() &&
         this.getY() < objects.get(i).getY() + objects.get(i).getHeight() &&
         this.getHeight() + this.getY() > objects.get(i).getY()){
           this.setDX(-this.getDX());
           this.setDY(-this.getDY());
           objects.get(i).setDX(-objects.get(i).getDX());
           objects.get(i).setDY(-objects.get(i).getDY());
         }
    }
  }
}
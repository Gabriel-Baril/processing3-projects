public class Entity{
  private float accelerationX = 0.05;
  private float accelerationY = 0.2;
  private int x;
  private int y;
  private int w;
  private int h;
  private float dx = 0.1;
  private float dy = 0.1;
  private boolean hasTouchVerticalWall = false;
  private boolean hasTouchHorizontalWall = false;
  
  public Entity(int x,int y,int w,int h,float dx,float dy){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.dx = dx;
    this.dy = dy;
  }
  
  public void show(){
    fill(0);
    rect(getX(),getY(),getWidth(),getHeight());
  }
  
  public void activeGravityX(){
    this.x += this.dx;
    this.dx += 0;
  }
  
  public void activeGravityY(){
    this.y += this.dy;
    this.dy += accelerationY;
  }
  
  public void collisionEachOther(){
    for(int i = 0;i < entities.size();i++){
      if(this.getX() < entities.get(i).getX() &&
         this.getX() + this.getWidth() > entities.get(i).getX() &&
         this.getY() < entities.get(i).getY() + entities.get(i).getHeight() &&
         this.getHeight() + this.getY() > entities.get(i).getY()){
           this.setDX(-this.getDX());
           this.setDY(-this.getDY());
           entities.get(i).setDX(-entities.get(i).getDX());
           entities.get(i).setDY(-entities.get(i).getDY());
         }
    }
  }
  
  
  public int getX(){return this.x;}
  public int getY(){return this.y;}
  public int getWidth(){return this.w;}
  public int getHeight(){return this.h;}
  public float getDX(){return this.dx;}
  public float getDY(){return this.dy;}
  public float getAccX(){return this.accelerationX;}
  public float getAccY(){return this.accelerationY;}
  public boolean getHasTouchVerticalWall(){return this.hasTouchVerticalWall;}
  public boolean getHasTouchHorizontalWall(){return this.hasTouchHorizontalWall;}
  
  public void setX(int x){this.x = x;}
  public void setY(int y){this.y = y;}
  public void setWidth(int w){this.w = w;}
  public void setHeight(int h){this.h = h;}
  public void setDX(float dx){this.dx = dx;}
  public void setDY(float dy){this.dy = dy;}
  public void setAccX(float accX){this.accelerationX = accX;}
  public void setAccY(float accY){this.accelerationY = accY;}
  public void setHasTouchVerticalWall(boolean htv){this.hasTouchVerticalWall = htv;}
  public void setHasTouchHorizontalWall(boolean hth){this.hasTouchHorizontalWall = hth;}
}
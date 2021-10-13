public class Food{
  private int x = 0;
  private int y = 0;
  private int fWidth = 3;
  private int fHeight = 3;
  private boolean displayed = false;
  
  public Food(int x,int y,int myWidth,int myHeight){
    this.x = x;
    this.y = y;
    this.fWidth = myWidth;
    this.fHeight = myHeight;
  }
  
  public int getX(){
    return this.x;
  }
  
  public int getY(){
    return this.y;
  }
  
  public int getWidth(){
    return this.fWidth;
  }
  
  public int getHeight(){
    return this.fHeight;
  }
  
  public void setX(int x){
    this.x = x;
  }
  
  public void setY(int y){
    this.y = y;
  }
  
  public void setWidth(int myWidth){
    this.fWidth = myWidth;
  }
  
  public void setHeight(int myHeight){
    this.fHeight = myHeight;
  }
  
  public boolean isAte(){
    for(int i = 0;i < mobs.size();i++){
      if(mobs.get(i).getX() < getX() + getWidth() &&
         mobs.get(i).getX() + mobs.get(i).getWidth() > getX() &&
         mobs.get(i).getY() < getY() + getHeight() &&
         mobs.get(i).getHeight() + mobs.get(i).getY() > getY()){
         foods.remove(this);
        return true;
      }
    }
    return false;
  }
  
  public void display(){
     fill(255,0,0);
     rect(this.x,this.y,this.fWidth,this.fHeight);
     displayed = true;
  }
  
}
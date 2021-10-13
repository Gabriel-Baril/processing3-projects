public class Mob{
  private int x = 0;
  private int y = 0;
  private int mWidth;
  private int mHeight;
  private int currentInd;
  private float maxHP = 500.0;
  private float HP = 500.0;
  private float smlDist = 0;
  private boolean reached = false;
  private int inc = 0;
  
  public Mob(int x, int y, int myWidth, int myHeight){
    this.x = x;
    this.y = y;
    this.mWidth = myWidth;
    this.mHeight = myHeight;
  }
  
  public Mob(){
    this.x = 20;
    this.y = 20;
    this.mWidth = 1;
    this.mHeight = 1;
  }
  
  public int getX(){
    return this.x;
  }
  
  public int getY(){
    return this.y;
  }
  
  public int getWidth(){
    return this.mWidth;
  }
  
  public int getHeight(){
    return this.mHeight;
  }
  
  public float getLife(){
    return this.HP;
  }
  
  public boolean getReached(){
    return this.reached;
  }
  
  public void setX(int x){
    this.x = x;
  }
  
  public void setY(int y){
    this.y = y;
  }
  
  public void setWidth(int myWidth){
    this.mWidth = myWidth;
  }
  
  public void setHeight(int myHeight){
    this.mHeight = myHeight;
  }
  
  public void isReached(){
    for(int i = 0;i < foods.size();i++){ 
      if(foods.get(i).isAte()){
        this.reached = true;
      }
    }
  }
  
  public void choice(){
    int choice = round(random(0,3));
    switch(choice){
      case 0:
        this.x+=2;
        break;
      case 1:
        this.y-=2;
        break;
      case 2:
        this.y+=2;
        break;
      case 3:
        this.x-=2;
        break;
    }
  }
  
  public void display(){
    fill(0);
    rect(getX(),getY(),getWidth(),getHeight());
  }
  
  public void showLife(){
    if(this.HP > 0){
      fill(154);
      rect(this.x - 4, this.y - 4,10,2);
      fill(255,0,0);
      rect(this.x - 4, this.y - 4,(10.0/this.maxHP)*HP,2);
    }
  }
  
  public void display(int r,int g,int b){
    fill(r,g,b);
    rect(getX(),getY(),getWidth(),getHeight());
  }
  
  public void damage(int dam){
    this.HP -= dam;
  }
  
  public void delete(){
    mobs.remove(this);
  }
  
   public void track(){
     if(foods.size() > 0){
       for(int i = 1;i < foods.size();i++){
           float dist = sqrt(pow(foods.get(i).getX() - mobs.get(i).getX(), 2) + pow(foods.get(i).getY() - mobs.get(i).getY(), 2));
           if(i == 1){
             smlDist = dist;
           }else if(dist < smlDist && i != 1){
             smlDist = dist;
             currentInd = i;
           }
         }
       
       if(this.x < foods.get(currentInd).getX()){
          this.x++;
       }
       if(this.y < foods.get(currentInd).getY()){
         this.y++;
       }
       if(this.x > foods.get(currentInd).getX()){
         this.x--;
       }
       if(this.y > foods.get(currentInd).getY()){
         this.y--;
       }
     }
  }
}

 
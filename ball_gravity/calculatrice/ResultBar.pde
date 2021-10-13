public class ResultBar{
  private float x;
  private float y;
  private float w;
  private float h;
  private float spaceNumber;
  
  public ResultBar(float x,float y,float w,float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void update(){
  
  }
  
  public void render(color c){
    fill(c);
    rect(this.x,this.y,this.w,this.h);
  }
  
  public void renderContent(){
  
  }
  
  public void clearContent(){
  
  }
  
  public void space(){
    
  }
  
  public float getX(){return this.x;}
  public float getY(){return this.y;}
  public float getWidth(){return this.w;}
  public float getHeight(){return this.h;}
  public float getSpaceNumber(){return this.spaceNumber;}
}
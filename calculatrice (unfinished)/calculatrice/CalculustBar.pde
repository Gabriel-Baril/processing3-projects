public class CalculusBar extends Bar{
  private float spaceNumber = 10;
  
  public CalculusBar(float x,float y,float w,float h){
    super(x,y,w,h);
  }
  
  public void renderContent(){
    for(int i = 0;i < tab.size();i++){
      text(tab.get(i).toString(),(this.getX() + 10) + spaceNumber*i,this.getY() + 22);
    }
  }
  
  public void clearContent(){
  
  }
  
  public float getSpaceNumber(){return this.spaceNumber;}
  public void setSpaceNumber(float sn){this.spaceNumber = sn;}
}
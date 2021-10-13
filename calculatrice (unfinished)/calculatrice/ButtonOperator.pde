public class ButtonOperator extends Button{
  private String ope;
  
  public ButtonOperator(float x,float y,float w,float h,String ope){
    super(x,y,w,h);
    this.ope = ope;
  }
  
  public void render(color c){
    fill(c);
    rect(this.getX(),this.getY(),this.getWidth(),getHeight());
    fill(0);
    textFont(p,16);
    text(this.getOperator(),this.getX() + this.getWidth()/2.3,this.getY() + this.getHeight()/1.5);
  }
  
  public void update(){
    
  }
  
  public void determineResult(){
    switch(getOperator()){
      case "o":
        exit();
        break;
      case "-":
        break;
      case "+":
        break;
      case "*":
        break;
      case "/":
        break;
      case "(":
        break;
      case ")":
        break;
      case ".":
        break;
      case "=":
        algo.mainAlgorithm();
        tab.clear();
        break;
    }
  }
  
  public boolean clicked(){
    if(hover()){
      tab.add(this.getOperator());
      return true;
    }
    return false;
  }
  
  public String getOperator(){return ope;}
}
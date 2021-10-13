public class Button{
  PVector pos;
  int w;
  int h;
  String text;
  
  public Button(PVector pos,int w,int h,String text){
    this.pos = pos;
    this.w = w;
    this.h = h;
    this.text = text;
  }
  
  public void render(){
    fill(0);
    rect(pos.x,pos.y,w,h);
    fill(255);
    text(text,pos.x + w/2 - text.length()/2 * 7,pos.y+8 + h/2 - 5);
  }
  
  public boolean update(){
    if(mouseCollide()){
      action();
      return true;
    }
    return false;
  }
  
  public void action(){} // We have to define the function when we create an instance with an anonymous class
  
  public boolean mouseCollide(){
    if(mouseX >= pos.x &&
       mouseX <= pos.x + w &&
       mouseY >= pos.y &&
       mouseY <= pos.y + h){
        return true;
    }
    return false;
  }
}

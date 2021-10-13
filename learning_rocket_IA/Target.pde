public class Target{
  PVector pos;
  float r;
  
  public Target(float r){
    this.r = r;
    this.pos = new PVector(width/2,r + 5);
  }
  
  public void update(){
  
  }
  
  public void render(){
    fill(0);
    ellipse(this.pos.x,this.pos.y,this.r*2,this.r*2);
  }
}
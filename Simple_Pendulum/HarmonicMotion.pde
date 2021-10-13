public class HarmonicMotion{
  PVector origin;
  PVector p;
  float amplitude;
  float period;
  float radius;

  public HarmonicMotion(PVector origin,float radius,float amplitude,float period){
    this.origin = origin;
    this.radius = radius;
    this.amplitude = amplitude;
    this.period = period;
    this.p = new PVector(origin.x,origin.y);
  }
  
  public void go(){
    this.update();
    this.render();
  }
  
  public void update(){
    p.x = this.amplitude * cos((frameCount/period)*TWO_PI);
  }
  
  
  public void render(){
    line(this.origin.x,this.origin.y,this.p.x + origin.x,this.p.y);
    ellipse(this.p.x + origin.x,this.p.y,radius,radius);
    ellipse(this.origin.x,this.origin.y,radius/3,radius/3);
  }
  
  public void setAnchor(PVector anchor){
    this.origin = anchor;
  }

}
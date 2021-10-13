public class Corpse{
  final float G = 6.67 * pow(10, -11);
  PVector pos;
  PVector vel = new PVector(0,0);
  PVector acc = new PVector(0,0);
  float mass;
  float radius;
  Corpse parent;
  color c = color(255,255,255,255);
  
  public Corpse(float x,float y,float radius,float mass,Corpse parent){
    pos = new PVector(x,y);
    this.mass = mass;
    this.radius = radius;
    this.parent = parent;
  }
  
  public void update(){
    if(this.parent != null){
      float dist = dist(this.pos.x,this.pos.y,this.parent.pos.x,this.parent.pos.y);
      float dx = dist(this.pos.x,this.pos.y,this.parent.pos.x,this.pos.y);
      float dy = dist(this.parent.pos.x,this.pos.y,this.parent.pos.x,this.parent.pos.y); 
      vel = new PVector(dx/dist,dy/dist);
    }else{
      vel = new PVector(0,0);
    }
    vel.add(acc);
    pos.add(vel);
    
  }
  
  public float calculateTheta(){
    float dx = dist(this.pos.x,this.pos.y,this.parent.pos.x,this.pos.y);
    float dy = dist(this.parent.pos.x,this.pos.y,this.parent.pos.x,this.parent.pos.y);
    return degrees(atan(dy/dx));
  }
  
  public void applyForce(PVector force){
    acc.add(force);
  }
  
  public void render(){
    fill(this.c);
    ellipse(pos.x,pos.y,this.radius*2,this.radius*2);
  }
  
  public void addColor(int r,int g,int b, int a){
    this.c = color(r,g,b,a);
  }
  
  public float getAttraction(){
    float dist = dist(this.pos.x,this.pos.y,this.parent.pos.x,this.parent.pos.y);
    return this.G * ((this.mass * parent.mass)/pow(dist, 2));
  }
  
  public float getMass(){return this.mass;}
  public void setMass(float mass){this.mass = mass;}
}
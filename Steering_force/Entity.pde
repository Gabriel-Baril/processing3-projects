int radius = 20;

public class Entity {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  public Entity(){
    this.pos = new PVector(random(0,width),random(0,height));
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0);
    this.mass = 5;
  }
  
  public Entity(PVector pos){
    this.pos = pos;
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0);
  }
  
  public void edge(){
    if(this.pos.x < 0) this.vel.x *= -1;
    if(this.pos.x > width) this.vel.x *= -1;
    if(this.pos.y < 0) this.vel.y *= -1;
    if(this.pos.y > height) this.vel.y *= -1;
  }
  
  public void update(ArrayList<PVector> targets){
    //for(int i = 0;i < targets.size();i++){
    //  float d = sqrt((targets.get(i).x - this.pos.x)*(targets.get(i).x - this.pos.x) + (targets.get(i).y - this.pos.y)*(targets.get(i).y - this.pos.y));
    //  this.vel.add(PVector.sub(targets.get(i),this.pos).normalize().mult(0.5/d));
    //}
    for(Entity entity : entities){
      if(entity != this){
        float d = sqrt((entity.pos.x - this.pos.x)*(entity.pos.x - this.pos.x) + (entity.pos.y - this.pos.y)*(entity.pos.y - this.pos.y));
        this.vel.add(PVector.sub(entity.pos,this.pos).normalize().mult((0.05*this.mass*entity.mass)/(d*d)));
        if(d < radius)
          this.vel.mult(-1);
      }
    }
    
    this.vel.limit(1.5);
    this.pos.add(vel);
    this.vel.add(acc);
    this.vel.mult(0.995);
    this.edge();
  }
  
  public void render(){
    strokeWeight(radius);
    stroke(255);
    point(this.pos.x,this.pos.y);
  }

}

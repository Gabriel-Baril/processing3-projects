public class Obstacle {
  PVector position;
  int radiusRepulsion;
  
  public Obstacle(PVector position,int radiusRepulsion){
    this.position = position;
    this.radiusRepulsion = radiusRepulsion;
  }

  public void render(){
    stroke(255,0,0);
    noFill();
    ellipse(this.position.x,this.position.y,this.radiusRepulsion*2,this.radiusRepulsion*2);
  }

  public void update(ArrayList<Boid> boids){
    for(int i = 0;i < boids.size();i++){
      Boid current = boids.get(i);
      if(dist(current.position.x,current.position.y,this.position.x,this.position.y) < this.radiusRepulsion)
        current.acceleration.add(PVector.sub(current.position,this.position).limit(2.5));
    }
  }
}

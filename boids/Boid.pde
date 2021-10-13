public class Boid {
    PVector position;
    PVector velocity;
    PVector acceleration;
    int detectionRadius;
    float speed;
    
    public Boid(){
      this.position = new PVector(floor(random(0,width)),floor(random(0,height)));
      this.detectionRadius = 40;
      this.velocity = PVector.random2D();
      this.acceleration = new PVector(0,0);
      this.speed = random(2,5);
      //this.speed = 4;
    }
    
    public Boid(float x,float y){
      this.position = new PVector(x,y);
      this.detectionRadius = 40;
      this.velocity = PVector.random2D();
      this.acceleration = new PVector(0,0);
      this.speed = random(2,5);
      //this.speed = 4;
    }

    public void edges(){
      if(this.position.x < 0) this.position.x = width - 2;
      if(this.position.x > width) this.position.x = 2;
      if(this.position.y < 0) this.position.y = height - 2;
      if(this.position.y > height) this.position.y = 2;
    }

    public void flock(ArrayList<Boid> boids){
      int b_size = boids.size();
      if(b_size > 0){
        PVector separate = new PVector(0,0);
        PVector cohesion = new PVector(0,0);
        PVector alignment = new PVector(0,0);
        for(int i = 0;i < b_size;i++){
          Boid current = boids.get(i);
          float d = dist(this.position.x,this.position.y,current.position.x,current.position.y);
          if(d != 0) separate.add(PVector.sub(this.position,current.position).setMag(2 / d));
          cohesion.add(current.position);
          alignment.add(current.velocity);
        }
        this.acceleration.add(separate.div(b_size).setMag(1.55));
        this.acceleration.add(alignment.div(b_size).sub(this.velocity));
        this.acceleration.add(cohesion.div(b_size).sub(this.position).limit(1.5));
      }
    }

    public void render(){
      float angle = atan(this.velocity.y/this.velocity.x);
      float[] col = hslToRgb(2/(this.velocity.x*this.velocity.x+this.velocity.y*this.velocity.y),1,0.5); 
      if(this.velocity.x < 0) angle -= PI;
      
      //fill(255);
      //ellipse(this.position.x,this.position.y,10,10);
      
      noStroke();
      pushMatrix();
        fill(col[0],col[1],col[2]);
        translate(this.position.x,this.position.y);
        rotate(angle);
        beginShape();
          vertex(-3,-2);
          vertex(5,0);
          vertex(-3,2);
        endShape();
      popMatrix();
    }

    public void update(){
      ArrayList<Boid> filtered = new ArrayList<Boid>();
      for(int i = 0;i < boids.size();i++){
        if(boids.get(i) != this && dist(this.position.x, this.position.y, boids.get(i).position.x, boids.get(i).position.y) < this.detectionRadius)
          filtered.add(boids.get(i));
      }
      this.edges();
      this.position.add(this.velocity);
      this.velocity.add(this.acceleration);
      this.acceleration.mult(0);
      this.flock(filtered);
      this.velocity.setMag(this.speed);
      //this.velocity.mult(0.99);
    }
    
  }

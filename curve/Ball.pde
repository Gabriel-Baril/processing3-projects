public final PVector GRAVITY = new PVector(0,0.2);
public final float reboundFactor = 1.5;
public final float frictionFactor = 0.80;


public class Ball
{
  PVector pos;
  PVector vel;
  PVector acc;
  color col;
  
  float radius;
  float mass;
  
  public Ball(float x,float y,float radius)
  {
    this.pos = new PVector(x,y);
    this.vel = new PVector();
    this.acc = new PVector();
    this.radius = radius;
    this.mass = this.radius  ;
    col = color(random(128,255),random(128,255),random(128,255));
  }
  
  public void update()
  {
    this.applyForce(GRAVITY);
    this.pos.add(vel);
    this.vel.add(acc);
    this.vel.limit(8);
    this.acc.mult(0);
  }
  
  public void render()
  {
    //stroke(255,255,0);
    //strokeWeight(1);
    //line(this.pos.x,this.pos.y,this.pos.x + this.vel.copy().normalize().mult(this.radius).x,this.pos.y + this.vel.copy().normalize().mult(this.radius).y);
    strokeWeight(1.5);
    stroke(col);
    noFill();
    if(this == current) fill(126,126,126);
    ellipse(this.pos.x,this.pos.y,this.radius*2,this.radius*2);
  }
  
  public void collideCurve(CurveSegment segment)
  {
    stroke(0,255,100);
    strokeWeight(1);
    PVector vec = new PVector();
    float dist;
    float overlapAmount;
    for(int i = 0;i < segment.data.size();i+=updatePrecision)
    {
      if(i % updatePrecision == 0 && i != 0)
      {
        dist = dist(segment.data.get(i).x,segment.data.get(i).y,pos.x,pos.y);
        if(dist < this.radius + curveThickness)
        {
          vec.add(PVector.sub(pos,segment.data.get(i)).normalize().div( this.mass/this.vel.mag() ));
          line(this.pos.x,this.pos.y,segment.data.get(i).x,segment.data.get(i).y);
          overlapAmount = this.radius + curveThickness - dist;
          this.pos.add(PVector.sub(this.pos,segment.data.get(i)).normalize().mult(overlapAmount/2));
        }
      }
    }
    PVector temp = vec.mult(reboundFactor);
    this.vel.add(temp);
    //if(temp.x != 0 || temp.y != 0) this.vel.mult(frictionFactor);
  }
  
  public void collideBall()
  {
    float dist;
    float overlapAmount;
    PVector this_to_target_vec_normalized;
    PVector target_to_this_vec_normalized;
    for(int i = 0;i < balls.size();i++)
    {
      if(balls.get(i) != this)
      {
        dist = dist(balls.get(i).pos.x,balls.get(i).pos.y,this.pos.x,this.pos.y);
        if(dist < (balls.get(i).radius + this.radius) )
        {
          stroke(255,0,0);
          strokeWeight(1);
          line(this.pos.x,this.pos.y,balls.get(i).pos.x,balls.get(i).pos.y);
          overlapAmount = this.radius + balls.get(i).radius - dist;
          this_to_target_vec_normalized = PVector.sub(this.pos,balls.get(i).pos).normalize();
          target_to_this_vec_normalized = PVector.sub(balls.get(i).pos,this.pos).normalize();
          this.pos.add(this_to_target_vec_normalized.mult(overlapAmount/2));
          balls.get(i).pos.add(target_to_this_vec_normalized.mult(overlapAmount/2));
          
          // ELASTIC
          
          //float mult_1 = ( (2*balls.get(i).mass)/(this.mass + balls.get(i).mass) ) * ( ( PVector.dot( PVector.sub(this.vel,balls.get(i).vel),PVector.sub(this.pos,balls.get(i).pos) ) ) / PVector.sub(this.pos,balls.get(i).pos).magSq() );
          //float mult_2 = ( (2*this.mass)/(this.mass + balls.get(i).mass) ) * ( ( PVector.dot( PVector.sub(balls.get(i).vel,this.vel),PVector.sub(balls.get(i).pos,this.pos) ) ) / PVector.sub(balls.get(i).pos,this.pos).magSq() );
          //PVector this_vec_prime = PVector.sub(this.vel, PVector.sub(this.pos,balls.get(i).pos).mult(mult_1));
          //PVector target_vec_prime = PVector.sub(balls.get(i).vel,PVector.sub(balls.get(i).pos,this.pos).mult(mult_2));
          //this.vel = this_vec_prime;
          //balls.get(i).vel = target_vec_prime;
          
          // PERFECT ELASTIC COLLISION
          
          //PVector this_vec = this.vel.copy().mult((this.mass - balls.get(i).mass)/(this.mass + balls.get(i).mass));
          //PVector target_vec = this.vel.copy().mult((2*this.mass)/(this.mass + balls.get(i).mass));
          //PVector this_vec_2 = balls.get(i).vel.copy().mult((this.mass - balls.get(i).mass)/(this.mass + balls.get(i).mass));
          //PVector target_vec_2 = balls.get(i).vel.copy().mult((2*balls.get(i).mass)/(this.mass + balls.get(i).mass));
          //balls.get(i).vel = PVector.sub(target_vec,this_vec_2);
          //this.vel = PVector.add(this_vec,target_vec_2);
          
          // BY ME
          
          //this.vel.add( this_to_target_vec_normalized );
          //balls.get(i).vel.add( target_to_this_vec_normalized );
          
          // BY ME (ENERGY LOST)
          
          float this_mag = this.vel.mag();
          float target_mag = balls.get(i).vel.mag();
          
          this.vel.add( this_to_target_vec_normalized.mult( (balls.get(i).mass) / (this.mass + balls.get(i).mass)) );
          balls.get(i).vel.add( target_to_this_vec_normalized.mult( (this.mass) / (this.mass + balls.get(i).mass)) );
          
          this.vel.limit(6);
          balls.get(i).vel.limit(6);
        }
      }
    }
  }
  
  public boolean outOfBound()
  {
    if(this.pos.x < -radius)              return true;
    if(this.pos.x > width + this.radius)  return true;
    if(this.pos.y < -radius)              return true;
    if(this.pos.y > height + this.radius) return true;
    return false;
  
  }
  
  public void applyForce(PVector force)
  {
    this.acc.add(force);
  }
}

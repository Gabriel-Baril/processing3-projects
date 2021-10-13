public class CircleParticle extends Particle{
  float radius;
  
  public CircleParticle(float radius,float x,float y,float dx,float dy,float xx,float yy,float angle,float aVel,float aAcc,int lifeSpam){
    super(x,y,dx,dy,xx,yy,angle,aVel,aAcc,lifeSpam);
    this.radius = radius;
  }
  
  public void render(int r,int g,int b,int a){
    pushMatrix();
    translate(super.pos.x,super.pos.y);
    fill(r,g,b,super.lifeSpan);
    rotate(angle);
    ellipse(super.pos.x,super.pos.y,this.radius*2,this.radius*2);
    popMatrix();
  }
}
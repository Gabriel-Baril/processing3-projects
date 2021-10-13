public class SquareParticle extends Particle{
  float w;
  float h;
  int lifeSpan;
  
  public SquareParticle(float w,float h,float x,float y,float dx,float dy,float xx,float yy,float angle,float aVel,float aAcc,int lifeSpan){
    super(x,y,dx,dy,xx,yy,angle,aVel,aAcc,lifeSpan);
    this.w = w;
    this.h = h;
  }
  
  public void render(int r,int g,int b,int a){
    pushMatrix();
    rectMode(CENTER);
    translate(super.pos.x,super.pos.y);
    fill(r,g,b,super.lifeSpan);
    stroke(r,g,b,super.lifeSpan);
    rotate(angle);
    rect(0,0,this.w,this.h);
    popMatrix();
  }
}
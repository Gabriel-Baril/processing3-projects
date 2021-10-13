public abstract class ParticleSystem{
  PVector pos;
  ArrayList<Particle> particles = new ArrayList<Particle>();
  Particle p;
  int maxParticle;
  float w,h,x,y,dx_1,dy_1,dx_2,dy_2,xx_1,xx_2,yy_1,yy_2,angle,aVel,aAcc;
  int spawnFrequency,r,g,b,a,lifeSpan;
  
  public ParticleSystem(float x,float y,int maxParticle,int spawnFrequency,float w,float h,float dx_1,float dx_2,float dy_1,float dy_2,float xx_1,float xx_2,float yy_1,float yy_2,float angle,float aVel,float aAcc,int r,int g,int b,int a,int lifeSpan){
    pos = new PVector(x,y);
    this.x = x;
    this.y = y;
    this.maxParticle = maxParticle;
    this.spawnFrequency = spawnFrequency;
    this.w = w;
    this.h = h;
    this.dx_1 = dx_1;
    this.dy_1 = dy_1;
    this.xx_1 = xx_1;
    this.yy_1 = yy_1;
    this.dx_2 = dx_2;
    this.dy_2 = dy_2;
    this.xx_2 = xx_2;
    this.yy_2 = yy_2;
    this.angle = angle;
    this.aVel = aVel;
    this.aAcc = aAcc;
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
    this.lifeSpan = lifeSpan;
  }
  
  public void update(){
    for(int i = 0;i < this.spawnFrequency;i++){
      particles.add(new SquareParticle(this.w,this.h,this.x,this.y,random(this.dx_1,this.dx_2),random(this.dy_1,this.dy_2),random(this.xx_1,this.xx_2),random(this.yy_1,this.yy_2),this.angle,this.aVel,this.aAcc,this.lifeSpan));
    }
    for(int i = 0;i < this.particles.size();i++){
       particles.get(i).update();
       if(this.particles.size() > maxParticle){
         particles.remove(0);
       }
    }
  }
  
  public void render(){
    for(int i = 0;i < this.particles.size();i++){
       particles.get(i).render(this.r,this.g,this.b,this.lifeSpan);
    }
  }
}
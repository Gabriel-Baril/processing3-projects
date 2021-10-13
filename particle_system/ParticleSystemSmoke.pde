public class ParticleSystemSmoke{
  private int maxParticle;
  private ArrayList<Particle> particles = new ArrayList<Particle>();
  float x;
  float y;
  float r;
  int spawnFrequency;
  
  public ParticleSystemSmoke(float x,float y,float r,int spawnFrequency,int maxParticle){
    this.x = x;
    this.y = y;
    this.r = r;
    this.spawnFrequency = spawnFrequency;
    this.maxParticle = maxParticle;
    
  }
  
  
  public void update(){
    for(int i = 0;i < spawnFrequency;i++){
      this.particles.add(new Particle(x,y,r));
    }
    for(int i = 0;i < this.particles.size();i++){
      this.particles.get(i).update();
      if(this.particles.size() > getMaxParticle()){
        this.particles.remove(0);
      }
    }
  }
  
  public void render(){
    for(int i = 0;i < this.particles.size();i++){
      this.particles.get(i).render();
    }
  }
  
  public int getMaxParticle(){return this.maxParticle;}
  
}
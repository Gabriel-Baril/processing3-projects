public class ParticleSystem {
  PVector pos;
  float nbParticle;
  ArrayList<Particle> particles = new ArrayList<Particle>();
  int time = 0;
  boolean stop = false;

  public ParticleSystem(float x, float y, float nbParticle) {
    this.pos = new PVector(x, y);
    this.nbParticle = nbParticle;
  }

  public void update() {
    if (!stop) {
      for (int i = 0; i < nbParticle; i++) {
        particles.add(new Particle(this.pos.x, this.pos.y, random(1, 4), random(1, 4)));
        particles.add(new Particle(this.pos.x, this.pos.y, random(1, 4), random(1, 4)));
      }
    }
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).update();
      particles.get(i).render();
      particles.get(i).applyForce(GRAVITYPARTICLES);
    }
    for (int i = 0; i < particles.size(); i++) {
      if (particles.get(i).pos.x + particles.get(i).w > width || particles.get(i).pos.x + particles.get(i).w < 0 || particles.get(i).pos.y + particles.get(i).h > height) {
        particles.remove(i);
      }
    }
    //println(particles.size());
    time++;
    if (time > 10) {
      stop = true;
    }
  }
}
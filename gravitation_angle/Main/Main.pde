ArrayList<Particle> particles = new ArrayList<Particle>();

void setup(){
  size(700,700);
  for(int i = 0; i < 100;i++){
    particles.add(new Particle(random(width),random(height),10,10));
  }
}

void draw(){
  background(81);
  for(int i = 0;i < particles.size();i++){
    particles.get(i).render();
    particles.get(i).update();
    println(particles.get(i).aVel);
  }
}
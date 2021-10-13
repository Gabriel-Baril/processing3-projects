ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(800, 800);
}


void keyPressed(){
  if(keyCode == 32){
    particles.clear();
  }
}

void draw() {
  background(255);
  for (int i = 0; i  < 10; i++) {
    particles.add(new Particle(random(5, 10), random(5, 10), width/2, height/2, random(-5, 5), random(-5, 5), random(-0.5, 0.5), random(-0.5, 0.5), color(random(0, 255), random(0, 255), random(0, 255))));
  }
  fill(0);
  text("" + particles.size(), 0, 10);
  text("" + frameRate, 0, 20);
  for (int i = 0; i < particles.size(); i++) {
    particles.get(i).update();
    particles.get(i).render();
  }
}

ArrayList<Planet> planets = new ArrayList<Planet>();

void setup(){
size(1920,900);
  for(int i = 0;i < 50;i++){
    planets.add(new Planet(new PVector(random(0,width),random(0,height)),new PVector(0,0),random(5,10)));
  }
}

void mousePressed(){
  planets.add(new Planet(new PVector(mouseX,mouseY),new PVector(0,0),100));
}


void draw(){
  background(0);
  text(frameRate,0,10);
  for(int i = 0;i < planets.size();i++){
    planets.get(i).update();
  }
}

public ArrayList<Rocket> rockets = new ArrayList<Rocket>();
public color colorRocket = color(81, 81, 81);
public final PVector GRAVITY = new PVector(0, 0.0005);
//public final PVector WIND = new PVector(0.01, 0);
public int rocketWidth = 10;
public int rocketHeight = 20;

public void generateGen(int nb) {
  for (int i = 0; i < nb; i++) {
    rockets.add(new Rocket(width/2, height - rocketHeight, rocketWidth, rocketHeight));
  }
}

void setup() {
  size(600, 600);
}

void draw() {
  background(126, 126, 126);
  if(rockets.size() == 0){
    generateGen(20);
  }
  for (int i = 0; i < rockets.size(); i++) {
    rockets.get(i).update();
    rockets.get(i).render(colorRocket);
    rockets.get(i).collideEdge();
    rockets.get(i).applyForce(GRAVITY);
    if(rockets.get(i).onGround){
      rockets.remove(i);
    }
  }
}
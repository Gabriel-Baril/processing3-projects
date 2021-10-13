Rocket rock; 
Target targ;
ArrayList<Rocket> rockets = new ArrayList<Rocket>();
final PVector GRAVITY = new PVector(0,0.0001);

void setup(){
  size(800,800);
  targ = new Target(15);
}


void draw(){
  background(154);
  targ.update();
  targ.render();
  for(int i = 0;i < rockets.size();i++){
    rockets.get(i).applyForce(GRAVITY);
    rockets.get(i).update();
    rockets.get(i).render(true);
    rockets.get(i).applyCollision();
    rockets.get(i).goal(targ);
    //rockets.get(i).nextGen();
    rockets.get(i).destroy();
  }
  if(rockets.size() == 0){
    for(int i = 0;i < 10;i++){
      rockets.add(new Rocket(10,20));
    }
  }
}
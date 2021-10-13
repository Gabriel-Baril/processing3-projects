ArrayList<Ball> balls = new ArrayList<Ball>();

void setup(){
  size(500,500);
  for(int i = 0;i < 1;i++){
    balls.add(new Ball());
  }
}

void draw(){
  background(154);
  PVector fric = new PVector(0,0);
  PVector grav = new PVector(0,0.01);
  for(int i = 0;i < balls.size();i++){
    balls.get(i).applyForce(fric);
    balls.get(i).applyForce(grav);
    balls.get(i).show();
    balls.get(i).update();
    balls.get(i).bounce();
  }
}
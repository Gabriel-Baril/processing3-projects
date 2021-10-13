ArrayList<Ball> balls = new ArrayList<Ball>();

void setup(){
  size(500,500);
  for(int i = 0;i < 100;i++){
    balls.add(new Ball());
  }
}

void draw(){
  background(154);
  for(int i = 0;i < balls.size();i++){
    balls.get(i).show();
    balls.get(i).update();
    balls.get(i).bounce();
  }
}
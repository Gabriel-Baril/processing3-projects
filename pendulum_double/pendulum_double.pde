static float g = 0.4;

DoublePendulum pendulum;

public void setup(){
  size(300,300);
  pendulum = new DoublePendulum(new PVector(150,150),75,radians(90),75,radians(179));
}

public void draw(){
  background(154);
  text(frameRate, 0, 10);
  pendulum.go();
}

static float GRAVITY = 0.01;
Pendulum pendulum;
Pendulum pendulum2;
HarmonicMotion h;


void setup(){
  size(800,800);
  pendulum = new Pendulum(new PVector(400,30),radians(100),90,0.98,10);
  pendulum2 = new Pendulum(new PVector(200,200),radians(-80),90,0.99,10);
  h = new HarmonicMotion(new PVector(400,400),20,200,100);
}

void draw(){
  background(154);
  pendulum.go();
  pendulum2.go();
  h.go();
}
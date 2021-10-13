SquareParticle p = new SquareParticle(20,20,400,0,0,0,random(-1,1),random(0,1),PI/4,1,0,255);

CustomParticleSystem smoke;
CustomParticleSystem smoke2;

void setup(){
  size(800,800);
  smoke = new CustomParticleSystem(width/2,height/2,100,1,10,10,-3,3,-3,3,0,0,0,0,3,0,0,0,0,0,255,150);
  smoke2 = new CustomParticleSystem(100,100,800,1,10,10,-3,3,-3,3,0,0,0,0,3,0,0,0,0,0,255,150);
}

void draw(){
  background(154);
  smoke.update();
  smoke.render();
  smoke2.update();
  smoke2.render();
  println(frameRate);
  frameRate(60);
}
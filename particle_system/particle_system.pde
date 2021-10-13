ParticleSystemSmoke p;
ParticleSystemSmoke p2;


void setup(){
  size(600,600);
  p = new ParticleSystemSmoke(width/2,height/2,5,10,900);
  //p2 = new ParticleSystemSmoke(50,50,2,1,200);
}

void draw(){ 
  background(154);
  p.update();
  p.render();
  //p2.update();
  //p2.render();
}

Fractal frac;

PVector rot(PVector p,float len,float angle){
  PVector next = new PVector(p.x + len * cos(radians(angle)),p.y + len * sin(radians(angle)));
  return next;
}

void keyPressed(){
  frac.generate();
}

void setup(){
  size(1200,800);
  frac = new Fractal();
}

void draw(){
  background(255);
  frac.show();
}

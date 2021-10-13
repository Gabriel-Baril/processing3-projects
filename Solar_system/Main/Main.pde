Corpse sun;
Corpse earth;
PVector fRot = new PVector(0,0); 
final float constSun = 1.989 * pow(10, 30);
final float constEarth = 5.972 * pow(10, 24);
final float constLune = 7.3477 * pow(10, 22);

void setup(){
  size(1000,1000);
  sun = new Corpse(width/2,height/2,30,constSun,null);
  earth = new Corpse(200,200,5,constEarth,sun);
}


void draw(){
  frameRate(60);
  background(81);
  sun.addColor(255,0,0,255);
  sun.render();
  sun.update();
  earth.applyForce(fRot);
  earth.addColor(0,0,200,255);
  earth.render();
  earth.update();
  
  println(earth.calculateTheta());
}
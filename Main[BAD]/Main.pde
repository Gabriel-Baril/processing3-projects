float a = 0;
float b = 40;
Square sq;

public double[] rot(double ax,double ay,double x,double y,float angle){
  double[] point = new double[2];
  point[0] = (x-ax)*Math.cos(radians(angle)) - (y-ay)*Math.sin(radians(angle));
  point[1] = (x-ax)*Math.sin(radians(angle)) + (y-ay)*Math.cos(radians(angle));
  return point;
}

void keyPressed(){
  if(keyCode == 39){
    a += 5;
  }
  if(keyCode == 37){
    a -= 5;
  }
}

void setup(){
  size(500,500);
  textSize(12);
  sq = new Square(100,40,20,30);
}

void draw(){
  background(255);
  sq.update();
  //strokeWeight(1);
  //rect(30,30,20,20);
  //strokeWeight(3);
  //point((float)(100 + rot(b,b,30,30,a)[0]),(float)(100 + rot(b,b,30,30,a)[1]));
  //point((float)(100 + rot(b,b,50,30,a)[0]),(float)(100 + rot(b,b,50,30,a)[1]));
  //point((float)(100 + rot(b,b,30,50,a)[0]),(float)(100 + rot(b,b,30,50,a)[1]));
  //point((float)(100 + rot(b,b,50,50,a)[0]),(float)(100 + rot(b,b,50,50,a)[1]));
  //fill(0);
  //text(((int)a % 360),120,100);
}

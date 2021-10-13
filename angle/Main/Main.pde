PVector pos;

void setup(){
  size(500,500);
  pos = new PVector(width/2,height/2);
}

void draw(){
  float dx = mouseX - pos.x;
  float dy = mouseY - pos.y;
  float tang = dy/dx;
  float angle = degrees(atan(tang));
  background(154);
  strokeWeight(5);
  point(pos.x,pos.y);
  strokeWeight(2);
  line(pos.x,pos.y,mouseX,mouseY);
  println(angle);
}
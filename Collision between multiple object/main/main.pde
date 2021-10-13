ArrayList<Rect> objects = new ArrayList<Rect>();

void setup(){
  size(500,500);
  for(int i = 0;i < 10;i++){
    objects.add(new Rect(int(random(10,width-10)),int(random(10,height-10)),20,20,int(random(-3,-1)),int(random(-3,-1))));   
  }
}


void draw(){
  background(154);
  for(int i = 0; i < objects.size();i++){
    objects.get(i).show();
    objects.get(i).move();
    objects.get(i).collisionBorder();
    objects.get(i).collisionEachOther();
  }
}
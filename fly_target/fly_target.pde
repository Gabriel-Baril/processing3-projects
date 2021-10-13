PFont f;
ArrayList<Food> foods = new ArrayList<Food>();
ArrayList<Mob> mobs = new ArrayList<Mob>();

void deleteALl(ArrayList myList){
  myList.clear();
}

void setup(){
  size(1080,720, P2D);
  f = createFont("Arial",10,true);
  for(int i = 0;i < 100;i++){
    int randDim = int(random(1,5));
    mobs.add(new Mob(400,400,randDim,randDim)); //int(random(width)),int(random(height)),1,1
  }
  for(int i = 0;i < 10;i++){
    int randX = int(random(10,1080));
    int randY = int(random(10,720));
    foods.add(new Food(randX,randY,4,4));
  }
  for(int i = 1;i < foods.size();i++){
    float dist = sqrt(pow(foods.get(i).getX() - mobs.get(i).getX(), 2) + pow(foods.get(i).getY() - mobs.get(i).getY(), 2));
    println(dist + "  "  + i);
  }
}

void draw(){
  background(155);
  textFont(f,20);
  fill(0);
  for(int i = 0;i < foods.size();i++){
    foods.get(i).isAte();
    foods.get(i).display(); //int(random(0,255)),int(random(0,255)),int(random(0,255))
    text(i,foods.get(i).getX(),foods.get(i).getY());
  }
  for(int i = 0; i < mobs.size();i++){
    mobs.get(i).display();
    mobs.get(i).choice();
    mobs.get(i).showLife();
    mobs.get(i).track();
    
    if(mobs.get(i).getLife() < 0){
      mobs.get(i).delete();
    }
  }
  println(foods.size());
}
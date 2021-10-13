ArrayList<Entity> entities = new ArrayList<Entity>();
ArrayList<Floor> floors = new ArrayList<Floor>();
public int test = 5; 
PFont f;

void mouseDragged(){
  entities.add(new Entity(int(random(floors.get(0).getWidth(),width + floors.get(1).getWidth())),int(random(floors.get(3).getHeight(),height + floors.get(3).getHeight())),int(random(10,20)),int(random(5,4)),0.2,0));//
}

void detectCollision(){
  for(int i = 0;i < entities.size();i++){
    if(entities.get(i).getY() <= floors.get(2).getY() + floors.get(2).getHeight() || entities.get(i).getY() + entities.get(i).getHeight() >= floors.get(3).getY() + floors.get(3).getHeight()){
      entities.get(i).setDY(-entities.get(i).getDY()/1.5 + 0.7);
      entities.get(i).setHasTouchVerticalWall(true);
      entities.get(i).setHasTouchHorizontalWall(false);
    }
    if(entities.get(i).getX() <= floors.get(0).getX() + floors.get(0).getWidth() || entities.get(i).getX() + entities.get(i).getWidth() >= floors.get(1).getX() + floors.get(1).getWidth()){
      entities.get(i).setDX(-entities.get(i).getDX()/1.5 + 1);
      entities.get(i).setHasTouchHorizontalWall(true);
      entities.get(i).setHasTouchVerticalWall(false);
    }
  }
}

void setup(){
  f = createFont("Arial",20,true);
  size(1000,1000);
  floors.add(new Floor(0,0,10,height));
  floors.add(new Floor(width,0,-10,height));
  floors.add(new Floor(0,0,width,10));
  floors.add(new Floor(0,height,width,-40));
  for(int i = 0;i < 100;i++){
    
  }
}

void draw(){
  background(154);
  textFont(f,20);
  text("Nb entities : " + entities.size(),10,10);
  fill(0);
  if(entities.size() >= 1000){
    entities.clear();
  }
  for(int i = 0;i < floors.size();i++){
    floors.get(i).show();
  }
  for(int i = 0;i < entities.size();i++){
    entities.get(i).show();
    entities.get(i).activeGravityX();
    entities.get(i).activeGravityY();
  }
  detectCollision();
}
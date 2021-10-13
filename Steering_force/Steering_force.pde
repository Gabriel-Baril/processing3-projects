ArrayList<Entity> entities;
ArrayList<PVector> targets;
PVector mouseTarget;


void setup(){
  size(800,800);
  entities = new ArrayList<Entity>();
  targets = new ArrayList<PVector>();
  mouseTarget = new PVector(mouseX,mouseY);
  targets.add(new PVector(width/2,height/2));
  targets.add(new PVector(300,200));
  targets.add(new PVector(500,600));
  targets.add(new PVector(width/4,height - height/4));
  targets.add(new PVector(width - width/4,height/4));
  //targets.add(mouseTarget);
  for(int i = 0;i < 0;i++){
    entities.add(new Entity());
  }

}

void mouseDragged(){
  entities.add(new Entity());
}


void draw(){
  background(0);
  mouseTarget.set(mouseX,mouseY);
  strokeWeight(8);
  stroke(255);
  
  //for(int i = 0;i < targets.size();i++){
  //  point(targets.get(i).x,targets.get(i).y);
  //}
  
  for(int i = 0;i < entities.size();i++){
    entities.get(i).update(targets);
    entities.get(i).render();
  }
}

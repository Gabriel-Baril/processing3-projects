ArrayList<Polygon> polygons = new ArrayList<Polygon>();
Polygon polygon = new Polygon();


void mouseDragged(){
  boolean selectioned = false;
  for(int i = 0;i < polygons.size();i++){
    for(int j = 0;j < polygons.get(i).vertex.size();j++){
      if(polygons.get(i).vertex.get(j).collideWithMouse() && !selectioned){
        polygons.get(i).vertex.get(j).pos.x = mouseX;
        polygons.get(i).vertex.get(j).pos.y = mouseY;
        selectioned = true;
      }
    }
  }
  selectioned = false;
}

void mousePressed(){
  for(int i = 0;i < polygons.size();i++){
    for(int j = 0;j < polygons.get(i).vertex.size();j++){
      if(polygons.get(i).vertex.get(j).collideWithMouse() && mouseButton == RIGHT){
        polygons.get(i).vertex.remove(j);
      }
    }
  }
}

void setup(){
  size(500,500);
  polygon.addVertex(new Vertex(10,20,"A"));
  polygon.addVertex(new Vertex(30,30,"B"));
  polygon.addVertex(new Vertex(60,90,"C"));
  polygon.addVertex(new Vertex(20,100,"D"));
  polygon.addVertex(new Vertex(10,40,"E"));
}

void draw(){
  background(255);
  polygon.update(color(255,0,0));;
}
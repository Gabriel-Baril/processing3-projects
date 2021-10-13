public class Polygon {
  public ArrayList<Vertex> vertex = new ArrayList<Vertex>();

  public Polygon() {
    polygons.add(this);
  }

  public void update(color c) {
    if(vertex.size() <=  2){
      vertex.clear();
      polygons.remove(this);
    }else{
      render(c);
      connect();
    }
  }
  
  public Vertex findBarycenter(){
    Vertex baryCenter;
    int x = 0;
    int y = 0;
    for(int i = 0;i < vertex.size();i++){
      x += vertex.get(i).pos.x;
      y += vertex.get(i).pos.y;
    }
    baryCenter = new Vertex(x/vertex.size(),y/vertex.size(),"BC");
    return baryCenter;
  }
  
  public void showBarycenter(){
    strokeWeight(Constant.POINT_WEIGHT);
    textSize(10);
    text("(" + (int)findBarycenter().pos.x + "," + (int)findBarycenter().pos.y + ")",findBarycenter().pos.x,findBarycenter().pos.y);
    point(findBarycenter().pos.x,findBarycenter().pos.y);
    for (int i = 0; i < vertex.size(); i++) {
      if (i + 1 >= vertex.size()) {
        findBarycenter().connectTo(vertex.get(0));
      } else {
        findBarycenter().connectTo(vertex.get(i+1));
      }
    }
  }
  
  public void fillPolygon(color c){
    fill(c);
    strokeWeight(Constant.LINE_WEIGHT);
    for (int i = 0; i < vertex.size(); i++) {
      if (i + 1 >= vertex.size()) {
        triangle(vertex.get(i).pos.x,vertex.get(i).pos.y,findBarycenter().pos.x,findBarycenter().pos.y,vertex.get(0).pos.x,vertex.get(0).pos.y);
      } else {
        triangle(vertex.get(i).pos.x,vertex.get(i).pos.y,findBarycenter().pos.x,findBarycenter().pos.y,vertex.get(i+1).pos.x,vertex.get(i+1).pos.y);
      }
    }
  }

  public void render(color c) {
    fillPolygon(c);
    fill(0);
    showBarycenter();
    for (int i = 0; i < vertex.size(); i++) {
      vertex.get(i).render();
    }
  }

  public void connect() {
    for (int i = 0; i < vertex.size(); i++) {
      if (i + 1 >= vertex.size()) {
        vertex.get(i).connectTo(vertex.get(0));
      } else {
        vertex.get(i).connectTo(vertex.get(i+1));
      }
    }
  }
  
  public void addVertex(Vertex v){
    vertex.add(v);
  }
}
public class Square{
  PVector pos;
  PVector vel = new PVector(0,0);
  public float w;
  public float h;
  ArrayList<PVector> Points = new ArrayList<PVector>();
  
  public Square(float x,float y,float w,float h){
    this.pos = new PVector(x,y);
    this.w = w;
    this.h = h;
  }
  
  public void update(){
    Points.clear();
    this.pos.add(this.vel);
    Points.add(new PVector(pos.x,pos.y));
    Points.add(new PVector(pos.x + w,pos.y));
    Points.add(new PVector(pos.x,pos.y + h));
    Points.add(new PVector(pos.x + w,pos.y + h));
    this.display(color(0,0,0));
  }
  
  private void display(color c){
    fill(c);
    strokeWeight(3);
    point(Points.get(0).x,Points.get(0).y);
    point(Points.get(1).x,Points.get(1).y);
    point(Points.get(2).x,Points.get(2).y);
    point(Points.get(3).x,Points.get(3).y);
    fill(0);
    strokeWeight(1);
  }
  
  public PVector Center(){
    return new PVector(pos.x + w/2,pos.y + h/2);
  }
  
  public void rot(float angle){
    for(int i = 0;i < Points.size();i++){
      Points.get(i).x = (float)((Points.get(i).x - Center().x)*Math.cos(radians(angle)) - (Points.get(i).y - Center().y)*Math.sin(radians(angle)));
      Points.get(i).y = (float)((Points.get(i).x - Center().x)*Math.sin(radians(angle)) + (Points.get(i).y - Center().y)*Math.cos(radians(angle)));
    }
  }
}

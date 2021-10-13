public class City{
  PVector pos;
  City neighbour;
  
  public City(){
    pos = new PVector(random(width),random(height));
  }
  
  public City(PVector pos){
    this.pos = pos;
  }
  
  public City(City copy){
    this.pos = copy.pos;
    neighbour = copy.neighbour;
  }
  
  public void show(){
    fill(0);
    ellipse(pos.x,pos.y,5,5);
    if(neighbour != null){
      line(pos.x,pos.y,neighbour.pos.x,neighbour.pos.y);
    }
  }
  
  public City copyNeighbour(){
    City c = new City();
    c.neighbour = neighbour;
    return c;
  }
  
  public void connect(City city){
    this.neighbour = city;
  }
  
  public void deconnect(){
    this.neighbour = null;
  }
  
  
  public double distance(){
    return dist(pos.x,pos.y,neighbour.pos.x,neighbour.pos.y);
  }
}

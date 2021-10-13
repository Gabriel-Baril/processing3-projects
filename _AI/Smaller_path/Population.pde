public class Population implements Cloneable{
  City[] cities;

  public Population(int size) {
    this.cities = new City[size];
    randomize_point();
    randomize_road();
  }

  public Population(Population copy) {
    this.cities = new City[copy.cities.length];
    for(int i = 0;i < copy.cities.length;i++){
      this.cities[i] = new City(copy.cities[i]);
    }
  }

  public void randomize_point() {
    for (int i = 0; i < cities.length; i++) {
      cities[i] = new City();
    }
  }


  public void randomize_road() {
    int next = 0;
    int rand = 0;
    ArrayList<Integer> blackList = new ArrayList<Integer>();
    blackList.add(next);
    for (int i = 1; i < cities.length; i++) {
      do {
        rand = (int)random(cities.length);
      } while (blackList.contains(rand));
      cities[next].connect(cities[rand]);
      next = rand;
      blackList.add(rand);
    }
    //println(blackList);
    cities[rand].connect(cities[0]);
    blackList.clear();
  }

  public void reset() {
    for (int i = 0; i < cities.length; i++) {
      cities[i].deconnect();
    }
  }

  public double totalFitness() {
    double total = 0;
    for (int i = 0; i < cities.length; i++) {
      total += 1/cities[i].distance();
    }
    return total;
  }
  
  public Population baby(){
    return new Population(this);
  }
  
  public void mutate(){
    float mr = 0.05;
    
    for(int i = 0;i < cities.length;i++){
      if(mr < random(1)){
        int randIndex; 
        do{
          randIndex = (int)(random(cities.length));
        }while(randIndex == i);
        PVector temp = cities[i].neighbour.pos.copy();
        PVector temp2 = cities[randIndex].neighbour.pos.copy();
        cities[i].neighbour.pos = temp2;
        cities[randIndex].neighbour.pos = temp;
      }
    }
  
  }
  
  public Object clone() throws CloneNotSupportedException {  
    return super.clone();
  }

  public void show() {
    for (int i = 0; i < cities.length; i++) {
      cities[i].show();
    }
  }
}

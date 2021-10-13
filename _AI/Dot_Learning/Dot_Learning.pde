Population test;
PVector goal  = new PVector(400, 10);
ArrayList<Obstacle> obs = new ArrayList<Obstacle>(); 


void setup() {
  size(800, 800); //size of the window
  frameRate(100);//increase this to make the dots go faster
  test = new Population(1000);//create a new population with 1000 members
  obs.add(new Obstacle(0, 300, 600, 10));
  obs.add(new Obstacle(250, 500, 650, 10));
  textSize(16);
}


void draw() {
  background(255);
  
  
  for(int i = 0;i < obs.size();i++){
    obs.get(i).show();
  }
  
  
  //draw goal
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);
  
  //draw obstacle(s)
  fill(0, 0, 255);
  

  if (test.allDotsDead()) {
    //genetic algorithm
    test.calculateFitness();
    test.naturalSelection();
    test.mutateDemBabies();
    println(test.gen);
  } else {
    //if any of the dots are still alive then update and then show them

    test.update();
    test.show();
  }
}

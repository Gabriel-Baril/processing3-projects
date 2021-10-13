Specie specie;
boolean choice;

void keyPressed(){
  choice = (choice == true) ? false : true;
}

void setup() {
  size(800, 800);
  specie = new Specie(100,20);
}

void draw() {
  //background(255);
  //println("Best  : " + specie.getBest().totalFitness());
  //println("Worst  : " + specie.getWorst().totalFitness());
  //specie.show(choice);
  println(specie.generation);
  specie.naturalSelection();
}

ArrayList<PVector> points = new ArrayList<PVector>();
double spacer = 250;
int generation = 0;

void setup(){
  size(1200,800);
  points.add(new PVector(width/2,height - 20));
  translate(width/2,height/2);
  scale(2);
}

void display(){
  for(int i = 0;i < points.size();i++){
    
    strokeWeight(4);
    point(points.get(i).x,points.get(i).y);
  }
}

void generate(){
  ArrayList<PVector> nextGen = new ArrayList<PVector>();
  for(int i = 0;i < points.size();i++){
    nextGen.add(new PVector((int)(points.get(i).x + spacer),(int)(points.get(i).y - 30)));
    nextGen.add(new PVector((int)(points.get(i).x - spacer),(int)(points.get(i).y - 30)));
  }
  
  strokeWeight(1);
  for(int i = 0;i < points.size();i++){
    line(points.get(i).x,points.get(i).y,nextGen.get(i*2).x,nextGen.get(i*2).y);
    line(points.get(i).x,points.get(i).y,nextGen.get(i*2+1).x,nextGen.get(i*2+1).y);
  }
  
  points = nextGen;
  
  spacer /= 2;
}

void draw(){
  //background(255);
  display();
  if(generation <= 10){
    generate();
  }
  
  generation++;
}

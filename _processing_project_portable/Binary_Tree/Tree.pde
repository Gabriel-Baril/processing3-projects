public class Tree{
  final int spacerX = 30;
  final int spacerY = 30;
  PVector pos;
  int nbLevel;
  Level[] levels;
  
  public Tree(PVector pos,int nbLevel){
    this.pos = pos;
    this.nbLevel = nbLevel;
    levels = new Level[nbLevel];
    levels[0] = new Level(1);
    levels[0].components[0] = new Component(pos,(int)random(1,50));
    for(int i = 1;i < levels.length;i++){
      levels[i] = new Level((int)random(1,3));
    }
  }
  
  public void show(){
    levels[0].components[0].pos.
    for(int i = 0;i < levels.length;i++){
      
    }
  }
  
}

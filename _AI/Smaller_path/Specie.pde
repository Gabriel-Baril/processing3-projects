public class Specie{
  Population[] populations;
  int size;
  int generation;
  
  
  public Specie(int size,int size_ref) {
    this.size = size;
    populations = new Population[size];
    Population ref = new Population(size_ref);
    for(int i = 0;i < populations.length;i++){
      populations[i] = new Population(ref);
      populations[i].randomize_road();
    }
    
    //for(int i = 0;i < populations.length;i++){
    // println(populations[i].totalFitness());
    //}
  }
  
  public void naturalSelection(){
    Population[] newPop = new Population[this.populations.length];
    for(int i = 0;i < newPop.length;i++){
      Population parent = selectParent();
      if(generation == 1){
        show(true);
      }
      newPop[i] = parent.baby();
      newPop[i].mutate();
    }
    populations = newPop;
    generation++;
  }
  
  public float fitnessSum(){
    float sum = 0;
    for(int i = 0;i < populations.length;i++){
      sum += populations[i].totalFitness();
    }
    return sum;
  }
  
  public Population selectParent(){
    float rand = random(fitnessSum());
    float runningSum = 0;
    for(int i = 0;i < populations.length;i++){
      runningSum += populations[i].totalFitness();
      if(runningSum > rand){
        return populations[i];
      }
    }
    //println(fitnessSum());
    //println("BUG");
    return null;
  }
  
  public void show(boolean showBest){
    for(int i = 0;i < populations.length;i++){
      if(populations[i].equals(getBest()) && showBest){
        populations[i].show();      
      }
      if(populations[i].equals(getWorst()) && !showBest){
        populations[i].show();      
      }
    }
  }
  
  public Population getBest(){
    Population best = populations[0];
    for(int i = 0;i < populations.length;i++){
      if(populations[i].totalFitness() < best.totalFitness()){
        best = populations[i];
      }
    }
    return best;
  }
  
  public Population getWorst(){
    Population worst = populations[0];
    for(int i = 0;i < populations.length;i++){
      if(populations[i].totalFitness() > worst.totalFitness()){
        worst = populations[i];
      }
    }
    return worst;
  }
}

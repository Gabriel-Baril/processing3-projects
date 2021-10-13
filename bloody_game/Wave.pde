public class Wave {
  int nbEnemy;
  float maxTime;
  float time = 0;
  boolean waveState = true;

  public Wave(int nbEnemy, float maxTime) {
    this.nbEnemy = nbEnemy;
    this.maxTime = maxTime;
  }

  public void startWave() {
    if (waveState) {
      if (time >= maxTime) {
        stopWave();
      } else {
        if (time == 0) {
          for (int i = 0; i < nbEnemy; i++) {
            float randDim = random(5, 20);
            enemies.add(new Enemy(random(20, width - 20), random(20, height - 20), randDim, randDim));
          }
        }
      }
      time++;
      println(time);
      println(enemies.size());
    }
  }

  public void stopWave() {
    if(enemies.size() == 0){
      waveState = false;
      clearWave();
    }
  }
  
  public void clearWave(){
    enemies.clear();
  }
}
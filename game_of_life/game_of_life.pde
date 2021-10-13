PFont f;
int genSpeed = 0;
int celsAround;
int gen = 0;
int sep = 5;
int deadCels = 0;
int aliveCels = 0;
int grid[][] = new int[200][200];
boolean phase[][] = new boolean[200][200];
ArrayList<Integer> toSupX = new ArrayList<Integer>();
ArrayList<Integer> toSupY = new ArrayList<Integer>();
ArrayList<Integer> toAddX = new ArrayList<Integer>();
ArrayList<Integer> toAddY = new ArrayList<Integer>();

void setFirstCels(){
  //for(int i = 0;i < 200;i++){
  //  phase[i][100] = true;
  //}
  //for(int i = 0;i < 200;i++){
  //  phase[50][i] = true;
  //}
  //for(int i = 0;i < 200;i++){
  //  phase[100][i] = true;
  //}
  //for(int i = 0;i < 200;i++){
  //  phase[150][i] = true;
  //}
}

void setRandom(){
  for(int i = 1;i < phase.length-1;i++){
    for(int j = 1;j < phase[0].length-1;j++){
      int rand = round(random(0,1));
      if(rand == 0){
        phase[i][j] = false;
      }
      if(rand == 1){
        phase[i][j] = true;
      }
    }
  }
}

void update(){
  deadCels = 0;
  aliveCels = 0;
  for(int i = 1;i < phase.length-1;i++){
    for(int j = 1;j < phase[0].length-1;j++){
        celsAround = 0;
        if(phase[i+1][j]){
          celsAround++;
        }
        if(phase[i-1][j]){
          celsAround++;
        }
        if(phase[i][j+1]){
          celsAround++;
        }
        if(phase[i][j-1]){
          celsAround++;
        }
        if(phase[i+1][j+1]){
          celsAround++;
        }
        if(phase[i+1][j-1]){
          celsAround++;
        }
        if(phase[i-1][j+1]){
          celsAround++;
        }
        if(phase[i-1][j-1]){
          celsAround++;
        }
        if((celsAround > 3 || celsAround == 1 || celsAround == 0) && phase[i][j] == true){
          
          toSupX.add(i);
          toSupY.add(j);
        }
        if(celsAround == 3 && phase[i][j] == false){
          toAddX.add(i);
          toAddY.add(j);
        }
        if(phase[i][j]){
          aliveCels++;
        }
        if(!phase[i][j]){
          deadCels++;
        }
    }
  }
  for(int i = 0;i < toAddX.size();i++){
    phase[toAddX.get(i)][toAddY.get(i)] = true;
  }
  for(int i = 0;i < toSupX.size();i++){
    phase[toSupX.get(i)][toSupY.get(i)] = false;
  }
  toAddX.clear();
  toAddY.clear();
  toSupX.clear();
  toSupY.clear();
}

void setup(){
  f = createFont("Arial",16,true);
  size(1000,1000);
  setRandom();
}

void draw(){
  genSpeed++;
  background(200);
  fill(0);
  textFont(f,12);
  text("Dead Cels : " + deadCels,0,20);
  text("Alive Cels : " + aliveCels,0,40);
  text("Year pass : " + genSpeed,0,60);
  for(int i = 0;i < grid.length;i++){
    for(int j = 0;j < grid[0].length;j++){
      if(phase[i][j]){
        fill(90);
        rect(i*sep,j*sep,sep,sep);
        noStroke();
      }
    }
  }
 if(genSpeed % 5 == 0){
   update();
   println(frameRate);
 }
}
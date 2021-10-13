Grid grid;
boolean playerPlayed = false;

void setup(){
  size(300,300);
  grid = new Grid();
}

void mouseClicked() {
  if(!grid.finished() && !grid.win(1) && !grid.win(2)){
    grid.updateDataPlayer();
  }
}

void IAPlay(){
  boolean played = false;
  
  if(grid.data[0][0] == 1 && grid.data[1][1] == 1 && grid.data[2][2] == 0){
    grid.data[2][2] = 2;
    played = true;
  }
  if(grid.data[0][0] == 1 && grid.data[1][1] == 0 && grid.data[2][2] == 1){
    grid.data[1][1] = 2;
    played = true;
  }
  if(grid.data[0][0] == 0 && grid.data[1][1] == 1 && grid.data[2][2] == 1){
    grid.data[0][0] = 2;
    played = true;
  }
    
  if(grid.data[0][2] == 1 && grid.data[1][1] == 1 && grid.data[2][0] == 0){
    grid.data[2][0] = 2;
    played = true;
  }
  if(grid.data[0][2] == 1 && grid.data[1][1] == 0 && grid.data[2][0] == 1){
    grid.data[1][1] = 2;
    played = true;
  }
  if(grid.data[0][2] == 0 && grid.data[1][1] == 1 && grid.data[2][0] == 1){
    grid.data[0][2] = 2;
    played = true;
  }
  
  for(int i = 0;i < grid.data.length;i++){
    if(grid.data[i][0] == 1 && grid.data[i][1] == 1 && grid.data[i][2] == 0) {
      grid.data[i][2] = 2;
      played = true;
      break;
    }
    if(grid.data[i][0] == 0 && grid.data[i][1] == 1 && grid.data[i][2] == 1) {
      grid.data[i][0] = 2;
      played = true;
      break;
    }
    if(grid.data[i][0] == 1 && grid.data[i][1] == 0 && grid.data[i][2] == 1) {
      grid.data[i][1] = 2;
      played = true;
      break;
    }
    if(grid.data[0][i] == 1 && grid.data[1][i] == 1 && grid.data[2][i] == 0) {
      grid.data[2][i] = 2;
      played = true;
      break;
    }
    if(grid.data[0][i] == 0 && grid.data[1][i] == 1 && grid.data[2][i] == 1) {
      grid.data[0][i] = 2;
      played = true;
      break;
    }
    if(grid.data[0][i] == 1 && grid.data[1][i] == 0 && grid.data[2][i] == 1) {
      grid.data[1][i] = 2;
      played = true;
      break;
    }
  }
  
  if(!played){
    int indX;
    int indY;
    do {
      indX = floor(random(0,3));
      indY = floor(random(0,3));
  println("IN");
    } while(grid.data[indX][indY] != 0);
    
    grid.data[indX][indY] = 2;
  }
  
  playerPlayed = false;
}

void draw(){
  background(255);
  grid.render();
  if(!grid.finished() && !grid.win(1) && !grid.win(2)){
    if(playerPlayed){
      IAPlay();
    }
  }
}

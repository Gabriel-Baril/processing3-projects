Cell[][] cells;
int cell_size_x = 20;
int cell_size_y = 20;

int current_x = 0;
int current_y = 0;

boolean finished = false;

ArrayList<PVector> data = new ArrayList<PVector>();

void setup() {
  size(800, 800, FX2D);
  cells = new Cell[width/cell_size_x][height/cell_size_y];
  for (int i = 0; i < cells.length; i++) {
    for (int j = 0; j < cells[0].length; j++) {
      cells[i][j] = new Cell();
    }
  }

  cells[current_x][current_y].visited = true;
  frameRate(1000);
}

ArrayList<Integer> choices = new ArrayList<Integer>();

void draw() {
  choices.clear();
  choices.add(0); // LEFT
  choices.add(1); // UP
  choices.add(2); // RIGHT
  choices.add(3); // DOWN
  choices.add(4); // BACK

  background(255);
  cells[current_x][current_y].visited = true;

  //try{
  //  Thread.sleep(1);
  //}catch(InterruptedException e){
  //}

  // render the maze
  for (int x = 0; x < cells[0].length; x++) {
    for (int y = 0; y < cells.length; y++) {
      if (cells[x][y].visited) {
        int neighbors = 0;

        stroke(0);
        if (cells[x][y].up){
          line(x*cell_size_x, y*cell_size_y, x*cell_size_x + cell_size_x, y*cell_size_y);
          neighbors++;
        }else {
          if (y >= 1)
            cells[x][y-1].down = false;
        }

        if (cells[x][y].left){
          line(x*cell_size_x, y*cell_size_y, x*cell_size_x, y*cell_size_y + cell_size_y);
          neighbors++;
        }else {
          if (x >= 1)
            cells[x-1][y].right = false;
        }

        if (cells[x][y].down){
          line(x*cell_size_x, y*cell_size_y + cell_size_y, x*cell_size_x + cell_size_x, y*cell_size_y + cell_size_y);
          neighbors++;
        }else {
          if (y < cells.length - 1){
            cells[x][y+1].up = false;
            if(mousePressed)
              line(x*cell_size_x + cell_size_x/2,y*cell_size_y + cell_size_y/2,x*cell_size_x + cell_size_x/2,y*cell_size_y + cell_size_y*1.5);
          }
        }

        if (cells[x][y].right){
          line(x*cell_size_x + cell_size_x, y*cell_size_y, x*cell_size_x + cell_size_x, y*cell_size_y + cell_size_y);
          neighbors++;
        }else {
          if (x < cells[0].length - 1){
            cells[x+1][y].left = false;
            if(mousePressed)
              line(x*cell_size_x + cell_size_x/2,y*cell_size_y + cell_size_y/2,x*cell_size_x + cell_size_x*1.5,y*cell_size_y + cell_size_y/2);
          }
        }
        
        if(keyPressed){
          noStroke();
          fill(255, 255, 0);
          rect(x*cell_size_x, y*cell_size_y, cell_size_x, cell_size_y);
        }
        
        if(mousePressed){
          noStroke();
          switch(neighbors){
          case 0:
            fill(0,0,255);
            rect(x*cell_size_x + cell_size_x/3,y*cell_size_y + cell_size_y/3,cell_size_x - 2*cell_size_x/3,cell_size_y - 2*cell_size_y/3);
            break;
          case 1:
            fill(0,255,0);
            rect(x*cell_size_x + cell_size_x/3,y*cell_size_y + cell_size_y/3,cell_size_x - 2*cell_size_x/3,cell_size_y - 2*cell_size_y/3);
            break;
          case 2:
            fill(255,0,0);
            rect(x*cell_size_x + cell_size_x/3,y*cell_size_y + cell_size_y/3,cell_size_x - 2*cell_size_x/3,cell_size_y - 2*cell_size_y/3);
            break;
          case 3:
            fill(76,0,153);
            rect(x*cell_size_x + cell_size_x/3,y*cell_size_y + cell_size_y/3,cell_size_x - 2*cell_size_x/3,cell_size_y - 2*cell_size_y/3);
            break;
          }
        }
        
      }
    }
  }
  fill(0, 0, 255);
  text((int)frameRate, 0, 10);
  fill(0);

  if (!finished) {
    fill(255, 0, 0);
    rect(current_x*cell_size_x, current_y*cell_size_y, cell_size_x, cell_size_y);

    // Choices filter
    if (current_x == 0 || cells[current_x - 1][current_y].visited)
      choices.remove(choices.indexOf(0)); // REMOVE LEFT CHOICE
    if (current_y == 0 || cells[current_x][current_y - 1].visited)
      choices.remove(choices.indexOf(1)); // REMOVE UP CHOICE
    if (current_x == cells[0].length - 1 || cells[current_x + 1][current_y].visited)
      choices.remove(choices.indexOf(2)); // REMOVE RIGHT CHOICE
    if (current_y == cells.length - 1 || cells[current_x][current_y + 1].visited)
      choices.remove(choices.indexOf(3)); // REMOVE DOWN CHOICE

    // Logic
    int r_side = (int)random(choices.size());

    if (choices.size() >= 2) {
      data.add(new PVector(current_x, current_y));
    }

    switch(choices.get(r_side)) {
    case 0: // LEFT
      cells[current_x][current_y].left = false;
      if (current_x >= 1)
        current_x -= 1;
      break;
    case 1: // UP
      cells[current_x][current_y].up = false;
      if (current_y >= 1)
        current_y -= 1;
      break;
    case 2: // RIGHT
      cells[current_x][current_y].right = false;
      if (current_x < cells[0].length - 1)
        current_x += 1;
      break;
    case 3: // DOWN
      cells[current_x][current_y].down = false;
      if (current_y < cells.length - 1)
        current_y += 1;
      break;
    case 4: // BACK
      int stack = data.size();
      do {
        if (stack == 0) {
          finished = true;
          break;
        }
        stack--;
        choices.clear();
        choices.add(0); // LEFT
        choices.add(1); // UP
        choices.add(2); // RIGHT
        choices.add(3); // DOWN
        choices.add(4); // BACK
        int c_x = (int)data.get(stack).x;
        int c_y = (int)data.get(stack).y;
        if (c_x == 0 || cells[c_x - 1][c_y].visited)
          choices.remove(choices.indexOf(0)); // REMOVE LEFT CHOICE
        if (c_y == 0 || cells[c_x][c_y - 1].visited)
          choices.remove(choices.indexOf(1)); // REMOVE UP CHOICE
        if (c_x == cells[0].length - 1 || cells[c_x + 1][c_y].visited)
          choices.remove(choices.indexOf(2)); // REMOVE RIGHT CHOICE
        if (c_y == cells.length - 1 || cells[c_x][c_y + 1].visited)
          choices.remove(choices.indexOf(3)); // REMOVE DOWN CHOICE

        //fill(0, 255, 0);
        //rect(c_x*cell_size_x, c_y*cell_size_y, cell_size_x, cell_size_y);
      } while (choices.size() <= 1);
      current_x = (int)data.get(stack).x;
      current_y = (int)data.get(stack).y;
      break;
    }
  }
}

public class Grid {
  public int[][] data;

  public Grid() {
    data = new int[3][3];
  }

  void render() {
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data[i].length; j++) {
        if (data[i][j] == 0) fill(255);
        if (data[i][j] == 1) fill(0, 0, 255);
        if (data[i][j] == 2) fill(255, 0, 0);
        rect(i*width/3, j*width/3, width/3, height/3);
      }
    }
    stroke(0);
    line(width/3, 0, width/3, height);
    line(2*width/3, 0, 2*width/3, height);
    line(0, height/3, width, height/3);
    line(0, 2*height/3, width, 2*height/3);
  }

  boolean finished() {
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data[i].length; j++) {
        if (data[i][j] == 0) {
          return false;
        }
      }
    }
    return true;
  }

  boolean win(int value) {
    if (grid.data[0][0] == value && grid.data[1][1] == value && grid.data[2][2] == value) return true;
    if (grid.data[0][2] == value && grid.data[1][1] == value && grid.data[2][0] == value) return true;

    for (int i = 0; i < grid.data.length; i++) {
      if (grid.data[i][0] == 1 && grid.data[i][1] == 1 && grid.data[i][2] == 0) return true;
      if (grid.data[0][i] == 1 && grid.data[1][i] == 0 && grid.data[2][i] == 1) return true;
    }
    
    return false;
  }

  void updateDataPlayer() {
    int mapX = floor(map(mouseX, 0, width, 0, 3));
    int mapY = floor(map(mouseY, 0, height, 0, 3));
    if (data[mapX][mapY] == 0) {
      data[mapX][mapY] = 1;
      playerPlayed = true;
    }
  }
}

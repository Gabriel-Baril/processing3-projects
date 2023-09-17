final int CELL_COUNT = 30; 
int CELL_SIZE_PX;
FloorGenerator floor;

final float LINE_LEN = 5;

void mouseDragged() {
  floor.generate();
}

void setup()
{
  size(900, 900);
  CELL_SIZE_PX = width / CELL_COUNT;
  floor = new FloorGenerator(20);
  frameRate(5);
}

void draw()
{
  //floor.generate();
  background(120, 120, 120);
  for(RoomData room : floor.rooms)
  {
    fill(255, 255, 255, 255);
    float px = room.x * (float)CELL_SIZE_PX;
    float py = room.y * (float)CELL_SIZE_PX;
    noStroke();
    square(px, py, CELL_SIZE_PX);
    
    float borderWeight = 7;
    stroke(0, 0, 0, 255);
    if(room.leftDoor) {
      strokeWeight(1);
      line(px, py + CELL_SIZE_PX / 2, px + LINE_LEN, py + CELL_SIZE_PX / 2);
      line(px, py, px, py + CELL_SIZE_PX);
    } else {
      strokeWeight(borderWeight);
      line(px, py, px, py + CELL_SIZE_PX);
    }
    
    if(room.upDoor) {
      strokeWeight(1);
      line(px + CELL_SIZE_PX / 2, py, px + CELL_SIZE_PX / 2, py + LINE_LEN);
      line(px, py, px + CELL_SIZE_PX, py);
    } else {
      strokeWeight(borderWeight);
      line(px, py, px + CELL_SIZE_PX, py);
    }
    
    if(room.rightDoor) {
      strokeWeight(1);
      line(px + CELL_SIZE_PX, py + CELL_SIZE_PX / 2, px + CELL_SIZE_PX - LINE_LEN, py + CELL_SIZE_PX / 2);
      line(px + CELL_SIZE_PX, py, px + CELL_SIZE_PX, py + CELL_SIZE_PX);
    } else {
      strokeWeight(borderWeight);
      line(px + CELL_SIZE_PX, py, px + CELL_SIZE_PX, py + CELL_SIZE_PX);
    }
    
    if(room.downDoor) {
      strokeWeight(1);
      line(px + CELL_SIZE_PX / 2, py + CELL_SIZE_PX, px + CELL_SIZE_PX / 2, py + CELL_SIZE_PX - LINE_LEN);
      line(px, py + CELL_SIZE_PX, px + CELL_SIZE_PX, py + CELL_SIZE_PX);
    } else {
      strokeWeight(borderWeight);
      line(px, py + CELL_SIZE_PX, px + CELL_SIZE_PX, py + CELL_SIZE_PX);
    }
  }
}

public class RoomData {
  public int x;
  public int y;
  public boolean rightDoor;
  public boolean upDoor;
  public boolean leftDoor;
  public boolean downDoor;
  
  public RoomData(int x, int y) {
    this.x = x;
    this.y = y;
    this.rightDoor = false;
    this.upDoor = false;
    this.leftDoor = false;
    this.downDoor = false;
  }
}

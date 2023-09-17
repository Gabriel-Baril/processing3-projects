enum Direction {
  LEFT, UP, RIGHT, DOWN
}

class FloorGenerator 
{
  public int maxRoom;
  public int currentRoomCount = 0;
  public ArrayList<RoomData> rooms = new ArrayList<RoomData>();
  
  public FloorGenerator(int maxRoom) {
    this.maxRoom = maxRoom;
  }
  
  public void generate() {
    rooms.clear();
    rooms.add(new RoomData(CELL_COUNT / 2, CELL_COUNT / 2));
    currentRoomCount = 1;
    while(currentRoomCount < maxRoom) {
      generate_new_room_around(choose_random_room());
    }
  }
  
  private Direction choose_random_direction()
  {
    Direction direction = Direction.LEFT;
    if(random(1) <= 0.25) direction = Direction.UP;
    else if(random(1) <= 0.25) direction = Direction.RIGHT;
    else if(random(1) <= 0.25) direction = Direction.DOWN;
    
    return direction;
  }
  
  private void generate_new_room_around(RoomData room) {
    if(room.leftDoor && room.upDoor && room.rightDoor && room.downDoor) {
      generate_new_room_around(get_room_at(room.x - 1, room.y)); // TODO: Better algorithm
      return;  
    }
    
    Direction direction = choose_random_direction();
    RoomData newRoom;
    if(direction == Direction.LEFT) {
      if(get_room_at(room.x - 1, room.y) != null) return;
      
      newRoom = new RoomData(room.x - 1, room.y);
      newRoom.rightDoor = true;
      room.leftDoor = true;
      rooms.add(newRoom);
    }
    else if(direction == Direction.UP) {
      if(get_room_at(room.x, room.y - 1) != null) return;
      
      newRoom = new RoomData(room.x, room.y - 1);
      newRoom.downDoor = true;
      room.upDoor = true;
      rooms.add(newRoom);
    }
    else if(direction == Direction.RIGHT) {
      if(get_room_at(room.x + 1, room.y) != null) return;
      
      newRoom = new RoomData(room.x + 1, room.y);
      newRoom.leftDoor = true;
      room.rightDoor = true;
      rooms.add(newRoom);
    }
    else if(direction == Direction.DOWN) {
      if(get_room_at(room.x, room.y + 1) != null) return;
      
      newRoom = new RoomData(room.x, room.y + 1);
      newRoom.upDoor = true;
      room.downDoor = true;
      rooms.add(newRoom);
    }
    currentRoomCount++;
  }
  
  private RoomData get_room_at(int x, int y) {
    for(RoomData room : rooms) {
      if(room.x == x && room.y == y) {
        return room;
      }
    }
    return null;
  }
  
  private RoomData choose_random_room() {
    int randIndex = (int)random(0, rooms.size());
    return rooms.get(randIndex);
  }
}

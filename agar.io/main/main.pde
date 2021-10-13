ArrayList<Player> player = new ArrayList<Player>();
color playerColor;
ArrayList<Fruit> fruits = new ArrayList<Fruit>();
float zoom = 1;
float nbFruit = 75/zoom;


void keyPressed() {
  if (keyCode == 32) {
    float playerSize = player.size();
    println(playerSize);
    for (int i = 0; i < playerSize; i++) {
      player.get(i).splitPlayer();
    }
  }
}

public void createFruit() {
  color fruitColor = color(random(0, 255), random(0, 255), random(0, 255));
  float randX = random(0, width/zoom);
  float randY = random(0, height/zoom);
  fruits.add(new Fruit(randX, randY, 10, fruitColor));
}

void setup() {
  size(900, 700);

  playerColor = color(255, 0, 0);
  player.add(new Player(width/2, height/2, 25, playerColor));

  for (int i = 0; i < nbFruit; i++) {
    createFruit();
  }
}

void draw() {
  scale(zoom);
  background(255);
  for (int i = 0; i < fruits.size(); i++) {
    fruits.get(i).render();
    fruits.get(i).update();
  }
  for (int i = 0; i < player.size(); i++) {
    player.get(i).render();
    player.get(i).update();
    player.get(i).targetMouse();
    //player.get(i).collideEachOther();
  }
  //println(frameRate);
}
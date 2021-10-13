ArrayList<Platform> platforms;
Player player;
public static final float GRAVITY = 0.01;

void setup(){
  size(800,800);
  platforms = new ArrayList<Platform>();
  platforms.add(new Platform(new PVector(200,200),160,25,new PVector(0,0),new PVector(0,0)));
  player = new Player(new PVector(100,100),10,10);
}

void keyPressed(){
  player.vel = new PVector();
  switch(keyCode){
    case 37:
      player.vel = new PVector(-player.speed,player.vel.y);
      break;
    case 39:
      player.vel = new PVector(player.speed,player.vel.y);
      break;
    case 38:
      player.vel = new PVector(player.vel.x,-player.speed);
      break;
    case 40:
      player.vel = new PVector(player.vel.x,player.speed);
      break;
  }
}

void draw(){
  background(255);
  player.applyforce(new PVector(0,GRAVITY));
  for(int i = 0;i < platforms.size();i++)
  {
    platforms.get(i).update();
    platforms.get(i).render(color(0));
  }
  player.update();
  player.render(color(255,0,0));
}

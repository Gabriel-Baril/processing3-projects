ArrayList<Platform> platforms = new ArrayList<Platform>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
Player player;
color groundColor = color(81);
color playerColor = color(0);
final PVector GRAVITY = new PVector(0, 0.05);
final PVector GRAVITYPARTICLES = new PVector(0, 0.02);
Wave wave = new Wave(1, 30);

public void limitEntities() {
  for (int i = 0; i < projectiles.size(); i++) {
    if (projectiles.get(i).pos.x + projectiles.get(i).w > width || projectiles.get(i).pos.x + projectiles.get(i).w < 0 || projectiles.get(i).pos.y + projectiles.get(i).h > height) {
      projectiles.remove(i);
    }
    if (projectiles.size() > 100) {
      projectiles.remove(0);
    }
  }
}

void keyPressed() {
  player.move();
  player.jump();
}

void keyReleased() {
  player.vel.x = 0;
}

void mouseClicked() {
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).explode();
  }
  player.shoot();
  if (player.isShooting) {
    projectiles.add(new Projectile(player.pos.x + player.w/2, player.pos.y + 2, 3, 3));
  }
  try {
    projectiles.get(projectiles.size()-1).defineTrajectory();
  }
  catch(IndexOutOfBoundsException e) {
  }
}

void setup() {
  size(800, 800);
  //fullScreen();
  //for (int i = 0; i < 10; i++) {
  //  float randDim = random(5, 20);
  //  enemies.add(new Enemy(random(20, width - 20), random(20, height - 20), randDim, randDim));
  //}
  platforms.add(new Platform(0, height - 40, width, height));
  //platforms.add(new Platform(50,50,200,10));
  //platforms.add(new Platform(300,300,100,100));
  //platforms.add(new Platform(200,200,50,20));
  platforms.add(new Platform(800, 760, 100, 20));
  player = new Player(325, 250, 10, 10);
}

void draw() {
  background(154);
  wave.startWave();

  for (int i = 0; i < projectiles.size(); i++) {
    projectiles.get(i).update();
    projectiles.get(i).render();
    projectiles.get(i).applyForce(GRAVITY);
    projectiles.get(i).collidePlatform();
  }
  for (int i = 0; i < platforms.size(); i++) {
    platforms.get(i).render(groundColor);
  }
  for (int i = 0; i < enemies.size(); i++) {
    if (!enemies.get(i).dead) {
      enemies.get(i).render();
    }
    //enemies.get(i).particleCollidePlatform();
    enemies.get(i).update();
    enemies.get(i).shooted();
    enemies.get(i).applyForce(GRAVITY);
    enemies.get(i).collidePlatform(); 
    enemies.get(i).collidePlayer();
    if (enemies.get(i).deadAnimation.particles.size() == 0 && enemies.get(i).dead && enemies.get(i).deadAnimation.stop) {
      enemies.remove(i);
    }
  }
  player.applyForce(GRAVITY);
  player.update();
  if(!player.dead){
    player.render(playerColor);
  }
  player.collideWalls();
  player.collidePlatform();
  limitEntities();
  //println(projectiles.size());
  //println(enemies.size());
}
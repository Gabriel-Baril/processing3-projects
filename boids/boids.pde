ArrayList<Boid> boids;
ArrayList<Obstacle> obstacles;

float hue2rgb(float p,float q,float t) {
  if (t < 0f) t += 1f;
  if (t > 1f) t -= 1f;
  if (t < 1f/6f) return p + (q - p) * 6f * t;
  if (t < 1f/2f) return q;
  if (t < 2f/3f) return p + (q - p) * (2f/3f - t) * 6f;
  return p;
}
    
float[] hslToRgb(float h,float s,float l) {
  float r, g, b;

  if (s == 0f) {
    r = g = b = l; // achromatic
  } else {

    float q = l < 0.5f ? l * (1 + s) : l + s - l * s;
    float p = 2f * l - q;

    r = hue2rgb(p, q, h + 1f/3f);
    g = hue2rgb(p, q, h);
    b = hue2rgb(p, q, h - 1f/3f);
  }

  return new float[]{(int)(r * 255),(int)(g * 255),(int)(b * 255)};
}



void setup(){
  size(1200,900,FX2D);
  //fullScreen(FX2D);
  boids = new ArrayList<Boid>();
  obstacles = new ArrayList<Obstacle>();
  
  obstacles.add(new Obstacle(new PVector(width/4,height/4),50));
  obstacles.add(new Obstacle(new PVector(width - width/4,height/4),50));
  obstacles.add(new Obstacle(new PVector(width/4,height - height/4),50));
  obstacles.add(new Obstacle(new PVector(width - width/4,height - height/4),50));
  
  
  obstacles.add(new Obstacle(new PVector(width/2,height/4),50));
  obstacles.add(new Obstacle(new PVector(width/4,height/2),50));
  obstacles.add(new Obstacle(new PVector(width/2,height/2),150));
  obstacles.add(new Obstacle(new PVector(width - width/4,height/2),50));
  obstacles.add(new Obstacle(new PVector(width/2,height - height/4),50));
  
  for(int i = 0;i < 0;i++){
    boids.add(new Boid());
  }
  frameRate(60);
}

void mouseDragged(){
  boids.add(new Boid(mouseX,mouseY));
}

void draw() {
  background(0);
  stroke(255);
  text(frameRate,0,10);
  text(boids.size(),5,20);

  strokeWeight(2);
  for(int i = 0;i < boids.size();i++){
    boids.get(i).update();
    boids.get(i).render();
  }
  
  for(int i = 0;i < obstacles.size();i++){
    obstacles.get(i).update(boids);
    obstacles.get(i).render();
  }
} 

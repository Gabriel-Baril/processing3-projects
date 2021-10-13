final int SCALE = 25;
PVector[][] gradient;
ArrayList<Dot> dots;
int time = 1000;
HScrollBar gradientVectorRotationSpeed;
HScrollBar gradientVectorMag;
HScrollBar entitySpeedLimiter;
HScrollBar entitySpeedFactorFriction;
HScrollBar entityAccelerationFactorFriction;
HScrollBar entityThickness;

RadialButton button;


void mouseDragged()
{
  gradientVectorRotationSpeed.update();
  gradientVectorMag.update();
  entitySpeedLimiter.update();
  entitySpeedFactorFriction.update();
  entityAccelerationFactorFriction.update();
  entityThickness.update();
  
  button.update();
}

void setup()
{
  size(800,800,FX2D);
  gradientVectorRotationSpeed = new HScrollBar(0.65f,-10,10,5,20,100,1,"Gradient Vector Rotation Speed (deg/frame)");
  gradientVectorMag = new HScrollBar(3,0.1,10,5,35,100,1,"Gradient Vector Mag");
  entitySpeedLimiter = new HScrollBar(5,1,10,5,50,100,1,"Entity Speed Limiter");
  entitySpeedFactorFriction = new HScrollBar(0.955,-1,1,5,65,100,1,"Entity Speed Factor Friction");
  entityAccelerationFactorFriction = new HScrollBar(0,-0.5,0.5,5,80,100,1,"Entity Acceleration Factor Friction");
  entityThickness = new HScrollBar(1,0.3,12,5,95,100,1,"Entity Thickness");
  
  button = new RadialButton(width/2,height/2,30,-45,225,0,100,50);
  
  dots = new ArrayList<Dot>();
  gradient = new PVector[width/SCALE][height/SCALE];
  for(int i = 0;i < width/SCALE;i++)
  {
    for(int j = 0;j < height/SCALE;j++)
    {
      if(i == 0)
      {
        gradient[i][j] = new PVector(3,0);
        continue;
      }
      if(j == 0)
      {
        gradient[i][j] = new PVector(0,3);
        continue;
      }
      if(i == width/SCALE)
      {
        gradient[i][j] = new PVector(-3,0);
        continue;
      }
      if(j == height/SCALE)
      {
        gradient[i][j] = new PVector(0,-3);
        continue;
      }
        
      gradient[i][j] = new PVector(random(1,3),random(1,3)).rotate(radians(map(noise(i,j),0,1,0,25000)));
    }
  }
  for(int i = 0;i < 10000;i++)
  {
    dots.add(new Dot(random(0,width),random(0,height)));
  }
}

void drawGrid()
{
  for(int i = 0;i < width/SCALE;i++)
  {
    line(width/SCALE * i,0,width/SCALE * i,height);
  }
  for(int j = 0;j < height/SCALE;j++)
  {
    line(0,height/SCALE * j,width,height/SCALE * j);
  }
}

void drawVector()
{
  for(int i = 0;i < width/SCALE;i++)
  {
    for(int j = 0;j < height/SCALE;j++)
    {
      line(width/SCALE * i + SCALE/2, height/SCALE * j + SCALE/2,(width/SCALE * i + SCALE/2) + gradient[i][j].x * 3, (height/SCALE * j + SCALE/2) + gradient[i][j].y * 3);
    }
  }
}


void draw()
{
  background(0);
  
  gradientVectorRotationSpeed.render();
  gradientVectorMag.render();
  entitySpeedLimiter.render();
  entitySpeedFactorFriction.render();
  entityAccelerationFactorFriction.render();
  entityThickness.render();
  
  //button.render();
  
  stroke(255);
  strokeWeight(1);
  drawGrid();
  drawVector();
  
  
  
  text("FPS : " + frameRate,0,10);
  
  for(int i = 0;i < dots.size();i++)
  {
    dots.get(i).render();
    dots.get(i).update();
  }
  
  for(int i = 1;i < width/SCALE - 1;i++)
  {
    for(int j = 1;j < height/SCALE - 1;j++)
    {
      gradient[i][j] = gradient[i][j].setMag(gradientVectorMag.getValue());
      gradient[i][j] = gradient[i][j].rotate(radians(gradientVectorRotationSpeed.getValue()));
    }
  }
}

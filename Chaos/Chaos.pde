int spaceX = 10;
int spaceY = 10;
int spawnSpeed = 2;
int frame = 0;

ArrayList<PVector> points;
float epsilon = 0.00001;
float t = 0;
float dt = 0.0001;
void setup()
{
  size(1200,800);
  points = new ArrayList<PVector>();
  for(int i = 0;i < width/spaceX;i++)
  {
    for(int j = 0;j < height/spaceY;j++)
    {
      //points.add(new PVector(i*spaceX - width/2, j*spaceY - height/2));
    }
  }
}

void draw()
{
  background(200);
  color(0);
  stroke(0);
  strokeWeight(10);
  translate(width/2,height/2);
  
  for(int i = 0;i < points.size();i++)
  {
    if(points.get(i).x > -width/2 &&
       points.get(i).x < width/2 &&
       points.get(i).y > -height/2 &&
       points.get(i).y < height/2)
    {
      point(points.get(i).x,points.get(i).y);
      
      float old_x = points.get(i).x;
      float old_y = points.get(i).y;
      
      points.get(i).x += epsilon*old_x*old_x - old_x*epsilon + old_y*epsilon;
      points.get(i).y += -sin(epsilon*old_y*old_y) - t*t - epsilon*old_x*old_y - old_x*epsilon - old_y*epsilon;
    }
    else
    {
      points.remove(i);
    }
  }
  points.add(new PVector(random(-width/2,width/2),random(-height/2,height/2)));
  println(points.size());
  if(points.size() > 500)
  {
    points.remove(0);
  }
  
  frame++;
  //t += dt;
}

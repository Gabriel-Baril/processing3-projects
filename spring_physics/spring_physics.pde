Spring spring;
float theta = 0;

void setup()
{
  size(800,800);
  spring = new Spring(80,50,1.5,200,10);
}


void draw()
{
  background(255);
  spring.set_len(sin(theta)*spring.equilibrium_len + 5);
  spring.render();
}

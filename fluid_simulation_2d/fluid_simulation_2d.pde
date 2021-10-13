

Fluid fluid;

void settings()
{
  size(N*SCALE, N*SCALE);
}

// Incompressible, 
void setup()
{
  fluid = new Fluid(0.1, 0, 0);
}

void mouseDragged()
{
  fluid.addDensity(mouseX/SCALE, mouseY/SCALE, 30);
  float amtX = mouseX - pmouseX;// + random(-3, 3);
  float amtY = mouseY - pmouseY;// + random(-3, 3);
  fluid.addVelocity(mouseX/SCALE, mouseY/SCALE, amtX/5, amtY/5);
}

void draw()
{
  background(0);
  fluid.step();
  fluid.render();
}

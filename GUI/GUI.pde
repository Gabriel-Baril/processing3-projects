RadialButton button;

void mouseDragged()
{
  button.update();
}

void setup()
{
  size(800,800);
  button = new RadialButton(200,200,30,-45,225,0,100,50);
}

void draw()
{
  background(0);
  button.render();
}

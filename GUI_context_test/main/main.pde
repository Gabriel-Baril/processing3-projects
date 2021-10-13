
ComponentRect component;

void setup()
{
  size(800, 800);
  component = new ComponentRect(new PVector(30, 20), new PVector(100, 30));
}

void draw()
{
  component.render();
}

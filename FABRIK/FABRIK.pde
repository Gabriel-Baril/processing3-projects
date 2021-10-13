Arm arm;

void setup()
{
  size(800, 800, FX2D);
  ArrayList<PVector> points = new ArrayList<PVector>();
  points.add(new PVector(20, 20));
  points.add(new PVector(100, 200));
  points.add(new PVector(200, 450));
  arm = new Arm(points);
}

void mouseClicked()
{
  arm.FAB(new PVector(250, 300));
}

void draw()
{
  background(200);
  arm.render();
  point(250, 300);
}

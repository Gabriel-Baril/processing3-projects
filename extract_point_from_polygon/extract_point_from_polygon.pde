Polygon poly;

void mouseDragged()
{
  poly.update();
}

void setup()
{
  size(800,800);
  ArrayList<PVector> points = new ArrayList<PVector>();
  
  points.add(new PVector(300,200));
  points.add(new PVector(500,200));
  points.add(new PVector(700,400));
  points.add(new PVector(400,350));
  points.add(new PVector(100,250));
  
  poly = new Polygon(points);
  println(poly.min_x());
  println(poly.max_x());
  println(poly.min_y());
  println(poly.max_y());
}

void draw()
{
  background(255);
  poly.render(true);
}

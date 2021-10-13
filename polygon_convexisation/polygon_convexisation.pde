ArrayList<Polygon> polygons;



void setup()
{
  size(800,800);
  polygons = new ArrayList<Polygon>();
  
  ArrayList<PVector> v = new ArrayList<PVector>();  
  v.add(new PVector(20,50));
  v.add(new PVector(40,200));
  v.add(new PVector(60,170));
  v.add(new PVector(80,300));
  v.add(new PVector(100,230));
  v.add(new PVector(10,10));
  v.add(new PVector(50,10));
  v.add(new PVector(100,10));
  
  polygons.add(new Polygon(v));
}

void mouseDragged()
{
  for(int i = 0;i < polygons.size();i++)
  {
    polygons.get(i).mouseOnDragged();
  }
}

PVector p1 = new PVector(0,0);
PVector p2 = new PVector(20,20);
PVector p3 = new PVector(20,20);
PVector p4 = new PVector(50,40);

void draw()
{
  background(200);

  
  for(int i = 0;i < polygons.size();i++)
  {
    polygons.get(i).render();
  }
}

LightSource ls;
ArrayList<Segment> segments;

void setup()
{
  size(800,800);
  ls = new LightSource(500,200);
  segments = new ArrayList<Segment>();
  //segments.add(new Segment(600,300,400,400));
  segments.add(new Segment(100,50,50,300));
  segments.add(new Segment(150,500,250,650));
  segments.add(new Segment(380,380,250,200));
  segments.add(new Segment(700,600,500,700));
}

void mouseDragged()
{
  if(dist(ls.pos.x,ls.pos.y,mouseX,mouseY) < thickness)
  {
    ls.setPos(mouseX,mouseY);
  }
}

void draw()
{
  background(240);
  ls.render();
  ls.update();
  for(int i = 0;i < segments.size();i++)
  {
    segments.get(i).render();
  }
}

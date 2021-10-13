public static final int anchorThickness = 12;

ArrayList<Shape> shapes;

LightSource ls;

void mouseDragged()
{
  for(int i = 0;i < shapes.size();i++)
  {
    this.shapes.get(i).onMouseUserInput(mouseX,mouseY);
  }
  if(dist(ls.pos.x,ls.pos.y,mouseX,mouseY) < anchorThickness)
  {
    ls.setPos(mouseX,mouseY);
  }
}


void setup()
{
  size(800,800,FX2D);
  //fullScreen(FX2D);
  shapes = new ArrayList<Shape>();
  ls = new LightSource(width/2,height/2,0.005);
  
  
  ArrayList<PVector> poly_vertices_arr_1 = new ArrayList<PVector>();
  poly_vertices_arr_1.add(new PVector(200,100));
  poly_vertices_arr_1.add(new PVector(300,100));
  poly_vertices_arr_1.add(new PVector(450,250));
  poly_vertices_arr_1.add(new PVector(300,150));
  poly_vertices_arr_1.add(new PVector(150,120));
  shapes.add(new Polygon(poly_vertices_arr_1));
  
  
  ArrayList<PVector> poly_vertices_arr_2 = new ArrayList<PVector>();
  poly_vertices_arr_2.add(new PVector(600,400));
  poly_vertices_arr_2.add(new PVector(700,400));
  poly_vertices_arr_2.add(new PVector(700,600));
  poly_vertices_arr_2.add(new PVector(600,600));
  shapes.add(new Polygon(poly_vertices_arr_2));
  shapes.add(new Circle(200,650,70));
  shapes.add(new Circle(500,400,20));
  shapes.add(new Ellipse(400,700,50,25));
  shapes.add(new Ellipse(200,400,25,150));
  shapes.add(new Segment(600,100,700,200));
  
  //segments.add(new Segment(300,200,450,500));
}
int frame = 0;
void draw()
{
  background(0);
  text(frameRate,0,10);
  for(int i = 0;i < shapes.size();i++)
  {
    shapes.get(i).render(color(255));
  }
  ls.update();
  frame++;
}

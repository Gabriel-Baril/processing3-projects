CurveSegment segment;

ArrayList<CurveSegment> segments;
CurveSegment currentSegment;

Graph graph;
Graph graph2;
Graph graph3;
Graph graph4;
Graph graph5;
Graph graph6;
public int renderPrecision = 1;
public int updatePrecision = 1;

PrintWriter data;

ArrayList<Ball> balls;
Ball current;

Polygon poly;


void mouseWheel()
{
}

void keyPressed()
{
  if(keyCode == 32) 
  {
    this.balls.add( new Ball(mouseX,mouseY,random(15,30)) );
  }
  else if(keyCode == 38)
  {
    updatePrecision++;
    renderPrecision++;
  }
  else if(keyCode == 81)
  {
    segments.add(new CurveSegment(color(random(100,255),random(100,255),random(100,255))));
  }
  else if(keyCode == 71)
  {
    segments.get(segments.size() - 1).applyGravity = true;
  }
}

PVector mouse_before_hold = new PVector();
void mouseReleased()
{
  if(current != null && mouseButton == RIGHT)
        current.applyForce(new PVector(mouse_before_hold.x - mouseX,mouse_before_hold.y - mouseY));
}

void mousePressed()
{
  mouse_before_hold = new PVector(mouseX,mouseY);
  //println(mouse_before_hold.x);
  boolean has_target = false;
  if(mouseButton == RIGHT)
  {
    for(int i = 0;i < balls.size();i++)
    {
      if(dist(mouseX,mouseY,this.balls.get(i).pos.x,this.balls.get(i).pos.y) < this.balls.get(i).radius && mouseButton == RIGHT)
      {
        current = balls.get(i);
        has_target = true;
      }
    }
    if(!has_target)
      current = null;
  }
}

void mouseMoved()
{
}

void mouseDragged()
{
  
  if(mouseButton == LEFT)
  {
    segments.get(segments.size() - 1).addData(new PVector(mouseX,mouseY));
  }
  //if(mouseButton == RIGHT)
  //{
  //  for(int i = 0;i < segment.data.size();i++)
  //  {
  //    segment.data.get(i).add(PVector.sub(new PVector(mouseX,mouseY), new PVector(pmouseX,pmouseY)));
  //  }
  //}
}

void setup()
{
  //size(1650,900,FX2D);
  size(800,800,FX2D);
  
  ArrayList<PVector> verts = new ArrayList<PVector>();
  verts.add(new PVector(20,20));
  verts.add(new PVector(40,20));
  verts.add(new PVector(50,40));
  verts.add(new PVector(20,50));
  
  poly = new Polygon(verts);
  
  segment = new CurveSegment(color(random(100,255),random(100,255),random(100,255)));
  segments = new ArrayList<CurveSegment>();
  
  this.balls = new ArrayList<Ball>();
  
  graph = new Graph(new PVector(30,60),80,200,0,"time","x",0,width);
  graph2 = new Graph(new PVector(250,60),80,200,0,"time","y",0,height);
  graph3 = new Graph(new PVector(30,150),80,200,0,"time","vx",-8,8);
  graph4 = new Graph(new PVector(250,150),80,200,0,"time","vy",-8,8);
  graph5 = new Graph(new PVector(30,240),80,200,0,"time","ax",-8,8);
  graph6 = new Graph(new PVector(250,240),80,200,0,"time","ay",-8,8);
  
  data = createWriter("positions.txt");
}

void draw()
{
  background(0);
  
  
  
  stroke(255);
  for(int i = 0;i < this.balls.size();i++)
  {
    balls.get(i).update();
    balls.get(i).render();
    balls.get(i).collideBall();
    for(int j = 0;j < segments.size();j++)
    {
      balls.get(i).collideCurve(segments.get(j));
    }
    if(balls.get(i).outOfBound()) balls.remove(balls.get(i));
  }
  
  
  if(current != null)
  {
    graph.render();
    graph2.render();
    graph3.render();
    graph4.render();
    graph5.render();
    graph6.render();
    graph.addData(current.pos.x);
    graph2.addData(current.pos.y);
    graph3.addData(current.vel.x);
    graph4.addData(current.vel.y);
    graph5.addData(current.acc.x);
    graph6.addData(current.acc.y);
    
    //data.println("[pos:(" + (int)this.balls.get(0).pos.x + "," + (int)this.balls.get(0).pos.y + ");vel:(" +
    //             this.balls.get(0).vel.x + "," + this.balls.get(0).vel.y + ")]");
  }
  
  poly.render();
  poly.update();
  
  text(frameRate,0,10);
  text(balls.size() + " entities",0,20);
  for(int i = 0;i < segments.size();i++)
  {
    segments.get(i).update();
    segments.get(i).render();
    segments.get(i).collideCurve();
  }
  
  strokeWeight(1);
  if(current != null && mouseButton == RIGHT && mousePressed)
    line(mouseX,mouseY,current.pos.x,current.pos.y);
  
}

void exit()
{
  data.flush();
  data.close();
}

ArrayList<BezierCurve> bezierCurves;
ToggleButton button;
BezierCurve bc1;
PVector lastPress = new PVector(0, 0);
PVector lastRelease = new PVector(0, 0);

long fact(int n)
{
  long result = 1;

  for(long i = 1;i <= n;i++)
  {
    result *= i;
  }
  return result;
}

long pasc(int n, int k)
{
  if(k == 0 || n == k) return 1;
  if(k > n) return 0;
  return fact(n)/(fact(k)*fact(n-k));
}

void mousePressed()
{
  lastPress.x = mouseX;
  lastPress.y = mouseY;
}

void mouseReleased()
{
  lastRelease.x = mouseX;
  lastRelease.y = mouseY;
}

void mouseClicked()
{
  button.update();
  if(!button.clicked() && lastPress.x == lastRelease.x && lastPress.y == lastRelease.y)
  {
    bc1.addControlPoint(new PVector(mouseX, mouseY));
  }
}

void mouseWheel(MouseEvent event)
{
  //println(event.getCount());
    if(event.getCount() == -1)
    {
      if(curveThickness + deltaThickness < 5)
      {
        curveThickness += deltaThickness;
      }
    }
    else
    {
      if(curveThickness - deltaThickness > 0)
      {
        curveThickness -= deltaThickness;
      }
    }
  
}

void mouseDragged()
{
}

public void drawOutputBezier()
{
  noFill();
  strokeWeight(curveThickness);
  //beginShape();
  stroke(255, 100);
  line(width/2, height/2, width, height/2);
  float bound = bc1.points.get(bc1.points.size() - 1).x - bc1.points.get(0).x;
  for(float x = 0;x < bound;x += 0.01)
  {
    point(width/2 + x, bc1.evalY(x/bound));
  }
  //endShape();
}

void setup()
{
  size(800, 400, FX2D);
  textSize(10);
  bezierCurves = new ArrayList<BezierCurve>();
  ArrayList<PVector> arr_bc1 = new ArrayList<PVector>();
  arr_bc1.add(new PVector(30, 20));
  arr_bc1.add(new PVector(50, 40));
  bc1 = new BezierCurve(arr_bc1);
  
  
  button = new ToggleButton(width - 100, 30, 50, 30, true, bc1)
  {
    public void eventOn()
    {
      ((BezierCurve)this.obj).setStartEndInterp(true);
    }
    
    public void eventOff()
    {
      ((BezierCurve)this.obj).setStartEndInterp(false);
    }
  };
  
  bezierCurves.add(bc1);
}

void draw()
{
  background(0, 200);
  
  stroke(255);
  fill(255);
  text(frameRate, 0, 10);
  noFill();
  line(width/2, 0, width/2, height);
  stroke(255, 100);
  line(width/4, 0, width/4, height);
  line(0, height/2, width/2, height/2);
  
  for(BezierCurve current : bezierCurves)
  {
    current.render();
    current.update();
  }
  button.render();
  
  drawOutputBezier();
}

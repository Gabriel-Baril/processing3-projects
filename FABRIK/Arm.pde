public class Arm
{
  private ArrayList<PVector> points;
  private ArrayList<Float> lengths;
  
  public Arm(ArrayList<PVector> points)
  {
    this.points = points;
    this.lengths = calcLengths();
  }

  public void render()
  {
    for(int i = 0;i < points.size() - 1;i++)
    {
      strokeWeight(8);
      point(points.get(i).x, points.get(i).y);
      strokeWeight(3);
      line(points.get(i).x, points.get(i).y, points.get(i + 1).x, points.get(i + 1).y);
      text(dist(points.get(i).x, points.get(i).y, points.get(i + 1).x, points.get(i + 1).y), points.get(i).x, points.get(i).y);
    }
    strokeWeight(8);
    point(points.get(points.size() - 1).x, points.get(points.size() - 1).y);
  }
  
  public ArrayList<Float> calcLengths()
  {
    ArrayList<Float> output = new ArrayList<Float>();
    for(int i = points.size() - 1;i > 0;i--)
    {
      output.add(PVector.sub(points.get(i - 1), points.get(i)).mag());
    }
    return output;
  }
  
  public void FAB(PVector targ)
  {
    println(lengths.get(0), lengths.get(1));
    points.get(points.size() - 1).set(targ);
    for(int i = points.size() - 2;i > 0;i--)
    {
      PVector current = points.get(i);
      PVector prev = points.get(i-1);
      PVector tempVec = PVector.sub(current, prev);
      float tempMag = tempVec.mag();
      prev.add(tempVec.mult(tempMag/lengths.get(i)));
    }
  }
}

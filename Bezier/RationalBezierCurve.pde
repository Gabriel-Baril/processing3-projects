
public class RationalBezierCurve extends BezierCurve
{
  ArrayList<Float> omegas;
  
  public RationalBezierCurve(ArrayList<PVector> points)
  {
    super(points);
    this.omegas = new ArrayList<Float>();
    for(int i = 0;i < points.size();i++)
    {
      omegas.add(0.01);
    }
  }
  
  public float evalX(float t)
  {
    float result = 0;
    float den = 0 ;
    for(int i = 0;i < coefs.size();i++)
    {
      den += coefs.get(i)*Math.pow(1 - t, points.size() - 1 - i)*Math.pow(t, i)*omegas.get(i);
    }
    for(int i = 0;i < coefs.size();i++)
    {
      result += coefs.get(i)*Math.pow(1 - t, points.size() - 1 - i)*Math.pow(t, i)*omegas.get(i)*points.get(i).x;
    }
    return result/den;
  }
  
  public float evalY(float t)
  {
    float result = 0;
    
    float den = 0 ;
    
    for(int i = 0;i < coefs.size();i++)
    {
      den += coefs.get(i)*Math.pow(1 - t, points.size() - 1 - i)*Math.pow(t, i)*omegas.get(i);
    }
    for(int i = 0;i < coefs.size();i++)
    {
      result += coefs.get(i)*Math.pow(1 - t, points.size() - 1 - i)*Math.pow(t, i)*omegas.get(i)*points.get(i).y;
    }
    return result/den;
  }
  
  public void addControlPoint(PVector p)
  {
    super.addControlPoint(p);
    this.omegas.add(random(0.2,1));
  }
}

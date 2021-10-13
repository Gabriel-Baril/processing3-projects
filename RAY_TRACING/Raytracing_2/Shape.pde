public abstract class Shape
{
  public abstract ArrayList<PVector> collide(PVector source,PVector ray);
  public abstract void render(color c);
  public abstract void onMouseUserInput(float x,float y);
}

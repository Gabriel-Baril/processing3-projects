public class Vertex 
{
  public PVector pos;
  public float cornerRadius;
}

public Vertex buildVertex(float x, float y, float cornerRadius)
{
  Vertex vertex = new Vertex();
  vertex.pos = new PVector(x, y);
  vertex.cornerRadius = cornerRadius;
  return vertex;
}

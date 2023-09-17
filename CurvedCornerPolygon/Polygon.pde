static float anchorThickness = 10;

public class Polygon
{
  ArrayList<Vertex> vertices;
    
  public Polygon()
  {
    vertices = new ArrayList<Vertex>();
  }
  
  public void update()
  {
  
  }
  
  public void render()
  {
    for(int i = 0;i < vertices.size();i++)
    {
      int previousIndex = i == 0 ? vertices.size() - 1 : i - 1;
      Vertex previousVertex = vertices.get(previousIndex);
      Vertex currentVertex = vertices.get(i);
      Vertex nextVertex = vertices.get( (i + 1) % vertices.size() );
      
      CornerData corner = getCornerData(currentVertex.pos, previousVertex.pos, nextVertex.pos, currentVertex.cornerRadius);
      // Arc arc = constructArc(currentVertex, )
      //strokeWeight(1);
      strokeWeight(1);
      stroke(0);
      drawCorner(corner, 20);
      
      // circle(corner.origin.x, corner.origin.y, currentVertex.cornerRadius * 2);
      stroke(100, 200);
      line(currentVertex.pos.x, currentVertex.pos.y, nextVertex.pos.x, nextVertex.pos.y);
    }
  }
  
  public void addVertex(Vertex vertex)
  {
    vertices.add(vertex);
  }
  
  public void checkMouseVertexCollision()
  {
    for(int i = 0;i < vertices.size();i++)
    {
      PVector vertexPos = vertices.get(i).pos;
        if(mouseX > vertexPos.x - anchorThickness &&
           mouseX < vertexPos.x + anchorThickness && 
           mouseY > vertexPos.y - anchorThickness &&
           mouseY < vertexPos.y + anchorThickness)
        {
          vertexPos.x = mouseX;
          vertexPos.y = mouseY;
        }
    }
  }
}

// TODO: REMOVE DUPLICATION
CornerData getCornerData(PVector currentVertex, PVector previousVertex, PVector nextVertex, float radius)
{
  PVector previousDir = PVector.sub(previousVertex, currentVertex).normalize();
  PVector nextDir = PVector.sub(nextVertex, currentVertex).normalize();
  PVector previousNormal = new PVector(-previousDir.y, previousDir.x);
  PVector nextNormal = new PVector(-nextDir.y, nextDir.x);
  
  if(nextNormal.dot(previousDir) < 0)
    nextNormal.mult(-1);
    
  if(previousNormal.dot(nextDir) < 0)
    previousNormal.mult(-1);
  
  Line previousLine = new Line();
  Line nextLine = new Line();
  
  previousLine.point = PVector.add(currentVertex, previousNormal.mult(radius));
  previousLine.direction = previousDir;
  nextLine.point = PVector.add(currentVertex, nextNormal.mult(radius));
  nextLine.direction = nextDir;
  
  CornerData data = new CornerData();
  data.origin = previousLine.intersect(nextLine);
  data.startPoint = PVector.sub(data.origin, previousNormal);
  data.endPoint = PVector.sub(data.origin, nextNormal);
  data.radius = radius;
  
  return data;
}

void drawCorner(CornerData corner, int precision)
{
  PVector currentDir = PVector.sub(corner.startPoint, corner.origin).normalize().mult(corner.radius);
  float angleDegree = degrees(corner.getAngleRadians());
  float angleStep = angleDegree / (float)precision;
  PVector currentPoint = PVector.add(corner.origin, currentDir);
  PVector lastPoint = new PVector(currentPoint.x, currentPoint.y);
  for(float i = 0;i < angleDegree;i+=angleStep)
  {
    currentPoint = PVector.add(corner.origin, currentDir);
    line(currentPoint.x, currentPoint.y, lastPoint.x, lastPoint.y);
    currentDir.rotate(radians(angleStep));
    lastPoint = new PVector(currentPoint.x, currentPoint.y);
  }
}

public static final float anchorThickness = 10;

public class Polygon
{
  ArrayList<PVector> vertices;
  
  public Polygon(ArrayList<PVector> vertices)
  {
    this.vertices = vertices;
  }


  public void render()
  {
    int next;
    for(int i = 0;i < vertices.size();i++)
    {
      strokeWeight(5);
      if(isEar(i))
      {
        stroke(0,255,0);
        point(vertices.get(i).x, vertices.get(i).y);     
      }
      else
      {
        stroke(255,0,0);
        point(vertices.get(i).x, vertices.get(i).y);     
      }
      
      strokeWeight(1);
      stroke(0);
      
      text(i, vertices.get(i).x, vertices.get(i).y);
      
      next = next(i);
      line(vertices.get(i).x, vertices.get(i).y, vertices.get(next).x, vertices.get(next).y);
    }
    
    ArrayList<Segment> c_segments = convexise();
    
    if(c_segments != null)
    {
      for(int i = 0;i < c_segments.size();i++)
      {
        line(c_segments.get(i).start.x, c_segments.get(i).start.y, c_segments.get(i).end.x, c_segments.get(i).end.y);
      }
    }
  }
  
  public void update()
  {
    
  }
  
  public ArrayList<Segment> convexise()
  {
    if(isConvex())
      return null;
    ArrayList<Segment> convexisation_segments = new ArrayList<Segment>();
    ArrayList<ArrayList<Integer>> sub_poly_indices = new ArrayList<ArrayList<Integer>>();
    sub_poly_indices.add(new ArrayList<Integer>());
    for(int i = 0;i < vertices.size();i++)
    {
      sub_poly_indices.get(0).add(i);
    }
    
    Pair< Pair< ArrayList<Integer>, ArrayList<Integer> >, IndexSegment > splitted = split_polygon(sub_poly_indices.get(0));
    
    ArrayList<ArrayList<Integer>> sub_poly = new ArrayList<ArrayList<Integer>>();
    sub_poly.add(splitted.first.first);
    sub_poly.add(splitted.first.second);
    
    //println(splitted.first.first.size());
    //println(splitted.first.second.size());
    ArrayList<IndexSegment> iss = new ArrayList<IndexSegment>();
    iss.add(splitted.second);
    
    convexisation_segments.add(new Segment(vertices.get(splitted.second.startIndex),vertices.get(splitted.second.endIndex)));
    
    
    for(int i = 0;i < sub_poly.size();i++)
    {
      if(!constructFromIndices(sub_poly.get(i)).isConvex())
      {
        splitted = split_polygon(sub_poly.get(i)); // ---
        sub_poly.add(splitted.first.first);
        sub_poly.add(splitted.first.second);
        iss.add(splitted.second);
        convexisation_segments.add(new Segment(vertices.get(splitted.second.startIndex), vertices.get(splitted.second.endIndex)));
      }
    }
    
    //for(int i = 0;i < iss.size();i++)
    //{
    //  println("[" + iss.get(i).startIndex + "," + iss.get(i).endIndex + "]");
    //}
    //println("--------------------------------------------------");
    
    return convexisation_segments;
  }
  
  public IndexSegment pickValidSegmentFrom(ArrayList<Integer> indices)
  {
    if(indices.size() <= 3)
      return null;
    
    
    ArrayList<Segment> segs = this.getSegments();
    for(int i = 0;i < indices.size();i++)
    {
      for(int j = 0;j < indices.size();j++)
      {
        boolean isValid = true;
        if(abs(i - j) > 1)
        {
          Segment currentSeg = new Segment(vertices.get(indices.get(i)),vertices.get(indices.get(j)));
          PVector midPoint = new PVector(vertices.get(indices.get(i)).x,vertices.get(indices.get(i)).y).add(currentSeg.getVector().normalize());
          for(int k = 0;k < segs.size();k++)
          {
            if(LINE_LINE_BOOL(currentSeg, segs.get(k)) || !POLYPOINT_COLLIDING(midPoint) )//|| !isEar(indices, nextElementIndexArray(indices, j)))
            {
              isValid = false;
              break;
            }
          }
          if(isValid)
          {
            return new IndexSegment(indices.get(i), indices.get(j));
          }
        }
      }
      println("HERE");
    }
    
    return null;
  }
  
  public Polygon constructFromIndices(ArrayList<Integer> indices)
  {
    ArrayList<PVector> vert_from_indices = new ArrayList<PVector>();
    for(int i = 0;i < indices.size();i++)
    {
      vert_from_indices.add(vertices.get(indices.get(i)));
    }
    return new Polygon(vert_from_indices);
  }
  
  public boolean isConvex(ArrayList<Integer> indices)
  {
    for(int i = 0;i < indices.size();i++)
      if(!isEar(indices, i))
        return false;
    return true;
  }
  
  public boolean isConvex()
  {
    for(int i = 0;i < vertices.size();i++)
      if(!isEar(i))
        return false;
    return true;
  }
  
  public boolean POLYPOINT_COLLIDING(PVector point)
  {
    boolean collision = false;
    int next = 0;
    for(int i = 0;i < vertices.size();i++) {
      next = next(i);
      PVector vc = vertices.get(i);
      PVector vn = vertices.get(next);
      if( (vc.y > point.y) != (vn.y > point.y) && point.x < (vn.x-vc.x)*(point.y-vc.y) / (vn.y-vc.y) + vc.x)
        collision = !collision;
    }
    return collision;
  }
  
  public boolean isEar(int currentId)
  {
    int previousId = (currentId == 0) ? vertices.size() - 1 : currentId - 1;
    float diffX = vertices.get(previousId).x - vertices.get(currentId).x;
    float diffY = vertices.get(previousId).y - vertices.get(currentId).y;
    if(diffX == 0 || diffY == 0)
      return true;
    
    PVector seg_prev_current = new PVector(diffX, diffY).normalize();
    if(POLYPOINT_COLLIDING(new PVector(vertices.get(currentId).x, vertices.get(currentId).y).sub(seg_prev_current)))
      return false;
    return true;
  }
  
  public boolean isEar(ArrayList<Integer> indices, int currentId)
  {
    int previousId = previousElementIndexArray(indices, currentId);
    float diffX = vertices.get(indices.get(previousId)).x - vertices.get(indices.get(currentId)).x;
    float diffY = vertices.get(indices.get(previousId)).y - vertices.get(indices.get(currentId)).y;
    if(diffX == 0 || diffY == 0)
      return true;
      
    PVector seg_prev_current = new PVector(diffX, diffY).normalize();
    if(POLYPOINT_COLLIDING(new PVector(vertices.get(indices.get(currentId)).x, vertices.get(indices.get(currentId)).y).sub(seg_prev_current)))
      return false;
    return true;
  }
  
  
  public int next(int i)
  {
    return (i == vertices.size() - 1) ? 0 : i + 1;
  }
  
  public int previous(int i)
  {
    return (i == 0) ? vertices.size() - 1 : i - 1;
  }

  public ArrayList<Segment> getSegments(ArrayList<Integer> indices)
  {
    ArrayList<Segment> segments = new ArrayList<Segment>();
    for(int i = 0;i < indices.size();i++)
      segments.add(new Segment(vertices.get(indices.get(i)),vertices.get(indices.get(nextElementIndexArray(indices, i)))));
    return segments;
  }
  
  public ArrayList<Segment> getSegments()
  {
    ArrayList<Segment> segments = new ArrayList<Segment>();
    for(int i = 0;i < vertices.size();i++)
      segments.add(new Segment(vertices.get(i),vertices.get(next(i))));
    return segments;
  }

  
  public Pair< Pair< ArrayList<Integer>, ArrayList<Integer> >, IndexSegment > split_polygon(ArrayList<Integer> indices)
  {
    Pair< Pair< ArrayList<Integer>, ArrayList<Integer> >, IndexSegment > splitted = new Pair< Pair< ArrayList<Integer>, ArrayList<Integer> >, IndexSegment >(new Pair< ArrayList<Integer>, ArrayList<Integer> >(new ArrayList<Integer>(),new ArrayList<Integer>()), null);
    splitted.second = pickValidSegmentFrom(indices);
    
    
    for(int i = indices.indexOf(splitted.second.startIndex);i != nextElementIndexArray(indices,indices.indexOf(splitted.second.endIndex));i = nextElementIndexArray(indices, i))
    {
      splitted.first.first.add(indices.get(i));
    }
    
    for(int i = indices.indexOf(splitted.second.startIndex);i != previousElementIndexArray(indices, indices.indexOf(splitted.second.endIndex));i = previousElementIndexArray(indices, i))
    {
      splitted.first.second.add(indices.get(i));
    }
    
    println("--------------------------------------------------");
    println(splitted.first.first);
    println(splitted.first.second);
    
    
    return splitted;
  }
  
  public void mouseOnDragged()
  {
    for(int i = 0;i < vertices.size();i++)
    {
      if(vertices.get(i).x >= mouseX - anchorThickness && 
         vertices.get(i).x <= mouseX + anchorThickness &&
         vertices.get(i).y >= mouseY - anchorThickness && 
         vertices.get(i).y <= mouseY + anchorThickness)
      {
        vertices.get(i).x = mouseX;
        vertices.get(i).y = mouseY;
      }
    }
  }
  
}

public int nextElementIndexArray(ArrayList<Integer> array, int elementIndex)
{
  return (elementIndex == array.size() - 1) ? 0 : elementIndex + 1;
}

public int previousElementIndexArray(ArrayList<Integer> array, int elementIndex)
{
  return (elementIndex == 0) ? array.size() - 1 : elementIndex - 1;
}

public static boolean LINE_LINE_BOOL(Segment s1,Segment s2)
{
  double x1 = s1.start.x;
  double y1 = s1.start.y;
  double x2 = s1.end.x;
  double y2 = s1.end.y;
  double x3 = s2.start.x;
  double y3 = s2.start.y;
  double x4 = s2.end.x;
  double y4 = s2.end.y;
  
  double den = ((x4 - x3) * (y1 - y2) - (x1 - x2) * (y4 - y3));
  
  double uA = ((y3 - y4) * (x1 - x3) + (x4 - x3) * (y1 - y3)) / den;
  double uB = ((y1 - y2) * (x1 - x3) + (x2 - x1) * (y1 - y3)) / den;
  if(uA > 0 && uA < 1 && uB > 0 && uB < 1)
    return true;
  return false;
}
  
public static PVector LINE_LINE_INTER(Segment s1,Segment s2) {
  if(LINE_LINE_BOOL(s1,s2)) {
    double x1 = s1.start.x;
    double y1 = s1.start.y;
    double x2 = s1.end.x;
    double y2 = s1.end.y;
    double x3 = s2.start.x;
    double y3 = s2.start.y;
    double x4 = s2.end.x;
    double y4 = s2.end.y;

    double p_s1 = (y2-y1)/(x2-x1);
    double p_s2 = (y4-y3)/(x4-x3);

    double x_inter = (y3 - y1 - x3*p_s2 + x1*p_s1)/(p_s1 - p_s2);
    double y_inter = (p_s1*x_inter + (y1 - x1*p_s1));
    return new PVector((float)x_inter, (float)y_inter);
  }
  return null;
}

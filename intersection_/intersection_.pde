Line line;
Segment[] segments;
ArrayList<PVector> intersections;
Box box;

boolean LINE_POINT(Segment seg,PVector point,float buffer){
  float d1 = dist(seg.start.x,seg.start.y,point.x,point.y);
  float d2 = dist(seg.end.x,seg.end.y,point.x,point.y);
  float d3 = seg.distance();
  if(d1 + d2 >= d3 - buffer && d1 + d2 <= d3 + buffer)
    return true;
  return false;
}

PVector LINE_LINE(Line l1,Line l2){
  if(l1.coef == l2.coef)
    return new PVector(0,0);
  PVector result = new PVector();
  result.x = (l2.b - l1.b)/(l1.coef - l2.coef);
  result.y = l1.coef*result.x + l1.b;
  
  return result;
}

PVector LINE_SEGMENT(Segment seg,Line line){
  PVector intersection = LINE_LINE(new Line(seg.start,seg.end),line);
  if(intersection.x >= seg.start.x && intersection.x <= seg.end.x)
    return intersection;
  return new PVector(0,0);
}

void setup(){
  size(800,800,P2D);
  
  box = new Box(new PVector(500,500),70,70);
  
  segments = new Segment[5];
  segments[0] = new Segment(new PVector(200,600),new PVector(500,400));
  segments[1] = new Segment(new PVector(100,200),new PVector(300,300));
  segments[2] = new Segment(new PVector(100,300),new PVector(400,200));
  segments[3] = new Segment(new PVector(0,400),new PVector(400,height));
  segments[4] = new Segment(new PVector(100,100),new PVector(200,50));
}

void draw(){
  background(255);
  line = new Line(new PVector(0,0),new PVector(mouseX,mouseY));
  
  //strokeWeight(1);
  //noFill();
  //box.show();
  
  intersections = new ArrayList<PVector>();
  
  for(int i = 0;i < segments.length;i++){
    strokeWeight(1);
    if(segments[i] != null){
      PVector inter = LINE_SEGMENT(segments[i],line);
      if(inter.x != 0 && inter.y != 0){
        stroke(255,0,0);
        intersections.add(inter);
      }
      segments[i].show();
      strokeWeight(5);
      stroke(0);
      point(inter.x,inter.y);
    }
  }
  
  strokeWeight(1);
  if(intersections.size() > 0){
    PVector closer = intersections.get(0);
    for(int i = 0;i < intersections.size();i++){
      if(dist(0,0,intersections.get(i).x,intersections.get(i).y) < dist(0,0,closer.x,closer.y)){
        closer = intersections.get(i);
      }
    }
    
    line(line.p1.x,line.p1.y,closer.x,closer.y);
  }else{
    line.show();
  }
  
}
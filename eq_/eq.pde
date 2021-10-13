enum SIGN {
  GREATER_EQUALS, 
    GREATER, 
    SMALLER_EQUALS, 
    SMALLER, 
    EQUALS
}

boolean contain(PVector point, SIGN signe, double coef, double b) {
  switch(signe) {
  case GREATER_EQUALS:
    if (point.y >= coef*point.x + b)
      return true;
    break;
  case GREATER:
    if (point.y > coef*point.x + b)
      return true;
    break;
  case SMALLER_EQUALS:
    if (point.y <= coef*point.x + b)
      return true;
    break;
  case SMALLER:
    if (point.y < coef*point.x + b)
      return true;
    break;
  case EQUALS:
    if (point.y == coef*point.x + b)
      return true;
    break;
  }
  return false;
}

double dividedDifference(PVector[] points) {
  if (points.length == 1)
    return points[0].y;

  if (points.length == 2)
    return (points[1].y - points[0].y)/(points[1].x - points[0].x);

  PVector[] p1 = new PVector[points.length - 1];
  PVector[] p2 = new PVector[points.length - 1];

  for (int i = 0; i < points.length; i++) {
    if (i != 0)
      p1[i - 1] = points[i];
    if (i != points.length - 1)
      p2[i] = points[i];
  }

  return (dividedDifference(p1) - dividedDifference(p2))/(points[points.length - 1].x - points[0].x);
}

double[] polynomialInterpolation(PVector[] points) {
  double[] result = new double[points.length];
  PVector[] temp;
  for (int i = 0; i < points.length; i++) {
    temp = new PVector[i+1];
    for (int j = 0; j < i+1; j++) {
      temp[j] = points[j];
    }
    result[i] = dividedDifference(temp);
  }
  
  String t;
  for (int i = 0; i < points.length; i++) {
    if (result[i] != 0) {
      t = "";
      print(result[i]);
      for (int j = 0; j < i; j++) {
        t += (points[j].x != 0)?"(x" + ((points[j].x < 0)?"+":"-") + ((points[j].x < 0)?-points[j].x:points[j].x) + ")":"(x)";
      }
      print(t);
      if (i < points.length - 1)
        print(" + ");
    }
  }
  return result;
}



void setup() {
  size(800, 800);
  //println(contain(new PVector(1,1),SIGN.EQUALS,1,0));

  PVector[] pts = {new PVector(-5, -2), new PVector(-1, 6), new PVector(0, 1), new PVector(2, 3), new PVector(4, 6), new PVector(10, -2)};
  polynomialInterpolation(pts);
}

void draw() {
}
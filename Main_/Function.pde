public class Function{
  color col;
  int min;
  int max;
  boolean interval;
  
  public Function(color col,int min,int max){
    this.col = col;
    this.min = min;
    this.max = max;
    interval = true;
  }
  
  public Function(color col){
    this.col = col;
    this.min = 0;
    this.max = 0;
    interval = false;
  }
  
  public Function compose(final Function function){
    final Function _this = this;
    return new Function(color(0)){
      public float f(float x){
        return _this.f(function.f(x));
      }
    };
  }
  
  public Function addition(final Function function){
    final Function _this = this;
    return new Function(color(0)){
      public float f(float x){
        return _this.f(x) + function.f(x);
      }
    };
  }
  
  
  public Function substract(final Function function){
    final Function _this = this;
    return new Function(color(0)){
      public float f(float x){
        return _this.f(x) - function.f(x);
      }
    };
  }
  
  public Function multiplie(final Function function){
    final Function _this = this;
    return new Function(color(0)){
      public float f(float x){
        return _this.f(x) * function.f(x);
      }
    };
  }
  
  public Function divide(final Function function){
    final Function _this = this;
    return new Function(color(0)){
      public float f(float x){
        return _this.f(x) / function.f(x);
      }
    };
  }
  
  public float derivee(float x){
    return (f(x + 1) - f(x));
  }
  
  public float f(float x){return 0;}
}

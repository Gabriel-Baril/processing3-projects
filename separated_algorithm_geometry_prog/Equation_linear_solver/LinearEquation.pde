public class LinearEquation{
  float a;
  float b;
  
  public LinearEquation(float a,float b){
    this.a = a;
    this.b = b;
  }
  
  public void solve(){
    println("x = " + -this.b/a);
    println("f(0) = " + b);
  }
  
  public void f(float x){
    println("f(" + x + ") = " + (a*x + b));
  }
  
  public void show(){
    if(b > 0){
      println("f(x) = " + String.format("%." + nBDecimal(a) + "f",a) + "x" + " + " + String.format("%." + nBDecimal(b) + "f",b));
    }else if(b < 0){
      println("f(x) = " + String.format("%." + nBDecimal(a) + "f",a) + "x" + " - " + String.format("%." + nBDecimal(-b) + "f",-b));
    }else if(b == 0){
      println("f(x) = " + String.format("%." + nBDecimal(a) + "f",a) + "x");
    }
  }
}

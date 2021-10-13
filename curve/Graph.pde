public class Graph
{
  PVector pos;
  float h;
  float w;
  ArrayList<Float> values;
  String independantVarName;
  String dependantVarName;
  
  float real_min;
  float real_max;
  
  public Graph(PVector pos,float h,float w,float firstValue,String independantVarName,String dependantVarName,float real_min,float real_max)
  {
    values = new ArrayList<Float>();
    values.add(firstValue);
    this.pos = pos;
    this.h = h;
    this.w = w;
    this.independantVarName = independantVarName;
    this.dependantVarName = dependantVarName;
    this.real_min = real_min;
    this.real_max = real_max;
  }
  
  public void render()
  {
    stroke(255);
    strokeWeight(1);
    fill(255);
    line(this.pos.x,this.pos.y,this.pos.x,this.pos.y + h);
    line(this.pos.x,this.pos.y + this.h,this.pos.x + w,this.pos.y + h);
    if(values.size() < w) 
    {
      for(int i = 0;i < values.size();i++)
      {
        float v = map(values.get(i),real_min,real_max,0,h);
        //point(this.pos.x + i,this.pos.y + this.h - v);
        line(this.pos.x + i,this.pos.y + this.h - v,this.pos.x + i,this.pos.y + this.h);
        if(i == values.size() - 1) text(values.get(i),this.pos.x + i + 5,this.pos.y + this.h - v);
      }
    } 
    else 
    {
      for(int i = 0;i < w;i++)
      {
        float v = map(values.get(values.size() - 1 - i),real_min,real_max,0,h);
        //point(this.pos.x + w - i,this.pos.y + this.h - v);
        strokeWeight(4);
        line(this.pos.x + w - i,this.pos.y + this.h - v,this.pos.x + w - i,this.pos.y + this.h);
        //if(i > 0) line(this.pos.x + w - i - 1,this.pos.y + this.h - map(values.get(values.size() - i),real_min,real_max,0,h),this.pos.x + w - i,this.pos.y + this.h - v);
        if(i == 0) text(values.get(values.size() - 1 - i),this.pos.x + w - i + 5,this.pos.y + this.h - v);
      }
      removeUnviewData();
    }
  }
  
  private void removeUnviewData()
  {
    if(values.size() > w)
    {
      for(int i = 0;i < values.size() - w;i++)
      {
        values.remove(i);
      }
    }
  }
  
 public void addData(float data)
 {
   values.add(data);
 }
}

final int N = 200;
final int ITER_COUNT = 4;
final int SCALE = 4;

// Source: https://mikeash.com/pyblog/fluid-simulation-for-dummies.html

int IX(int x, int y)
{
  x = constrain(x, 0, N-1);
  y = constrain(y, 0, N-1);
  return x + y*N;
}

float hue2rgb(float p,float q,float t) {
  if (t < 0f) t += 1f;
  if (t > 1f) t -= 1f;
  if (t < 1f/6f) return p + (q - p) * 6f * t;
  if (t < 1f/2f) return q;
  if (t < 2f/3f) return p + (q - p) * (2f/3f - t) * 6f;
  return p;
}
    
float[] hslToRgb(float h,float s,float l) {
  float r, g, b;

  if (s == 0f) {
    r = g = b = l; // achromatic
  } else {

    float q = l < 0.5f ? l * (1 + s) : l + s - l * s;
    float p = 2f * l - q;

    r = hue2rgb(p, q, h + 1f/3f);
    g = hue2rgb(p, q, h);
    b = hue2rgb(p, q, h - 1f/3f);
  }

  return new float[]{(int)(r * 255),(int)(g * 255),(int)(b * 255)};
}

class Fluid {
  int size;
  float dt; // delta time
  float diffusion; // 
  float viscosity; // thickness of the fluid
  
  float[] prevDensity;
  float[] density;
  
  float[] vx;
  float[] vy;

  float[] vx0;
  float[] vy0;
  
  public Fluid(float dt, float diffusion, float viscosity) {
    this.size = N;
    this.dt = dt;
    this.diffusion = diffusion;
    this.viscosity = viscosity;
    
    this.prevDensity = new float[N * N];
    this.density = new float[N * N];
    
    this.vx = new float[N * N];
    this.vy = new float[N * N];
    
    this.vx0 = new float[N * N];
    this.vy0 = new float[N * N];
  }
  
  void render()
  {
    for(int i = 0;i < N;i++)
    {
      for(int j = 0;j < N;j++)
      {
        float x = i * SCALE;
        float y = j * SCALE;
        int index = IX(i, j);
        float d = this.density[index];
        // cool results:
        // fill(d, 255); // Grey scale
         fill(d*map(this.vx[index], -2, 2, 0, 255), d*map(this.vy[index], -2, 2, 0, 255), d*map(this.vx[index], -2, 2, 0, 255)*map(this.vy[index], -2, 2, 0, 255), 255); // Blue-ish
        // fill(d*map(this.vx[index], -2, 2, 0, 255), d*map(this.vy[index], -2, 2, 0, 255), d, 255); // Yellow
        
        float[] col = hslToRgb((this.vx[index])/(this.vy[index]),d/30,d/30);
        //fill(col[0], col[1], col[2], 255);
        noStroke();
        rect(x,y,SCALE,SCALE);
        this.density[IX(i, j)] -= 0.01f; // Decay
      }
    }
  }
  
  void step()
  {
    int N          = this.size;
    float visc     = this.viscosity;
    float diff     = this.diffusion;
    float dt       = this.dt;
    float[] Vx      = this.vx;
    float[] Vy      = this.vy;
    float[] Vx0     = this.vx0;
    float[] Vy0     = this.vy0;
    float[] prevDensity      = this.prevDensity;
    float[] density = this.density;
    
    diffuse(1, Vx0, Vx, visc, dt);
    diffuse(2, Vy0, Vy, visc, dt);
    
    project(Vx0, Vy0, Vx, Vy);
    
    advect(1, Vx, Vx0, Vx0, Vy0, dt);
    advect(2, Vy, Vy0, Vx0, Vy0, dt);
    
    project(Vx, Vy, Vx0, Vy0);
    
    diffuse(0, prevDensity, density, diff, dt);
    advect(0, density, prevDensity, Vx, Vy, dt);
  }
  
  void addDensity(int x, int y, float amount)
  {
    int index = IX(x, y); 
    this.density[index] += amount;
  }
  
  void addVelocity(int x, int y, float amountX, float amountY)
  {
    int index = IX(x, y); 
    this.vx[index] += amountX;
    this.vy[index] += amountY;
  }
}

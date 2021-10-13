public class Planet {
  PVector pos;
  PVector vel;
  float mass;


  public Planet(PVector pos, PVector vel, float mass) {
    this.pos = pos;
    this.vel = vel;
    this.mass = mass;
  }

  public void update() {
    for (int i = 0; i < planets.size(); i++) {
      this.gravitate(planets.get(i));
    }

    collide();

    pos.add(vel);

    this.show();
  }

  public void show() {
    ellipse(pos.x, pos.y, mass, mass);
  }

  public void gravitate(Planet planet) {
    float dx = planet.pos.x - pos.x;
    float dy = planet.pos.y - pos.y;
    float dist = dx*dx + dy*dy;

    if (dist != 0) {
      float force = planet.mass/dist;
      float angle = atan2(planet.pos.y - this.pos.y, planet.pos.x - this.pos.x);

      vel.add(force * cos(angle), force * sin(angle));
    }
  }

  public void collide() {
    for (int i = 0; i < planets.size(); i++) {
      Planet current = planets.get(i);
      if (current != this) {
        if (dist(current.pos.x, current.pos.y, pos.x, pos.y) < current.mass/2 + mass/2) {
          
          float nextMass = sqrt(current.mass*current.mass + mass*mass);
          
          planets.add(new Planet(pos, vel.normalize(), nextMass));
          planets.remove(this);
          planets.remove(current);
        }
      }
    }
  }
}

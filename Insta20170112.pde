import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;

Particle p1, p2;

void setup()
{
  size(512, 512);
  frameRate(30);
  colorMode(HSB);
  
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
  
  p1 = new Particle(new Vec2D(100, 80), true);
  p2 = new Particle(new Vec2D(200, 180), false);
  
  physics.addParticle(p1);
  physics.addParticle(p2);
  
  float len = 80;
  float strength = 0.01;
  VerletSpring2D spring = new VerletSpring2D(p1, p2, len, strength);
  
  physics.addSpring(spring);
}

void draw()
{
  // background(128);
  
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);
  
  physics.update();
  p1.display();
  p2.display();
  
  if(mousePressed)
  {
    p2.lock();
    p2.x = mouseX;
    p2.y = mouseY;
    p2.unlock();
  }
}
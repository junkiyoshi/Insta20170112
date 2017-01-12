class Particle extends VerletParticle2D
{
  boolean changeColor;
  
  Particle(Vec2D loc, boolean c)
  {
    super(loc);
    changeColor = c;
  }
  
  void display()
  {
    if(changeColor)
    {
      fill(frameCount % 255, 255, 255);
    }
    else
    {
      fill(255);
    }
    
    noStroke();
    ellipse(x, y, 16, 16);
  }
}
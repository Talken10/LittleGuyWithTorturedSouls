class Boulder extends Sprite
{
 Boulder()
 {
  super();
  this.velocity.x = -4;
  this.location.y = (height/2.0) - this.boxY;
 }
 
 void check()
 {
  if (this.location.x < -this.boxX - (width/2))
  {
   this.location.x = -(width/2.0) + random(1999,2000);
   this.location.y = (height/2.0) - 50;
   this.currentAni = floor(random(0, this.nAni));
   this.boxX = this.ani[currentAni].frames[0].width/5;
   this.boxY = this.ani[currentAni].frames[0].height/5;
   this.ani[currentAni].w = this.boxX;
   this.ani[currentAni].h = this.boxY;
   this.reg.x = this.boxX/3;
   this.reg.y = this.boxY/3;
  }
  if(this.collide()) 
  {
    beep.play(); 
    
  }
 }
 
 boolean collide()
 {
  PVector s1 = new PVector(this.location.x, this.location.y);
  PVector s2 = new PVector(s.location.x, s.location.y);
  PVector d = s1.sub(s2);
  float dist = d.mag();
  float limit = min(this.boxX, this.boxY)/2 + min(s.boxX, s.boxY)/2;
  if (dist < limit) return (true);
  return(false); 
 }
  
}

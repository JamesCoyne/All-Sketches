void setup(){
  size(400,400);
  pixelDensity(2);
  background(0);
  noFill();
  stroke(255);
}
final float a = 0.01;
class bubble{
  PVector pos, vel, acc;
  float af;
  float vf;
  
  bubble(float x, float y, float af1, float vf1){
    pos = new PVector(x, y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    af = af1;
    vf = vf1;
  }
  
   bubble(float x, float y, PVector init, float af1, float vf1){
    pos = new PVector(x, y);
    vel = init;
    acc = new PVector(0,0);
    af = af1;
    vf = vf1;
  }
  
  void display(){
    ellipse(pos.x,pos.y,10,10);
  }
  
  void update(PVector pos2){
    /* if(pos2.x > pos.x){
      vel.add(a,0);
    }
    if(pos2.x < pos.x){
       vel.add(-a,0);
    }
    if(pos2.y > pos.y){
      vel.add(0,a);
    }
    if(pos2.y < pos.y){
      vel.add(0,-a);
    } */
    float x1 = pos.x;
    float x2 = pos2.x;
    float y1 = pos.y;
    float y2 = pos2.y;
    
    float dx = (x2 - x1);
    float dy = (y2 - y1);
    
    acc.set(dx*af,dy*af);
    vel.add(acc);
    pos.add(vel.div(vf));
  }  
  
  public PVector getPos(){
    return(pos);
  }
  
   public boolean touching(bubble b){
    if(dist(this.getPos().x,this.getPos().y,b.getPos().x,b.getPos().y) <= (12) ){
     return true;
    }
    else return false;
  }
}
ArrayList<bubble> bubbles = new ArrayList<bubble>();
bubble b = new bubble(200,200,new PVector(0,0),.0005,1.01);
void draw(){
  fill(0,0,0,127);
  rect(0,0,width,height);
  for(int b = 0; b < bubbles.size(); b++){
    for(int h = 0; h < bubbles.size(); h++){
      if(!bubbles.get(b).touching(bubbles.get(h))) bubbles.get(b).update(new PVector(bubbles.get(h).getPos().x,bubbles.get(h).getPos().y));
    }
  bubbles.get(b).display();
  }
}

void mousePressed(){
  bubbles.add(new bubble(mouseX,mouseY,new PVector(0,0),.0005,1.01));
}
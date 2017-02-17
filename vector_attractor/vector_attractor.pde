void setup(){
  size(400,400);
  pixelDensity(2);
  background(0);
  noFill();
  stroke(255);
}
final float a = 0.00001;

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
  
  bubble(PVector u){
   pos = u;
   vel = new PVector(0,0);
   acc = new PVector(0,0);
  }
  
    bubble(PVector u, PVector v){
   pos = u;
   vel = v;
   acc = new PVector(0,0);
  }
  
  
   bubble(float x, float y, PVector init, float af1, float vf1){
    pos = new PVector(x, y);
    vel = init;
    acc = new PVector(0,0);
    af = af1;
    vf = vf1;
  }
  
  void display(){
    point(pos.x,pos.y);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
  }
  
  void attract(PVector pos2){
    PVector force;
    if(pos != pos2)  force = PVector.sub(pos,pos2);
    else{
    force = new PVector(0,0);
    }
    float dsquared = force.magSq();
    float G = -10;
    float strength = G / dsquared;
    force.setMag(strength);
    acc = force;
  }  
  
  public PVector getPos(){
    return(pos);
  }
  
   public boolean touching(bubble b){
    if(dist(this.getPos().x,this.getPos().y,b.getPos().x,b.getPos().y) < (50) ){
     return true;
    }
    else return false;
  }
  
}
ArrayList<bubble> bubbles = new ArrayList<bubble>();
void draw(){
  point(200,200);
  for(int b = 0; b < bubbles.size(); b++){
    for(int n = 0; n < bubbles.size(); n++){
    if(b != n)bubbles.get(b).attract(bubbles.get(n).getPos());
    bubbles.get(b).update();
    }
    bubbles.get(b).attract( new PVector(200,200));
    bubbles.get(b).update();
    bubbles.get(b).display();
  }
}

void mousePressed(){
 for(int i = 0; i < 10; i++){
   bubbles.add(new bubble(new PVector(random(150,250),random(150,250) ) ) );
 }
  println(bubbles.size());
}
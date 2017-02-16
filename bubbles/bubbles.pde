class bubbleController{
  private ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

  bubbleController(){
  }
  
  void addBubble(float x, float y, float r){
    boolean ok = true;
    for(int b = 0; b < bubbles.size(); b++){
      if(dist(x,y,bubbles.get(b).getX(),bubbles.get(b).getY())+2 <= (r + bubbles.get(b).getR())){
        ok = false;
      }
    }
    if(ok) bubbles.add(new Bubble(x,y,r));
  }
  
  void update(){
    
  }
}
 
 
 class Bubble extends bubbleController{
  private float x;
  private float y;
  private float r;
  private boolean growing = true;
  
  public Bubble(float x1, float y1, float r1){
    x = x1;
    y = y1;
    r = r1;
  }
  
  public void update(){
    if(growing) r++;
    if((x - r < 0) || (y - r < 0) || (x + r > width) || (y + r > height)){
      growing = false;
    }
    display();
    
  }
  
    public void intersecting(Bubble b){
    if(dist(this.getX(),this.getY(),b.getX(),b.getY()) <= (this.getR() + b.getR()+2)){
      this.setGrowing(false);
      b.setGrowing(false);
    }    
  }

  public boolean touching(Bubble b){
    if(dist(this.getX(),this.getY(),b.getX(),b.getY()) <= (this.getR() + b.getR()+2) ){
     return true;
    }
    else return false;
  }
  
  public void display(){
    ellipse(x,y,r,r);
  }
  
  public float getX(){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  public float getR(){
    return r;
  }
  public void setGrowing(boolean x){
    growing = x;
  }
}
 
 
void setup(){
  pixelDensity(2);
  background(0);
  stroke(255);
  noFill();
  ellipseMode(RADIUS);
  size(400,400);
}

 ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

void draw(){
  background(0,0,0);
for(int i = 0; i < bubbles.size(); i++){
  bubbles.get(i).update();
  bubbles.get(i).display();
  for(int b = 0; b < bubbles.size(); b++){
  if(i != b){
    bubbles.get(i).intersecting(bubbles.get(b));
    
    if(bubbles.get(i).touching(bubbles.get(b))) {
      stroke(255,0,0);
      line(bubbles.get(i).getX(),bubbles.get(i).getY(),bubbles.get(b).getX(),bubbles.get(b).getY());
      stroke(255);
    }
    
    }
  }
}



}

void mousePressed(){
  gennew(mouseX, mouseY, 5);
}

void gennew(float x, float y, float r){
 boolean ok = true;
  for(int b = 0; b < bubbles.size(); b++){
   if(dist(x,y,bubbles.get(b).getX(),bubbles.get(b).getY())+2 <= (r + bubbles.get(b).getR())){
     ok = false;
   }
  }
  if(ok) bubbles.add(new Bubble(x,y,r));
}
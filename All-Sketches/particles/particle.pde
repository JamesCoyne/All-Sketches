class particle{
  int x;
  int y;
  
  float velocity;
  float size;
  float sizeChange;
  
  int xi;
  int yi;
  
  float vi;
  float si;
  float sci;
  
  //x, y, velocity, size change, size
  particle(int px, int py, float v, float d, float s){
    x = px;
    y = py;
  
    velocity = v;
    sizeChange = d;
    size = s;
  
    xi = x;
    yi = y;
  
    vi = velocity;
    si = size;
    sci = sizeChange;
  }

  void output(){
    if(size > 0){
      ellipse(x,y,size,size);
      y -= velocity;
      size-=sizeChange;
    }
    else{
      x=xi;
      y=yi;
      velocity = vi;
      size = si;
      sizeChange = sci;
    }
  }

}
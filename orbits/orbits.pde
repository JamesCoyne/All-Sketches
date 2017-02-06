void setup(){
  size(640, 360, P3D);
  background(0);
  noFill();
  stroke(255);
  translate(width/2, height/2);
 
}
 float x = 0;
 float y = 0;
 
void draw(){
 background(0);
  camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  translate(width/2, height/2, -100);

  sphere(100);
  
  rotateY(x);
  x+= 0.05;
  translate(300, 0, 0);
  sphere(50);
  
  rotateY(y);
  y+= 0.1
  ;
  translate(100, 0, 0);
  sphere(25);
}
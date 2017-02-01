import processing.video.*;

Capture cam;

void setup(){
  size(640,360);
  cam = new Capture(this,640,360);
  cam.start();
  tint(255,2);
}

void draw(){
if(cam.available()) cam.read();
 
image(cam,0,0);
}
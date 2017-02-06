import com.hamoid.*;
VideoExport videoExport;

void setup(){
size(600,600, P3D);
noFill();
stroke(255);
 videoExport = new VideoExport(this);
  videoExport.startMovie();
}
float x = 100;
void draw(){
background(0);
lights();
translate(width/2,height/2);
stroke(random(0,255),random(0,255),random(0,255));
fill(random(0,255),random(0,255),random(0,255));
pushMatrix();
rotateX(x);
rotateY(x);
rotateZ(x);
box(30);
popMatrix();
stroke(255);
noFill();
for(int i = 0; i < 20; i++){
rotateZ(x);
pushMatrix();
rotateX(x);
rotateY(x);
translate(i*20,0);
box(20);
popMatrix();
}
x+=0.005;
videoExport.saveFrame();
}
void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
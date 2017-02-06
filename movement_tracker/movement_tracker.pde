  
import processing.video.*;

Capture cam;

void setup() {
  size(640, 360);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}
float[][] oldpix = new float[230400][3];


final int threshold = 11;
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  scale(0.5);
  //scale(-1.0,1.0);
  image(cam, 0, 0);
  loadPixels();
   for(int i = 0; i < pixels.length; i++){
      float r = red(pixels[i]);
      float g = green(pixels[i]);
      float b = blue(pixels[i]);
      
      if(!( r < oldpix[i][0]- threshold || r > oldpix[i][0] + threshold)) pixels[i] = color(255,255,255,10);
      if(!(  g < oldpix[i][1]- threshold || g > oldpix[i][1] + threshold)) pixels[i] = color(255,255,255,10);
      if(!( b < oldpix[i][2]- threshold || b > oldpix[i][2] + threshold)) pixels[i] = color(255,255,255,10);
      
       oldpix[i][0] = r;
       oldpix[i][1] = g;
       oldpix[i][2] = b;
   }
   updatePixels();
}
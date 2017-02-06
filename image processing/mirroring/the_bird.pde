boolean sqSelect(int i, int x, int y, int lx, int ly){
if(( (i % width) > x && (i % width) < lx+x) && (i / height) > y && (i / height) < ly+y) return true;
else return false;
}

class chunk{
  private color[] data;
chunk(int x){
  data = new color[x];
}
}

void setup(){
size(400, 400);
// Before we deal with pixels
PImage pic = loadImage("pic.jpg");
image(pic,-350,-200);
loadPixels();  
// Loop through every pixel
float x = pixels[0];
for (int i = 0; i < pixels.length; i++) {
  float r = red(pixels[i]);
  float g = green(pixels[i]);
  float b = blue(pixels[i]);
  //CODE GOES HERE CODE GOES HERE
  r = red(pixels[pixels.length-i-1]);
  g = green(pixels[pixels.length-i-1]);
  b = blue(pixels[pixels.length-i-1]);
  
 //END CODE HERE
 pixels[i] = color(r,g,b);
}
updatePixels(); 
}
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
  //if(r < 50) r = random(0,255);
   //if(g < 50) g = random(0,255);
    //if(b < 50) b = random(0,255);
    r %= 100;
    g %= 100;
    b %= 100;
    r*=2;
    g*=2;
    b*=2;
 //END CODE HERE
 pixels[i] = color(r,g,b);
}
updatePixels(); 
}
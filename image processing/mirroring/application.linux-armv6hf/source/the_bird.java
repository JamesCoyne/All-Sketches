import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class the_bird extends PApplet {

public boolean sqSelect(int i, int x, int y, int lx, int ly){
if(( (i % width) > x && (i % width) < lx+x) && (i / height) > y && (i / height) < ly+y) return true;
else return false;
}

class chunk{
  private int[] data;
chunk(int x){
  data = new int[x];
}
}

public void setup(){

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
  public void settings() { 
size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "the_bird" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

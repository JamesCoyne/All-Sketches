 int max = 100;
 float zoom = 4;
 float xoff = 300;
 float yoff = 300;
 float speed = 10;
void setup(){

  size(600,600);
  colorMode(HSB,max);
  background(255);

 
}

public void drawCrosshairs(int s){
  stroke(max);
  int w = width/2;
  int h = height/2;
line(w-s,h,w+s,h);
line(w,h-s,w,h+s);
}


void draw(){
loadPixels();


//nested for loops for going though every pixel
for (int row = 0; row < width; row++) {
    for (int col = 0; col < height; col++) {
    
      
        //calculates complex numbers
        //range of the set that are printed
        
        //current real number
        double c_re = (col - (yoff))*zoom/height;
        //current imaginary number
        double c_im = (row - (xoff))*zoom/width;
        double x = 0, y = 0;
        //how many times the function has looped
        int iteration = 0;
        
        //========================================\\
                  //the guts of the code\\
        //========================================\\
          //will repeat until the value is no longer cublic, 
          //and the loop has not exceeded the maximum iterations
     
        while (x*x+y*y <= 4 && iteration < max) {
            double x_new = x*x - y*y + c_re;
            
            y = 2*x*y + c_im;
            x = x_new;
        
            iteration++;
        }
        
        //convert nested loops to 1D array.
        int loc = row + col * width;
        
        //draw the pixels
        //if the point is not in the mandelbrot set, color it based on the iterations.
        if (iteration < max) pixels[loc] = color(iteration,max,max); 
        //if the point is in the mandelbrot set, make it black.
        else pixels[loc] = color(0);
    }
}
updatePixels();
speed = mouseX/60;

if(keyPressed == true){
if(key == 'w') {
  //scale(zoom); 
  zoom -= 0.25; 
}
if(key == 's'){
  //scale(zoom); 
  zoom += 0.25 ;
}
if(keyCode == RIGHT) xoff -= speed;
if(keyCode == LEFT) xoff += speed;
if(keyCode == UP) yoff += speed;
if(keyCode == DOWN) yoff -= speed;
}

drawCrosshairs(5);

}
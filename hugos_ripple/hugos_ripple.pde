int si;
void setup(){
size(400,400);
loadPixels();
si = pixels.length;
print(si);
}



float damping = 0.5;
void draw(){
int[] buffer2 = new int[si];
int[] buffer1 = new int[si];
  
loadPixels();


if(mousePressed) buffer1[100] = 512;
for(int i = 0; i < buffer1.length; i++){
  int x = i%width;
  int y = i/width;
  if(x > 0 && y > 0 && x < width-1 && y < height-1){
    
    
      buffer2[i] = (
      buffer1[(x-1)+(y)]*
      buffer1[(x+1)+(y)]*
      buffer1[(x)+(y+1)]*
      buffer1[(x)+(y-1)]) /
      (2 - buffer2[i]);
      
      buffer2[i] *= damping;
      
  }
}

for(int i = 0; i < buffer1.length; i++){
  pixels[i] = color(buffer2[i]);
  int pixval = buffer1[i];
  buffer1[i] = buffer2[i];
  buffer2[i] = pixval;
}
updatePixels();
}
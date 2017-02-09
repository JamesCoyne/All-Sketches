float damping = .97;
float[][] buffer1;
float[][] buffer2;

import ddf.minim.*;
Minim minim;
AudioInput in;


void setup(){
  size(400,400);
  buffer1 = new float[400][400];
  buffer2 = new float[400][400];
  colorMode(HSB,100);
   minim = new Minim(this);
 in = minim.getLineIn();
}

void draw(){
  mouseController();
  update();
  display();
  swap();
}

void update(){
  //for every non-edge element:
    buffer1[200][200] = in.left.get(0)*512;
  for(int x = 1; x < 400-3; x++){
    for(int y = 1; y < 400-3; y++){
      
      buffer2[x][y] = (buffer1[x-1][y]+
                           buffer1[x+1][y]+
                           buffer1[x][y+1]+
                           buffer1[x][y-1]) / 2 - buffer2[x][y];
                           
      buffer2[x][y] *= damping;
    }
  }
  }

//Display Buffer2
void display(){
  loadPixels();
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      pixels[y + x*width] = color((map(buffer2[x][y]*10,-512,512,0,100)),100,100);
    }
  }
  updatePixels();
}

void swap(){
  float[][] temp;
  temp = buffer2;
  buffer2 = buffer1;
  buffer1 = temp;
}

void mouseController(){
  if(mousePressed){
    if(mouseX > 0 && mouseY > 0 && mouseX < 400 && mouseY < 400){
    buffer1[mouseY][mouseX] = 512;
    }
  }
}
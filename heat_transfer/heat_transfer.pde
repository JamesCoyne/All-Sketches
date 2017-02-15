float[][] buffer1;
float[][] buffer2;
int s =799;
void setup(){
  size(400,400);
  colorMode(HSB,400);
  pixelDensity(displayDensity());
  buffer1 = new float[width*2][width*2];
  buffer2 = new float[width*2][width*2];
      for(int x = 0; x < 800; x++){
        for(int y = 0; y < 800; y++){
    //buffer1[x][y] = round(random(0,5555));
        }
      }
      for(int x = 400; x < 500; x++){
        for(int y = 0; y < 800; y++){
    //buffer1[x][y] = random(5555,9999);
        }
      }
      
      //buffer1[40][399] = 400000000;
}
int time = 1;
void draw(){
  if(mousePressed) {
    buffer1[mouseY*2][mouseX*2] = time;
  time+= 1600;
}
  //buffer1[400][400] = 999999999;
  update();
  display();
  swap();
  //saveFrame();
}

void update(){
  for(int x = 0; x < height*2; x++){
    for(int y = 0; y < width*2; y++){
      
       float sum = 0;
       int count = 0;
       
       if(x > 0 ){
       if(buffer1[x][y] < buffer1[x - 1][y]){
         sum += buffer1[x - 1][y];
         count++;
         }
       }
       
       if(y > 0){
         if(buffer1[x][y] < buffer1[x][y-1]){
           sum += buffer1[x][y-1];
           count++;
         }
       }
       
       if(x < s){
         if(buffer1[x][y] < buffer1[x+1][y]){
         sum += buffer1[x+1][y];
         count++;
         }
       }
       
       if(y < s){
         if(buffer1[x][y] < buffer1[x][y+1]){
           sum+= buffer1[x][y+1];
           count++;
         }
       }
       
       if(x > 0 && y > 0){
         sum+= buffer1[x-1][y-1];
           count++;
       }
       
       if(x > 0 && y < s){
         sum+= buffer1[x-1][y+1];
           count++;
       }
       
       if(x < s && y > 0){
         sum+= buffer1[x+1][y-1];
           count++;
       }
       
       if(x < s && y < s){
         sum+= buffer1[x+1][y+1];
           count++;
       }
       
        buffer2[x][y] = (sum / count);
        if(count == 0) buffer2[x][y] = 0;
        
       
    }
  }
  
}

  
//Display Buffer2
void display(){
  loadPixels();
  for(int x = 0; x < width*2; x++){
    for(int y = 0; y < height*2; y++){
      pixels[y + x*width*2] = color(buffer2[x][y]%400,400,400);
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
      for(int x = 1; x < width-1; x++){
        for(int y = 1; y < height-1; y++){
    buffer1[x][y] = random(0,100);
        }
      }
    }
  }
}
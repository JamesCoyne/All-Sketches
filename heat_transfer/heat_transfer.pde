float[][] buffer1;
float[][] buffer2;

void setup(){
  size(400,400);
  colorMode(HSB,400);
  buffer1 = new float[400][400];
  buffer2 = new float[400][400];
     for(int x = 1; x < width-1; x++){
        for(int y = 1; y < height-1; y++){
    //buffer1[x][y] = round(random(0,4000));
        }
      }
}

void draw(){
  if(frameCount%400 == 0)buffer1[round(random(0,399))][round(random(0,399))] = frameCount*(frameCount);
  update();
  display();
  swap();
  
  //fill(0);
  //rect(mouseX,mouseY,100,-15);
  //fill(400);
  //text(buffer2[mouseX][mouseY],mouseX,mouseY);
}

void update(){
  for(int x = 0; x < 400; x++){
    for(int y = 0; y < 400; y++){
      
       float sum = 0;
       int count = 0;
       
       if(x > 0 ){
       if(buffer1[x][y] <= buffer1[x - 1][y]){
         sum += buffer1[x - 1][y];
         count++;
         }
       }
       
       if(y > 0){
         if(buffer1[x][y] <= buffer1[x][y-1]){
           sum += buffer1[x][y-1];
           count++;
         }
       }
       
       if(x < 400-1){
         if(buffer1[x][y] <= buffer1[x+1][y]){
         sum += buffer1[x+1][y];
         count++;
         }
       }
       
       if(y < 400-1){
         if(buffer1[x][y] <= buffer1[x][y+1]){
           sum+= buffer1[x][y+1];
           count++;
         }
       }
       
       if(x > 0 && y > 0){
         sum+= buffer1[x-1][y-1];
           count++;
       }
       
       if(x > 0 && y < 400-1){
         sum+= buffer1[x-1][y+1];
           count++;
       }
       
       if(x < 400-1 && y > 0){
         sum+= buffer1[x+1][y-1];
           count++;
       }
       
       if(x < 400-1 && y < 400-1){
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
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      pixels[y + x*width] = color(buffer2[x][y]%400,400,400);
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

void keyPressed(){
  println(frameCount);
}
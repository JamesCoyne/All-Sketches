int[][] buffer1;
int[][] buffer2;

void setup(){
  size(400,400);
  colorMode(HSB,400);
  buffer1 = new int[400][400];
  buffer2 = new int[400][400];
  
  for(int x = 0; x < 400; x++){
    for(int y = 0; y < 400; y++){
      //if(x%20 == 0) buffer1[x][y] = 512;
    }
  }
  //frameRate(5);
}

void draw(){
  mouseController();
  update();
  
  background(400);
  display();
  swap();
  
}

void update(){
  for(int x = 0; x < 400; x++){
    for(int y = 0; y < 400; y++){
      
       float sum = 0;
       int count = 0;
       
       if(x > 0 ){
       //if(buffer1[x][y] >= buffer1[x - 1][y]){
         sum += buffer1[x - 1][y];
         count++;
         //}
       }
       
       if(y > 0){
         //if(buffer1[x][y] >= buffer1[x][y-1]){
           sum += buffer1[x][y-1];
           count++;
         //}
       }
       
       if(x < 400-1){
         //if(buffer1[x][y] >= buffer1[x+1][y]){
         sum += buffer1[x+1][y];
         count++;
         //}
       }
       
       if(y < 400-1){
         //if(buffer1[x][y] >= buffer1[x][y+1]){
           sum+= buffer1[x][y+1];
           count++;
         //}
       }
        buffer2[x][y] = round(sum / count);
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
  int[][] temp;
  temp = buffer2;
  buffer2 = buffer1;
  buffer1 = temp;
}
int time = 400;
void mouseController(){
  if(mousePressed){
    if(mouseX > 0 && mouseY > 0 && mouseX < 400 && mouseY < 400){
      //time+= 50;
    buffer1[mouseY][mouseX] = time;
    }
    else time = 400;
  }
}

void keyPressed(){
  println("cleared");
   for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
buffer1[x][y]%= 400;

    }
   }
}
int cols, rows;
float flying = 0;
float[][] terrain;

void setup(){
size(400,400);
colorMode(HSB,125);
cols = width;
rows = height;
terrain = new float[cols][rows];
}

void draw(){
  //render noise 1
  float yoff = 0;
for(int y = 0; y < rows; y++){
  float xoff = 0;
  for(int x = 0; x < cols; x++){
    float current = map(noise(xoff,yoff)*1.5,0,1,0,100) ;
    terrain[x][y] = current;
     xoff += 0.005;
  }
  yoff += 0.005;
}

//render noise 2
  yoff = 0;
for(int y = 0; y < rows; y++){
  float xoff = 0;
  for(int x = 0; x < cols; x++){
    float current = map(noise(xoff,yoff)*1.5,0,1,1,1.1);
    if(mousePressed) terrain[x][y] *= current;
     xoff += 0.05;
  }
  yoff += 0.05;
}


//draw
for(int y = 0; y < rows; y++){
  for(int x = 0; x < cols; x++){
    stroke(terrain[x][y],100,100);
 point(x,y);
  }
}
}
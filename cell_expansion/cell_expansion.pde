int[][] points = new int[40][40];

void drawPoints(){
for(int i = 0; i < 40; i++){
for(int h = 0; h < 40; h++){
  if(points[i][h] == 1) fill(255);
  else if(points[i][h] == 2) fill(255,0,0);
  else fill(0);
  rect(i*10,h*10,10,10);
}
}
}

void grow(){
  for(int i = 1; i < 39; i++){
  for(int h = 1; h < 39; h++){
    if(points[i][h] == 1){
      if(points[i-1][h] == 0) points[i-1][h] = 1;
      if(points[i+1][h] == 0) points[i+1][h] = 1;
      if(points[i][h-1] == 0) points[i][h-1] = 1;
      if(points[i][h+1] == 0) points[i-1][h+1] = 1;
    }
}
}
}

void setup(){
  size(400,400);
  points[5][5] = 1;
  noStroke();
  for(int h = 39; h > 0; h--){
  points[39 - h][h] = 2;
  }
 
  
  
}

void draw(){
  frameRate(5);
  grow();
  drawPoints();
}
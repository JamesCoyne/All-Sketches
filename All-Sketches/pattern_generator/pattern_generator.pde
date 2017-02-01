color color1 = color(255,0,0);
color color2 = color(0,204,0);
int pixSize = 10;
int pixAmountX = 3;
int pixAmountY = 20;
void setup(){
  frameRate(5);
size(400,400);
noStroke();
}

void draw(){
  background(color1);
  fill(color2);
  
  
  boolean[][] pattern = new boolean[pixAmountX][pixAmountY];
  for(int y = 0; y < pixAmountY; y++){
  for(int x = 0; x < pixAmountX; x++){
    pattern[x][y] = randomBool();
  }
  }
  
  for(int q = 0; q < width/pixSize; q++){
  for(int p = 0; p < height/pixSize; p++){
   for(int y = 0; y < pixAmountY; y++){
  for(int x = 0; x < pixAmountX; x++){
    if(pattern[x][y]) rect(x*pixSize+(q*pixSize*pixAmountX),y*pixSize+(p*pixSize*pixAmountY),pixSize,pixSize);
  }
  }
  }
  }
  
}
 
boolean randomBool(){
  if((-1 + (int)random(2) * 2)> 0)return true; 
  else return false;
}
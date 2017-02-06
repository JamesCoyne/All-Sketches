int cols, rows;
int scl = 50;
int w = 5000;
int h = 5000;
float[][][] terrain;
final float weee = 0.5;
void setup(){
size(400,400);
fill(0);
background(0,0,255);
stroke(255);
cols = w / scl;
rows = h/ scl;
terrain = new float[cols][rows][2];
}


void draw(){
for(int y = 0; y < rows; y++){
  for(int x = 0; x < cols; x++){
     terrain[x][y][0] = random(-weee,weee);
     terrain[x][y][1] = random(-weee,weee);
  }
}


//translate(-w/2,-h/2);
for(int y = 0; y < rows-1; y++){
  beginShape(TRIANGLE_STRIP);
for(int x = 0; x < cols; x++){
vertex((x+terrain[x][y][0])*scl, (y+terrain[x][y][1])*scl);
vertex((x+terrain[x][y+1][0])*scl, (y+1+terrain[x][y+1][1])*scl);
}
endShape();
}

}
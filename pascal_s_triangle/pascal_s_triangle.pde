int coloor = 0;
float angle = 4* radians(60);
int margin = 0;
int smallest = 20;

void setup(){
size(850,850);
stroke(255);
}

void draw(){
  background(0);
translate(margin,height-margin);
float zoom = 1;
scale(zoom);
println(zoom);
int size = 850;
drawTriangle(size, zoom );
}

void drawTriangle(int size,float zoom){
 for(int x = 0; x < 3; x++){
    strokeWeight(1/zoom);
    pushMatrix();
    line(0,0,size,0); 
    translate(size/2,0);
    if(size > smallest/zoom) drawTriangle(size/2,zoom);
    
    popMatrix();
    translate(size,1);
    rotate(angle);
 }
}
void setup(){
size(400,400,P3D);
noFill();
stroke(255);
strokeWeight(2);
}
 
 int offset = 50;
 int amount = 7;
 final float speed = 0.05;
 float rot = 0;
void draw(){
  background(0);
  rot+= speed;
  translate(0,offset);
  for(int p = 0; p < amount; p++){
  for(int i = 0; i < amount; i++){
    translate(offset,0);
    pushMatrix();
    rotateX(rot);
    //rotateY(((float)i/10));
    rotateZ((float)p/10);
    box(25);
    popMatrix();
    }
    translate(-amount*offset,offset);
  }
}
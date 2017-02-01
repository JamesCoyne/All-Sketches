void setup(){
size(400,400);
noStroke();
}

particleController steve = new particleController(250,250,100);

void draw(){
  background(0);
  steve.control();
}
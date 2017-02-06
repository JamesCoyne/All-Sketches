void setup(){
  size(400,400);
  background(0);
  strokeWeight(5);
  stroke(255);
  
  for(int i = 0; i < amount; i++){
    points[i][0] = random(0,width);
    points[i][1] = random(0,height);
  }
  
   for(int i = 0; i < amount; i++){
     strokeWeight(5);
     stroke(255);
     point(points[i][0],points[i][1]);
     stroke(0,255,0);
     text(i,points[i][0],points[i][1]);
   }
   
   for(int i = 0; i < amount; i++){
       int closest= 0;
       int closest2 =0;
       float d = width*height;
       float d2 = width*height;
       
     for(int h = 0; h < amount; h++){
      
       if(dist(points[i][0],points[i][1],points[h][0],points[h][1]) < d && h!= i){
         d = dist(points[i][0],points[i][1],points[h][0],points[h][1]);
         closest = h;
       }
     }
      strokeWeight(1);
      stroke(0,255,0);
     line(points[i][0],points[i][1],points[closest][0],points[closest][1]);
     
     for(int h = 0; h < amount; h++){
     if(dist(points[i][0],points[i][1],points[h][0],points[h][1]) < d2 && h!= i && h != closest){
         d2 = dist(points[i][0],points[i][1],points[h][0],points[h][1]);
         closest2 = h;
       }
     }
     stroke(255,0,0);
     line(points[i][0],points[i][1],points[closest2][0],points[closest2][1]);
    
     triangle(points[i][0],points[i][1],points[closest2][0],points[closest2][1],points[closest][0],points[closest][1]);
     
   }
  
}
int amount = 500;
float[][] points = new float[amount][2];
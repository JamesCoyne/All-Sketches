class particleController{
  int x;
  int y;
  int amount;
  int test = 100;
  particle[] particlez = new particle[test];
 
  particleController(int xp, int yp, int amountp){
    x = xp;
    y = yp;
    amount = amountp;
    initialize();
  }
  
  particleController(int xp, int yp, int amountp, int varx, int vary, float varv, float vars, float varsc ){
     x = xp;
     y = yp;
    amount = amountp;
    initialize();
  }
  
  void initialize(){
  for(int x = 0; x < particlez.length; x++){
      particlez[x] = new particle(200+ round(random(-20,20)),200,random(0,2),random(0,1),50);
    }
  }
  
 
  
  void control(){
    for(int x= 0; x < particlez.length; x++){
      if(particlez[x].size > 0) particlez[x].output();
      else particlez[x] = new particle(mouseX,mouseY,random(0.05,2),random(0.5,3),50);
    }
  }
  
}
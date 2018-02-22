void initTest3Values(){
  trunkCenter = new PVector(2*width/3, height/2);
  trunkRadius = height/2;
  growthRate = 1; //rings/season 
  age = 20; //years
}

void drawTest3(){
  int numRings = floor(age*growthRate);

  for(int i = 1; i<numRings; i++){
   drawTest2(int((trunkRadius/numRings)*i), trunkCenter);
  }
  
}
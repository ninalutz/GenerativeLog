void initTest1Values(){
  trunkCenter = new PVector(2*width/3, height/2);
  trunkRadius = height/4;
  growthRate = 1; //rings/season 
  age = 10; //years
}


void drawTest1(){
    drawRings();
    age += .25;
    trunkRadius = min(height, trunkRadius += .25);
    growthRate += random(-.2,.2);
    if(abs(trunkRadius - height) < 5){
        clear();
        background(255);
        initTest1Values();
    }
}


void drawRings(){
  int numRings = floor(age*growthRate);

  for(int i = 1; i<numRings; i++){
     stroke(random(50, 200));
     noFill();
     ellipse(trunkCenter.x, trunkCenter.y, (trunkRadius/numRings)*i, (trunkRadius/numRings)*i);
     fill(20);
     ellipse(trunkCenter.x, trunkCenter.y, 5, 5);
  }
}
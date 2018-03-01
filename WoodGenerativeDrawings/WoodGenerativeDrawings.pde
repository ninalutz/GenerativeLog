//variables for wood
float branching, age, growthRate, sawAngle, cellSize, burls;

//visual layers for log section
PVector trunkCenter;
float trunkRadius;
boolean test1, test2, test3;

void setup(){
  size(500, 500);
  background(255);
//  initTest3Values();
  initTest4();
  test3 = false;
}

void draw(){
  background(255);
//  
//  if(test1){
//  drawTest1();
//  }
//  if(test2){
//    drawTest2(height/2 - 50,  new PVector(width/2, height/2));
//  }
//  if(test3){
//    drawTest3();
//  }
  drawTest4();
//  noLoop();
}

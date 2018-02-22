//variables for wood
float branching, age, growthRate, sawAngle, cellSize, burls;

//visual layers for log section
PVector trunkCenter;
float trunkRadius;
boolean test1, test2, test3;

void setup(){
  size(1920, 1000, P3D);
  background(255);
  initTest3Values();
  test3 = true;
}

void draw(){
  if(test1){
  drawTest1();
  }
  if(test2){
    drawTest2(height/2 - 50,  new PVector(width/2, height/2));
  }
  if(test3){
    drawTest3();
  }
  noLoop();
}
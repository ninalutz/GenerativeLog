//variables for wood
float branching, age, growthRate, sawAngle, cellSize, burls;

//visual layers for log section
PVector trunkCenter;
float trunkRadius;
boolean test1;

void setup(){
  size(1920, 1000, P3D);
  background(255);
  initTest1Values();
}

void draw(){
  if(test1){
  drawTest1();
  }

  
  drawCurvyCircle();
  noLoop();
}
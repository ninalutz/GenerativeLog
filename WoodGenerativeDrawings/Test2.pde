void drawTest2(int r, PVector center){
  float tolerance = map(r, 0, height/2, .4, 2.5);
  stroke(50, 50, 50, 150);
  ArrayList<PVector> points = new ArrayList<PVector>();
  noFill();
  beginShape();
  beginContour();
  for(int i = -2; i<361; i+=1){
    float x = r * cos(radians(i)) + center.x + random(-tolerance, tolerance);
    float y = r * sin(radians(i)) + center.y + random(-tolerance, tolerance);
    points.add(new PVector(x, y));
    curveVertex(x, y);
  }  
  
  endContour();
  endShape();
  
}
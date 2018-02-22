void drawTest2(int r, PVector center){
  float tolerance = 3;
  stroke(0);
  ArrayList<PVector> points = new ArrayList<PVector>();
  noFill();
  beginShape();
  beginContour();
  for(int i = 0; i<361; i+=1){
    float x = r * cos(radians(i)) + center.x + random(-tolerance, tolerance);
    float y = r * sin(radians(i)) + center.y + random(-tolerance, tolerance);
    points.add(new PVector(x, y));
    curveVertex(x, y);
  }
  endContour();
  endShape();
  
}
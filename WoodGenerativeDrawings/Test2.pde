void drawCurvyCircle(){
  background(255);
  int r = height/2 - 50;
  PVector center = new PVector(width/2, height/2);
  float tolerance = 5;
  stroke(0);
  ArrayList<PVector> points = new ArrayList<PVector>();
  
  beginShape();
  beginContour();
  for(int i = 0; i<361; i++){
    float x = r * cos(radians(i)) + center.x + random(-tolerance, tolerance);
    float y = r * sin(radians(i)) + center.y + random(-tolerance, tolerance);
    points.add(new PVector(x, y));
    vertex(x, y);
  }
  endContour();
  endShape();
  
  //for(int i =0; i<points.size()-1; i++){
  //  line(points.get(i).x, points.get(i).y, points.get(i+1).x, points.get(i+1).y);
  //}
  //line(points.get(0).x, points.get(0).y, points.get(points.size()-1).x, points.get(points.size()-1).y);

}
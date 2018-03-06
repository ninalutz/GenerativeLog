int nLines = 500;
int nLines2 = 300;
Line[] l;
Particle[] attractors;
int numAttractors = 4;


/*=======================*/


void setup() {
  size(500, 500);
  
  colorMode(HSB); 
  strokeWeight(1.5);
  noFill();
  
  initialize();
}


/*=======================*/


void draw() {
  background(255);
  
  
  // interact lines with attractors
  float radius = 75*cos(frameCount/200.);
  for(int i = 0; i < l.length; i++) {
    l[i].interact(radius, attractors[0].pos.x, attractors[0].pos.y);
    l[i].interact(-radius, attractors[1].pos.x, attractors[1].pos.y);
    l[i].interact(radius, attractors[2].pos.x, attractors[2].pos.y);
    l[i].interact(-radius, attractors[3].pos.x, attractors[3].pos.y);
    l[i].display();  // display lines
  }
  
  // move attractors
  fill(255);
  
  for(int i =0; i<numAttractors; i++){
       attractors[i].update();  
  }
  //attractors[0].update();  
  //attractors[1].update();
  //attractors[2].update();  
  //attractors[3].update();
  
}


/*=======================*/

void initialize() {
  // Create Lines
  l = new Line[nLines];
  for(int i = 0; i < l.length; i++) {
    float col = 100*(i%2+1);
    l[i] = new Line(5 + 10*i, col);
  }
  
  // Create Attractors
  attractors = new Particle[numAttractors];
  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Particle(random(width), random(height));
    float angle = random(TWO_PI);
    attractors[i].vel.set(cos(angle), sin(angle), 0);
  }
}


/*=======================*/


void mousePressed() {
  initialize();   
}


/*=======================*/


class Line {
  ArrayList<Particle> p;
  color col;
  int nPoints = 200;
  
  Line(int y, float c) {
    p = new ArrayList<Particle>();
    for (int i = 0; i < nPoints; i++) {
      p.add(new Particle(2+5*i, y));
    }
    
    col = color(c);
  }
  
  /*-------*/
  
  void display() {  // display line
    stroke(col);
    beginShape();
    strokeWeight(.5);
    for (int i = 0; i < p.size(); i++) {
      curveVertex(p.get(i).pos.x, p.get(i).pos.y);
    }
    
    strokeWeight(.5);
    for (int i = 0; i < p.size(); i+=2) {
      curveVertex(p.get(i).pos.x, p.get(i).pos.y + 2);
    }
    
    strokeWeight(.5);
    for (int i = 0; i < p.size(); i+=2) {
      curveVertex(p.get(i).pos.x, p.get(i).pos.y + 1);
    }
    
    //strokeWeight(.5);
    //for (int i = 0; i < p.size(); i++) {
    //  curveVertex(p.get(i).pos.x, p.get(i).pos.y + 3);
    //}
    
    strokeWeight(.5);
    for (int i = 0; i < p.size(); i++) {
      curveVertex(p.get(i).pos.x, p.get(i).pos.y + 4);
    }
    
    endShape();
  }
  
  /*-------*/
  
  void interact(float radius, float mx, float my) {  // interact line with attractor
    for (int i = 0; i < p.size(); i++) {
      p.get(i).interact(radius, mx, my);      
    }
    
    //change size of the line when necessary
    for (int i = 0; i < p.size()-1; i++) {
      float d = dist(p.get(i).pos.x, p.get(i).pos.y, p.get(i+1).pos.x, p.get(i+1).pos.y);
      if (d > 5) {  // add a new point when two neighbor points are too far apart
        float x = (p.get(i).pos.x + p.get(i+1).pos.x) / 2;
        float y = (p.get(i).pos.y + p.get(i+1).pos.y) / 2;
        p.add(i+1, new Particle(x, y));
      } else if (d < 1) {  // remove a point when 2 neighbor points are too close
        p.remove(i);
      }
    }   
  }
}


/*=======================*/


class Particle {
  PVector pos, vel, acc;
  
  Particle(float x, float y) {
    pos = new PVector(x, y, 0);
    vel = new PVector(0, 0, 0);
    acc = new PVector(0, 0, 0);
  }
  
  /*-------*/
  
  void interact(float r0, float x, float y) {  // interact points with attractors
    float sign = r0/abs(r0);
    r0 = abs(r0);
    
    float r = dist(pos.x, pos.y, x, y);
    float angle = atan2(pos.y-y, pos.x-x);
    
    if (r <= r0) {
      float radius = 0.5*sign*(r0-r)/r0;
      vel.set(radius*cos(angle), radius*sin(angle));
    } else {
      vel.set(0, 0);
    }
    
    pos.add(vel);
  }
  
  /*-------*/
  
  void update() {  // move attractors
    //change direction sometimes
    if (random(1) > 0.97) {
      float angle = random(-PI, PI);
      acc.set(cos(angle), sin(angle), 0);
      
      float mod = PVector.angleBetween(acc, vel);
      mod = map(mod, 0, PI, 0.1, 0.001);
      acc.mult(mod); 
    }
    
    // update
    vel.add(acc);
    vel.limit(1.5); 
    pos.add(vel);
    
    // check edges
    pos.x = (pos.x + width)%width;
    pos.y = (pos.y + height)%height;
    for(int i =50; i>0; i-=3){
      fill(0, 0, 0, 20);
      stroke(0, 0, 0);
      //ellipse(pos.x, pos.y, i*2, i);
    }
  }
}
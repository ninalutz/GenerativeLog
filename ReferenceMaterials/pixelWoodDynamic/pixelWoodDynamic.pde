float aspectRatio = 1;
float hueoffset = 0.0;
boolean doDraw = true;
boolean clearAndStart = false;
float scale = 5;
int i =0;

void setup() {
  size(800,600);
  colorMode(RGB,1,1,1,1);
}


void draw () {
  background(255, 255, 255);
  shade();
  frameRate(5);
}


void keyPressed(){
  if(key == 'e'){
    saveFrame("wood" + i + "_2_" + hour() + minute() + second() + ".png");
    println("SAVED");
  }
  if(key == CODED){
    if(keyCode == LEFT){
      i-=1;
      noiseSeed(i);
      println("regenerated at i = ", i);
    }
    if(keyCode == RIGHT){
      i+=1;
      noiseSeed(i);
      println("regenerated at i = ", i);
    }
    if(keyCode == UP){
      aspectRatio += 1;
      noiseSeed(i);
    }
    if(keyCode == DOWN){
      aspectRatio -=1;
      noiseSeed(i);
    }
  }
}

public void shade() {
  loadPixels();
  PVector coord = new PVector();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      coord.x = (float)x + 0.5f;
      coord.y = (float)y + 0.5f;
      color c = mainImage(coord);
      int idx = (x+(width*y));
      pixels[idx] = c;
    }
  }
  
  updatePixels();
}

public color mainImage(PVector coord) {
  float x = coord.x / width - .5;
  float y = (coord.y / height) * (aspectRatio) - (aspectRatio*.5);
  x *= scale;
  y *= scale;

  float c1 = 0.06;
  float c2 = 0.01;
  float c3 = 0.00;
  float c4 = 0.092;
  float c5 = 0.083;
  float c6 = 0.0;
  
    float v1 = noise(x, y);
    float v2 = noise((c1+x), (c2+y));
    float v12 = noise(v1, v2);
    float v21 = noise(v2, v1);
    float va = noise((c3+ x)*v12, (c4+y)*v12);
    float vb = noise((c5+ x)*v21, (c6+y)*v21);
    float v = noise(vb*20, va*20);
    v12 += hueoffset;
    if (v12 > 1) v12 -=1;
    return color(v);  

}
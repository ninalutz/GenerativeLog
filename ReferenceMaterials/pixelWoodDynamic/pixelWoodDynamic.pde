float aspectRatio = 4;
float hueoffset = 0.0;
boolean doDraw = true;
boolean clearAndStart = false;
float scale = 5;
int i = 16;
int a = 1;

float c1, c2, c3, c4, c5, c6;

void setup() {
  int h = displayHeight*2;
  size(displayHeight, displayHeight);
  //size(2000, 2000);
  colorMode(RGB,1,1,1,1);
  
  c1 = 0.06; 
  c2 = 0.01;
  c3 = 0.00;
  c4 = 0.092;
  c5 = 0.083;
  c6 = 0.0;
  
}


void draw () {
  background(255, 255, 255);
  shade();
  //println("HELO");
  //shade2();
  //a += 1;
  c1 += .01;
  c2 += .02;
  c3 += .02;
  c4 += .005;
  c5 += .5;
  c6 += .0001;
}


void keyPressed(){
  c1 = 0.06; 
  c2 = 0.01;
  c3 = 0.00;
  c4 = 0.092;
  c5 = 0.083;
  c6 = 0.0;
  
  if(key == 'e'){
    saveFrame("wood" + i + "_2_" + hour() + minute() + second() + ".png");
    println("SAVED");
  }
  if(key == CODED){
    if(keyCode == LEFT){
      i-=1;
      noiseSeed(i);
      println("regenerated at i = ", i, "aspect ratio :", aspectRatio);
    }
    if(keyCode == RIGHT){
      i+=1;
      noiseSeed(i);
      println("regenerated at i = ", i, "aspect ratio :", aspectRatio);
    }
    if(keyCode == UP){
      aspectRatio += 1;
      noiseSeed(i);
      println("regenerated at i = ", i, "aspect ratio :", aspectRatio);
    }
    if(keyCode == DOWN){
      aspectRatio -=1;
      noiseSeed(i);
      println("regenerated at i = ", i, "aspect ratio :", aspectRatio);
    }
  }
}

public void shade() {
  loadPixels();
  PVector coord = new PVector();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      coord.x = (float)x + .5;
      coord.y = (float)y + .5;
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
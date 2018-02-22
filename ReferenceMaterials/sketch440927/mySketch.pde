// BasedOn
// http://www.iquilezles.org/www/articles/warp/warp.htm
// e sul funzionamento di shadertoy (vedi tutorial https://www.shadertoy.com/view/Md23DV) 

float aspectRatio = 1;
float hueoffset = 0.0;
boolean doDraw = true;
bollean clearAndStart = false;
float scale = 5;
void setup() {
  size(800,600);
//  colorMode(RGB,1,1,1,1);
  colorMode(HSB,1,1,1,1);
}


void draw () {
  aspectRatio = ((float)height/(float)width);
  // Kool kaat peer
  if (doDraw) {
    shade();
    doDraw = false;
  } else if (clearAndStart) {
    background(0);
    doDraw=true;
    clearAndStart = false;
  }
}

void mouseClicked() {
  // randomSeed((long)random(100000));
  noiseSeed();
  hueoffset = random(1.0);
  scale = random(3,10);
  clearAndStart = true;
  background(0);
}

public void shade() {
  loadPixels();
  PVector coord = new PVector();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      coord.x = (float)x + 0.5f;
      coord.y = (float)y + 0.5f;
      coord.z = 1.0;
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
    float v2 = noise((0.052+x), (0.013+y));
    float v12 = noise(v1, v2);
    float v21 = noise(v2, v1);
    float va = noise((0.017+ x)*v12, (0.092+y)*v12);
    float vb = noise((0.083+ x)*v21, (0.028+y)*v21);
    //float va = noise((1.7)*v12*0.02, (9.2)*v12*0.02);
    //float vb = noise((8.3)*v21*0.02, (2.8)*v21*0.02);
    float v = noise(vb*20, va*20);
    v12 += hueoffset;
    if (v12 > 1) v12 -=1;
    return color(v12,v21,v,1);  

}
float mx;
float my;
float pmx;
float pmy;
float xOff = 0;
int symmetry = 6;
float angle = TWO_PI/symmetry;

ArrayList<Walker> walkers;

void setup(){
  background(255);
  size(650, 650);
  translate(width/2, height/2);
  
  walkers = new ArrayList<Walker>();

}

void keyPressed(){
  walkers.add(new Walker());
}

void draw(){
  push();
  translate(width/2, height/2);
  
  mx = mouseX - width/2;
  my = mouseY - height/2;
  pmx = pmouseX - width/2;
  pmy = pmouseY - height/2;
  
  
  if (mousePressed){  
    for (int i = 0; i < symmetry; i++){
      rotate(angle);
      int r = int(map(noise(xOff), 0, 1, 0, 255));
      int g = int(map(noise(xOff + 1000), 0, 1, 0, 255));
      int b = int(map(noise(xOff + 2000), 0, 1, 0, 255));
      stroke(r, g, b, 100);
      paint();
    }
  }
  
    for (int i = 0; i < symmetry; i++){
    rotate(angle);
    for (Walker w : walkers){
      w.show();
      w.update();
      push();
      scale(-1, 1);
      w.show();
      w.update();
      pop();
    }
  }
  
  pop();
  xOff += 0.1;
}

void paint(){

    float d = abs(dist(pmx, pmy, mx, my));
    float sw = abs(map(d, 0, 20, 10, 1));
    if (sw > 10) sw = 10;
    strokeWeight(sw);
    line(mx, my, pmx, pmy);
    push();
    scale(-1, 1);
    line(mx, my, pmx, pmy);
    pop();
    
    
}

class Walker{
  
  float diameter;
  float xOff, yOff;
  PVector pos;
  
  Walker(){
    xOff = random(0, 10000);
    yOff = xOff + 1000;
    pos = new PVector(map(noise(xOff), 0, 1, -width/2, width/2), map(noise(yOff), 0, 1, -height/2, height/2));
    diameter = map(noise(xOff), 0, 1, 0, 30); 

    
  }
  
  void show(){
    int r = int(map(noise(xOff), 0, 1, 0, 255));
    int g = int(map(noise(xOff + 1000), 0, 1, 0, 255));
    int b = int(map(noise(xOff + 2000), 0, 1, 0, 255));
    noStroke();
    fill(r, g, b, 100);
    ellipse(pos.x, pos.y, diameter, diameter);
    
  }
  
  void update(){
    pos.x = map(noise(xOff), 0, 1, -width/2, width/2);
    pos.y = map(noise(yOff), 0, 1, -height/2, height/2);
    diameter = map(noise(xOff), 0, 1, 0, 30); 
    
    xOff += 0.001;
    yOff += 0.001;
  }
  
}

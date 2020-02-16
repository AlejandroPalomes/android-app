Maxim maxim;
AudioPlayer player;

int numQuadrats = 50;
int numCercles = 50;

Quadrats[] quadrat = new Quadrats[numQuadrats]; //generem un array d'objectes de la clase Quadrats
float[] colorQR = new float[numQuadrats];
float[] colorQG = new float[numQuadrats];
float[] colorQB = new float[numQuadrats];



Cercles[] cercle = new Cercles[numCercles]; //generem un array d'objectes de la clase Cercles
float[] colorCR = new float[numCercles];
float[] colorCG = new float[numCercles];
float[] colorCB = new float[numCercles];


void setup(){
  
  size(640, 960);
  smooth();
  
  maxim = new Maxim(this);
  
  player = maxim.loadFile("166181__keinzweiter__alienicer.wav");
  
  player.setLooping(false);
  
  for (int i = 0; i < numQuadrats; i++) {
    
    quadrat[i] = new Quadrats();
    
    colorQR[i] = random(100, 255);
    colorQG[i] = random(100, 255);
    colorQB[i] = random(100, 255);
  }
  
  for (int i = 0; i < numCercles; i++) {
    
    cercle[i] = new Cercles(); 
    
    colorCR[i] = random(100, 255);
    colorCG[i] = random(100, 255);
    colorCB[i] = random(100, 255);
  }
  
}

void draw(){
  
  background(0);
  
    for (int i = 0; i< numQuadrats; i++) {
    
    quadrat[i].update();
    quadrat[i].dibuixar();
  }
  
  for (int i = 0; i< numCercles; i++) {
    
    cercle[i].update();
    cercle[i].dibuixar();
  }
  
}


void mouseDragged(){
  
  //cridem les funcions de les clases per a cada objecte de forma independent
  /*for (int i = 0; i< numQuadrats; i++) {
    
    quadrat[i].update();
    quadrat[i].dibuixar();
  }
  
  for (int i = 0; i< numCercles; i++) {
    
    cercle[i].update();
    cercle[i].dibuixar();
  }*/
  
  player.play();
  player.ramp(1., 1000);
  
  float red = map(mouseX, 0, width, 0, 255);
  float green = map(mouseY, 0, height, 0, 255);
  float blue = map(mouseX, 0, height, 0, 255);
  
  /*float red2 = map(mouseX, 0, width, 0, 255);
  float green2 = map(mouseY, 0, height, 0, 255);
  float blue2 = map(mouseX, 0, height, 255, 0);
  
  float red3 = map(mouseX, 0, width, 0, 255);
  float green3 = map(mouseY, 0, height, 0, 255);
  float blue3 = map(mouseX, 0, height, 255, 0);*/
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float speed2 = dist(pmouseX, pmouseY, mouseX, mouseY);
  speed = constrain(speed, 0, 10);
  speed2 = constrain(speed, 0, 20);
  speed2 = map(speed, 0, 20, 0, 4);
  float alpha = map(speed, 0, 20, 0, 50);
  
  //fons
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  
  float lineWidth = map (speed, 0, 10, 10,5);
  
  stroke(red, green, blue);
  strokeWeight(lineWidth);
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  player.volume(speed2);
}
  
  
  void mouseReleased(){
    
    player.stop();
  }


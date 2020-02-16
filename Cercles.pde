////Les anotacions de cada linea estan fetes en la clase Quadrats, que es la primera que he fet, i aquesta es una copia canviant noms i ellipse.

class Cercles {
  
  //declarem uns vectors
  
  PVector location2;      
  PVector velocity2;      
  PVector acceleracio2;   
  float velMaxima2;
  
  
  Cercles() {
    
    location2 = new PVector (random(width), random(height));
    velocity2 = new PVector(0, 0);
    velMaxima2 = 4;
    
  }
  
  
  void update(){
    
    PVector mouse2 = new PVector(mouseX, mouseY);
    PVector dir2 = PVector.sub(mouse2, location2);
    dir2.normalize();
    dir2.mult(2);
    acceleracio2 = dir2;
    
    velocity2.add(acceleracio2);
    velocity2.limit(velMaxima2);
    location2.add(velocity2);
  }
  
  void dibuixar(){
    
    noStroke();
    fill(255, 0, 0, 60);
    ellipse(location2.x, location2.y, 20, 20);
    
  }
  
}

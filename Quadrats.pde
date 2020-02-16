class Quadrats {
  
  //declarem uns vectors
  
  PVector location;      //vector que determina la posició dels cuadrats/cercles
  PVector velocity;      // vector que fara moure l'objecte
  PVector acceleracio;   //vector que es genera entre la posicio del objecte i el mouse, amb el que fem l'efecte de gravetat
  float velMaxima;       //determinem la magnitut maxima del PVector acceleracio
  
  
  Quadrats(){
    
    //com a propietats, assignem valors als PVectors i al float
    location = new PVector (random(width), random(height));
    velocity = new PVector(0, 0);
    velMaxima = 10;
    
  }
  
  
  void update(){
    
    PVector mouse = new PVector(mouseX, mouseY); //enmagatzemem la posició del mouse en un vector
    PVector dir = PVector.sub(mouse, location); // amb la info de la posicio del mouse i la posició del objecte, els restem i trobem el vector que ens genera la "gravetat" cap al mouse
    dir.normalize(); //fem k la magnitud del vector dir no sigui massa gran, sino podria anar tan rapid que apareixeria instantaniament a la posicio del mouse
    dir.mult(2);   //Reescalem el vector
    acceleracio = dir; //assignem el vector dir al vector acceleracio
    
    velocity.add(acceleracio);  //afegim al vector velocity (0,0) el vector acceleració. Com que aquest vector varia depenent de la posició del objecte respecte mouse, quan esta lluny es mes rapid, i quan esta aprop va mes lent, es com fer la suma/resta de dos variables, si una de elles canvia, el resultat tambe canvia
    velocity.limit(velMaxima);   //limitem la velocitat
    location.add(velocity);    //finalment afegim la velocitat a la posicio del objecte. FINALMENT ES MOURA COM SI EL MOUSE TINGUES GRAVETAT!!!!!
  }
  
  void dibuixar(){
    
    noStroke();
    fill(255, 255, 0, 60);
    rect(location.x, location.y, 20, 20);
    
  }
  
}

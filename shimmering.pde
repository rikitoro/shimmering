
int count = 0;

final int d = 10;

Bee[][] bees;
ArrayList<Bond> bonds;

void setup() {
  surface.setResizable(true);
  surface.setSize((int)(NX + COS60 * NY) * d, (int) (SIN60 * NY + 1) * d);
  
  // randomSeed(3141);
  
 
  // for gif animation
  //smooth();
  //frameRate(30);



  // init bees
  bees = new Bee[NX][NY];
  for (int i = 0; i < NX; i++) {
    for (int j = 0; j < NY; j++) {
      bees[i][j] = new Bee(State.INACTIVE); 
    }
  }
  
  // init bonds (triangular lattice, absorbing boundary)
  bonds = new ArrayList<Bond>();
  for (int i = 0; i < NX; i++) {
    for (int j = 0; j < NY; j++) {
      if (i + 1 < NX) {
        bonds.add(new Bond(bees[i][j], bees[i + 1][j]));
      }
      if (j + 1 < NY) {
        bonds.add(new Bond(bees[i][j], bees[i][j + 1]));
      }
      if (0 <= i - 1 && j + 1 < NY) {
        bonds.add(new Bond(bees[i][j], bees[i - 1][j + 1]));
      }
    }
  }
}

void draw() {
  
  for (int i = 0; i < NX; i++) {
    for (int j = 0; j < NY; j++) {
      Bee bee = bees[i][j];
      drawBee(i, j, bee);
    }
  }
  
  //drawWasp(0, NY/2);

  // for gif animation
  //if (frameCount <= 1000) {
  //  saveFrame("frames/####.png");
  //}
  
  //bees[0][NY/2].threatened();
  transition();
  update();
  
  //delay(10);
  count++;
} 

void transition() {
  // one-body 
  for (int i = 0; i < NX; i++) {
    for (int j = 0; j < NY; j++) {
      bees[i][j].transition();
    }
  }
  
  //two-boby
  for (Bond bond : bonds) {
    bond.interact();
  }
}

void update() {
  for (int i = 0; i < NX; i++) {
    for (int j = 0; j < NY; j++) {
      bees[i][j].update();
    }
  }
} 

////////////////////////////////////////////////

void drawBee(int i, int j, Bee bee) {
  noStroke();
  fill(beeColor(bee));
  circle((i + COS60 * j) * d + 0.5 * d, j * SIN60 * d + 0.5 * d, 0.7 * d);
}

color beeColor(Bee bee) {
  if (bee.get_state() == State.ACTIVE) {
    return color(255, 69, 0); // orangered
  } else if (bee.get_state() == State.REFRACTORY) {
    return color(255, 255, 0);
  } else {
    return color(128, 128, 128);
  }
}

void drawWasp(int i, int j) {
  noStroke();
  fill(color(0, 0, 0));
  circle((i + COS60 * j) * d + 0.5 * d, j * SIN60 * d + 0.5 * d, 0.5 * d);
}

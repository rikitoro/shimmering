
int cols = 50;
int rows = 50;

int r = 5;

int count = 0;

Bee[][] hive;



void setup() {
  surface.setResizable(true);
  surface.setSize(2 * rows * r, 2 * cols * r);
  //smooth();
  //frameRate(10);

  //
  hive = new Bee[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      hive[i][j] = new Bee(State.INACTIVE, false); 
    }
  }
  
  // set Wasp
  hive[0][rows/2].set_wasp(true);
  
  // set neighbers
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (i + 1 < cols) {
        hive[i][j].add_neighber(hive[i + 1][j]);
      }
      if (0 <= i - 1) {
        hive[i][j].add_neighber(hive[i - 1][j]);
      }
      if (j + 1 < rows) {
        hive[i][j].add_neighber(hive[i][j + 1]);
      }
      if (0 <= j - 1) {
        hive[i][j].add_neighber(hive[i][j - 1]);
      }
    }
  }
  //
}

void draw() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int nx = 2 * j + 1;
      int ny = 2 * i + 1;
      fill(beeColor(hive[i][j]));
      noStroke();
      circle(r * nx, r * ny, 2 * r);
    }
  }
  
  //if (frameCount <= 1000) {
  //  saveFrame("frames/####.png");
  //}
  prepare();
  update();
  
  //delay(10);
  count++;
} 

void prepare() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      hive[i][j].prepare();
    }
  }
}

void update() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      hive[i][j].update();
    }
  }
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

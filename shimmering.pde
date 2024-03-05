
int cols = 50;
int rows = 50;

int r = 5;

int count = 0;

Bee[][] hive;



void setup() {
  surface.setResizable(true);
  final int w = 2 * rows * r;
  final int h = 2 * cols * r;
  surface.setSize(w, h);

  //
  hive = new Bee[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      hive[i][j] = new Bee(State.INACTIVE, false); 
    }
  }
  // set neighbers
  for (int i = 1; i < cols - 1; i++) {
    for (int j = 1; j < rows - 1; j++) {
      hive[i][j].add_neighber(hive[(i + 1 + cols) % cols][j]);
      hive[i][j].add_neighber(hive[(i - 1 + cols) % cols][(j + 1 + rows) % rows]);
      hive[i][j].add_neighber(hive[i][(j + 1 + rows) % rows]);
      hive[i][j].add_neighber(hive[i][(j - 1 + rows) % rows]);      
    }
  }
  //
}

void draw() {
  //println("count = %d", count);
  //for (int i = 0; i < cols; i++) {
  //  for (int j = 0; j < rows; j++) {
  //    if (hive[i][j].get_state() == State.ACTIVE) {
  //      print("A");
  //    } else if (hive[i][j].get_state() == State.REFRACTORY) {
  //      print("o");
  //    } else {
  //      print(".");
  //    }
  //  }
  //  println("");
  //}
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int nx = 2 * j + 1;
      int ny = 2 * i + 1;
      fill(beeColor(hive[i][j]));
      noStroke();
      circle(r * nx, r * ny, 2 * r);
    }
  }
  prepare();
  update();
  
  delay(20);
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

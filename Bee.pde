
class Bee {
  // state transition prob.
  final float p_AR = 0.6;
  final float p_RI = 0.1;
  final float p_IA = 0.001;
  final float p_T  = 0.4;
  final float p_W  = 0.9;
  
  // state
  State state;
  State new_state;
  // wasp
  boolean wasp = false;
  
  // neighber bees
  ArrayList<Bee> neighbers = new ArrayList<Bee>();
  
  
  // constructor
  public Bee(State state, boolean wasp) {
    this.state = state;
    this.new_state = state;
    this.wasp = wasp;
  }
  
  public void add_neighber(Bee bee) {
    neighbers.add(bee);
  }

  // getter
  public State get_state() {
    return this.state;
  }
  
  // wasp here
  public void set_wasp(boolean wasp) {
    this.wasp = wasp;
  }
  
  
  // helper functions
  
  private void trial(float p, State next_state) {
    if (random(0, 1) < p) {
      this.new_state = next_state;
    }
  }

  private void trial_from_I() {
    // trial(p_W, State.ACTIVE);
    for (Bee b : neighbers) {
      if (b.get_state() == State.ACTIVE) {
        trial(p_T, State.ACTIVE);
      }
    }
    trial(p_IA, State.ACTIVE);

  }
  
  // prepare
  public void prepare() {
    this.new_state = this.state;
    
    if (this.state == State.ACTIVE) {
      trial(p_AR, State.REFRACTORY);
    } else if (this.state == State.REFRACTORY) {
      trial(p_RI, State.INACTIVE);
    } else {
      trial_from_I();
    } 
  }
  
  // update
  public void update() {
    this.state = this.new_state;
  }

  
}

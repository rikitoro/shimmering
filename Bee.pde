
class Bee {

  // state
  State state;
  State new_state;
    
  // constructor
  public Bee(State state) {
    this.state = state;
    this.new_state = state;
  }

  // getter
  public State get_state() {
    return this.state;
  }
    
  // setter
  public void set_new_state(State new_state) {
    this.new_state = new_state;
  }

  // trasition its state by self
  public void transition() {
    if        (this.state == State.ACTIVE) {
      trial(P_AR, State.REFRACTORY);
    } else if (this.state == State.REFRACTORY) {
      trial(P_RI, State.INACTIVE);
    } else /* (this.state == State.INACTIVE)*/ {
      trial(P_IA, State.ACTIVE);
    }
  }

  public void threatened() {
    if (this.state == State.INACTIVE) {
      trial(P_W, State.ACTIVE);
    }
  }


  // update state
  public void update() {
    this.state = this.new_state;
  }

  // helper functions
  
  private void trial(float p, State next_state) {
    if (pval() < p) {
      this.new_state = next_state;
    }
  }  
}

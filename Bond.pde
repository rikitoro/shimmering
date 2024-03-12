class Bond {
  Bee bee1;
  Bee bee2;
  
  public Bond(Bee bee1, Bee bee2) {
    this.bee1 = bee1;
    this.bee2 = bee2;
  }

  
  public void interact() {
    if (bee1.get_state() == State.ACTIVE && bee2.get_state() == State.INACTIVE) {
      trial(P_T, State.REFRACTORY, State.ACTIVE);
    }

    if (bee1.get_state() == State.INACTIVE && bee2.get_state() == State.ACTIVE) {
      trial(P_T, State.ACTIVE, State.REFRACTORY);
    }
    
  }


  // helper function
  
  private void trial(float p, State new_state1, State new_state2) {
    if (pval() < p) {
      bee1.set_new_state(new_state1);
      bee2.set_new_state(new_state2);
    }
  }


}

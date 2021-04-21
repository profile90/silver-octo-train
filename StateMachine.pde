
class StateMachine {

  public final int STAY = 0;
  public final int NEXT = 1;
  public final int BACK = 2;


  int states[][] = new int[5][3];
  int current;



  StateMachine() {
    init();
  }

  void determineNextState(int direction) {
    
    current = states[current][direction];
   
    if (state.current != -1) {
      track.song.loop();
    }
    if (state.current == 0)
    {
      track.song.pause();
    }
  }

  void drawControls() {
  }

  public void draw() {
    background(0);
    pushStyle();
    strokeWeight(0.5);
    noFill();
    stroke(42, 0, 25);
    //translate(-width/2, height/2,  200);
    rotateX(radians(70));
    terrain.drawGrid();

    popStyle();
  }


  private void init() {
    current = 0;
    // stay
    states[0][0] = 0;
    states[1][0] = 1;
    states[2][0] = 2;
    states[3][0] = 3;
    states[4][0] = 4;
    // next
    states[0][1] = 1;
    states[1][1] = 2;
    states[2][1] = 3;
    states[3][1] = 4;
    states[4][1] = 0;
    // back
    states[0][2] = 0;
    states[1][2] = 0;
    states[2][2] = 1;
    states[3][2] = 2;
    states[4][2] = 3;
  }
}

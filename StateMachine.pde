
class StateMachine {

  public final int STAY = 0;
  public final int NEXT = 1;
  public final int BACK = 2;


  PFont font;

  int states[][] = new int[5][3];
  int current;

  boolean mouseIsOverLeftBox;
  boolean mouseIsOverRightBox;

  StateMachine() {
    font = createFont("zendots.ttf", 32);
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

    mouseIsOverLeftBox = mouseX >= 788 && mouseX <= 907 && mouseY >= 963 && mouseY <= 1004;
    mouseIsOverRightBox = mouseX >= 1016 && mouseX <= 1130 && mouseY >= 963 && mouseY <= 1004;



    translate(width/2, height/2);
    pushStyle();
    strokeWeight(4);
    stroke(42, 0, 25);


    //System.out.println(mouseX + ":" + mouseY);
    translate(0, 400, 30);
    translate(-100, 0, 0); 
    noFill();
    if (state.current != 0) {       
      if (mouseIsOverLeftBox) {
        stroke(255, 10, 186);
      }
      box(100, 20, 40);
    }  



    translate(+200, 0, 0);
    stroke(42, 0, 25);
    if (mouseIsOverRightBox) {
      stroke(255, 10, 186);
    }
    box(100, 20, 40);

    popStyle();
    translate(-100, 0, 0);
    translate(0, -400, -30);
    translate(-width/2, -height/2);
  }

  public void draw() {

    pushStyle();
    strokeWeight(0.5);
    noFill();
    stroke(42, 0, 25);

    terrain.drawGrid();
    textSize(64);
    String simulate = "Simulate your music, feel the sound..";
    textAlign(CENTER);
    stroke(255, 10, 186);
    fill(255, 10, 186);

    text(simulate, width/2, height/2);

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

import ddf.minim.*;

PShader shift;
PShader chroma;
Minim minim;
AudioPlayer sample;
Terrain terrain;
MusicTrack track;
Circle circle;
LineWaves line;
StateMachine state;

void setup() {
  size(1920, 1080, P3D);

  state = new StateMachine();
  shift = loadShader("shift.glsl");
  
  background(0);
  frameRate(60);
  smooth();

  track = new MusicTrack("v_cyberpunk2077.mp3", 2048, new Minim(this));
  
  terrain = new Terrain(20);
  circle = new Circle();
  line = new LineWaves();
}


void draw() {
  
  
  System.out.println(state.current);
  switch(state.current) {
    case 1:
      circle.draw();
      break;
    case 2:
      terrain.draw();
      break;
    case 3:
      line.draw();
      break;
    case 4:
      state.draw(); //make something cool.
      break;
    case 0:
    default:
      state.draw();
  }
  
  state.drawControls();
 
  filter(shift); 
}
void mouseWheel() {
  state.determineNextState(state.BACK);
}

void mousePressed() {
  state.determineNextState(state.NEXT);
  
}

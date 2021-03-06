import ddf.minim.*;

PShader shift;
PShader chroma;
Minim minim;
AudioPlayer sample;
Terrain terrain;
MusicTrack track;
Circle circle;
Box box;
LineWaves line;
StateMachine state;

void setup() {
  size(1920, 1080, P3D);

  state = new StateMachine();
  shift = loadShader("shift.glsl");
  
  background(0);
  frameRate(60);
  smooth();

  track = new MusicTrack("song.mp3", 2048, new Minim(this));
  
  terrain = new Terrain(20);
  circle = new Circle();
  line = new LineWaves();
  box = new Box();
}


void draw() {
  background(0);
  state.drawControls();

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
      box.draw(); //make something cool.
      break;
    case 0:
    default:
      state.draw();
  }
  

 
 
  filter(shift); 
}

void mousePressed() {

  
  if(state.mouseIsOverRightBox) {
    state.determineNextState(state.NEXT);
  }
  
  if(state.mouseIsOverLeftBox) {
   state.determineNextState(state.BACK);    
  }
}

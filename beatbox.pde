import ddf.minim.*;

PShader shift;
Minim minim;
AudioPlayer sample;
Terrain terrain;
MusicTrack track;
Circle circle;
LineWaves line;
void setup() {
  size(1920, 1080, P3D);
  shift = loadShader("shift.glsl");
  background(0);
  frameRate(60);
  smooth();
  track = new MusicTrack("v_cyberpunk2077.mp3", 2048, new Minim(this));
  
  terrain = new Terrain(20);
  circle = new Circle();
  line = new LineWaves();
  
  

  /*
  minim = new Minim(this);
   sample = minim.loadFile("v_cyberpunk2077.mp3");
   sample.play();
   */
}


void draw() {

  terrain.draw();
  //circle.draw();  
  //line.draw();
  /*
  background(0);
   stroke(255, 10, 186);
   strokeWeight(1);
   
   for(int i = 0; i < height / 60; i++) {
   line(0, i * 60, width, i * 60);
   }
   for(int i = 0; i < width / 60; i++) {
   line(i * 60, 0, i * 60, height);
   }
   
   translate(width / 2, height / 2);
   scale(1, 2);
   
   rotate(-PI / 4);
   strokeWeight(2);
   stroke(255, 10, 186);
   noFill();
   beginShape();
   float f = 300;
   float left[] = sample.left.toArray();
   for(int i = 0; i < sample.bufferSize() - 10; i++) {
   System.out.println(left[i]);
   float x1 = left[i];
   float x2 = left[i + 10];
   curveVertex((x1) * f, (x2) * f);
   }
   
   endShape();
   */
    filter(shift);
}

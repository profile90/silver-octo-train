import ddf.minim.*;
import ddf.minim.analysis.*;

class Terrain {

  int scale;
  int w; 
  int h;
  int cols, rows;

  float flying = 0;
  float speed = 0.05;

  float[] samples;
  float[][] terrain;

  Terrain(int scale) {
    this.scale = scale;
    this.w = width;
    this.h = height;



    rows = h / scale;
    cols = w / scale;

    terrain = new float[cols][rows];
  }
  /*
  float calculateZOffset(float xoff, float yoff) {
   return map(noise(xoff, yoff), 0, 1, -100, 100);
   }
   */
  float calculateZOffset(float xoff, float yoff) {

    return map(noise(xoff, yoff), 0, 1, -3, 3);
  }

  void calculateTerrain() {
    
    
    
    track.fft.forward(track.song.mix);
    
    
    
    flying -= speed;    
    samples = track.getSamples();
    
    
    float yoff = flying;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = (track.fft.getBand(x) / 5 * ( x / 10 + calculateZOffset(xoff, yoff))) + (track.fft.getBand(y) / 5 * ( y / 10 + calculateZOffset(xoff, yoff))); 
        xoff += 0.1;
      }
      yoff +=0.1;
    }
  }


  int r = 0;
  void draw() {
    this.calculateTerrain();
    background(0);
    stroke(255, 10, 186);
    noFill();
       
    translate( width / 2, height / 2 - 100);
    rotateX(PI / 3);
    translate(-this.w / 2, -this.h / 2); 

    for (int y = 0; y < rows - 1; y++) {
      beginShape(LINES);
      for (int x = 0; x < cols; x++) {
        vertex(x * scale, y * scale, terrain[x][y]);
        vertex(x * scale, (y + 1) * scale, terrain[x][y + 1]);
      }
      endShape();
    }

  }
}

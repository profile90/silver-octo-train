


class LineWaves {

  void setup() {
    filter(BLUR, 10);  
  }


  void draw() {

    track.beat.detect(track.song.mix);

    translate(0, height/2);   
    rotateX(radians(70));
    
    background(0);
    
    
    
    strokeWeight(2);
    fill(0);
    stroke(255, 10, 186);
    for (int i = 0; i < track.song.bufferSize(); i++) {      
      
      point(i, track.song.left.get(i) * 100  + height/4);
      point(i, track.song.right.get(i) * 100 + height/3);
      
    }
    strokeWeight(0.5);
    noFill();
    stroke(42, 0, 25);
    translate(0, 0, 200);
    terrain.drawGrid();
    
  }
}

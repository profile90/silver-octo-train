

class Circle {
  float r2 = 350;
  void draw() {
    track.beat.detect(track.song.mix);

    translate(width/2, height/2);
    rotateX(radians(70));

    background(0);
    stroke(255, 10, 186);
    strokeWeight(2);
    fill(0);



    beginShape(POINTS);

    for (int i = 0; i < track.song.bufferSize(); i++) {
      
      float r = map(track.song.mix.get(i), -1, 1, 100, 500);
      float x1 = r * cos(i);
      float y1 = r * sin(i);

      vertex(x1, y1, 1);
    }


    endShape();

    if (track.beat.isOnset() || track.beat.isKick() || track.beat.isSnare() || track.beat.isHat()) {
      r2 = 400;
    }

    beginShape(POINTS);
    for (int i = 0; i < track.song.bufferSize(); i++) {
      float x2 = r2 * cos(i); 
      float y2 = r2 * sin(i);
      vertex(x2, y2, 1);
    }
    endShape();


    if (r2 > 0 && r2 < 100) {
      r2 += 0.1;
    } 
    else 
    {
      if (r2 > 100) {
        r2 *= 0.98;
      }
    }
    
    pushStyle();
    strokeWeight(0.5);
    noFill();
    stroke(42, 0, 25);
    translate(-width/2, 0, 200);
    terrain.drawGrid();
    popStyle();
  }
}

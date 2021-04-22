
class Box {


  
 float angle = 0;
  
  void draw() {
    
    angle += 0.1;
    track.fft.forward(track.song.mix);
    
    translate(width/2, height/2);
    stroke(255, 10, 186);
    strokeWeight(0.2);
    noFill();
    
    rotateX(radians(angle));
    rotateY(radians(angle));
    for (int i = 0; i < track.song.bufferSize(); i += 10) {

      box(i / 5);
      rotateZ(radians(map(track.song.mix.get(i), -100, 100, -360, 360)));
      rotateY(radians(map(track.song.mix.get(i), -100, 100, -360, 360)));
      rotateX(radians(map(track.song.mix.get(i), -100, 100, -360, 360)));

     
    }

  
  }


}

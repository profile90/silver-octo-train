import ddf.minim.*;
import ddf.minim.analysis.*;

class MusicTrack {

  int sampleRate;
  Minim minim;
  AudioPlayer song;
  float[] sample;
  BeatDetect beat;
  FFT fft;

  MusicTrack(String path, int sampleRate, Minim minimObject) {
    minim = minimObject;
    song = minim.loadFile(path, sampleRate);
    this.sampleRate = sampleRate;
    song.loop();
    beat = new BeatDetect();
    fft = new FFT(song.bufferSize(), song.sampleRate()); 
  }
  
  float[] getSamples() {
    return track.song.mix.toArray();
  }
}

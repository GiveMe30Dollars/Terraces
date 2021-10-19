import com.hamoid.*;

int frameLimit;
VideoExport export;

void recordStart(int fL_, String name){
  recordStart(fL_, name, 60);
}

void recordStart(int fL_, String name, int fR_){
  frameLimit = fL_;
  export = new VideoExport(this, name);
  export.setFrameRate(fR_);
  export.startMovie();
}

void recordUpdate(){
  print("RECORDING:    "+frameCount + "     " + frameRate + "\n");
  export.saveFrame();
  if(frameLimit <= 0) return;
  if (frameCount >= frameLimit){
    export.endMovie();
    noLoop();
  }
}

void recordEnd(){
  print("FORCE END.");
  export.endMovie();
  noLoop();
}

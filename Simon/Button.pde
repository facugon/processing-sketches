
class SimonButton {
  Tone tone ;
  Hotpoint trigger ;
  SimonGame simon ;
  
  boolean isPushed=false;

  SimonButton(SimonGame simon, int x, int y, int z, int aSize, color aColor, Tone aTone)
  {
    this.trigger = new Hotpoint(x, y, z, aSize, aColor);
    this.tone = aTone;
    this.simon = simon ;
  }

  SimonButton push() {
    try {
      isPushed = true;
      this.trigger.push();
      this.tone.play(this);
    }
    catch (Exception e) { // We don't care about this
    }
    return this;
  }

  boolean isPushed() {
    return isPushed;
  }

  boolean wasPushed() {
    return this.trigger.wasHit;
  }

  void release() {
    isPushed = false;
    this.trigger.release();
    simon.releaseButton();
  }

  void draw() {
    this.trigger.draw();
  }
}


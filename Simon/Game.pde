

class SimonGame extends StateMachine {

  int lvl = 0;
  SimonButton[] buttons = new SimonButton[4];
  int[] sequense = new int[100] ; // max lvl 100
  SimonButton curButton = null ;
  int curIndexSequense = -1;

  SimonGame()
  {
    this.setup() ;
  }

  SimonGame emptySequense() {
    for (int i=0;i<100;i++) { // initialize sequense array
      this.sequense[i] = 0;
    }

    return this;
  }

  SimonGame setup()
  {
    this.emptySequense();

    this.buttons[0] = new SimonButton (this, 150, 250, 100, 100, color(0, 0, 255), new Tone(250) );
    this.buttons[1] = new SimonButton (this, 350, 250, 100, 100, color(0, 255, 0), new Tone(350) );
    this.buttons[2] = new SimonButton (this, 150, 500, 100, 100, color(255, 0, 0), new Tone(450) );
    this.buttons[3] = new SimonButton (this, 350, 500, 100, 100, color(255, 0, 255), new Tone(550) );

    return this;
  }

  SimonGame draw()
  {
    for (int i=0;i<this.buttons.length;i++)
    {
      this.buttons[i].draw();
    }
    return this;
  }

  SimonGame createLevelSequense() {
    for (int i=0;i<this.lvl;i++) {
      this.sequense[i] = (int) random(this.buttons.length);
    }
    return this;
  }

  boolean isSimonTurn() {
    return curIndexSequense != -1 && curIndexSequense < this.lvl; // is playing the sequense
  }

  void releaseButton() {
    // now increase the button sequese to play the next
    this.curIndexSequense++;
    this.curButton=null ;
  }

  void pushButton() {
    int btnId = this.sequense[ this.curIndexSequense ];
    if ( ! this.buttons[ btnId ].isPushed() && this.curButton == null )
    {
      this.curButton = this.buttons[ btnId ] ;
      this.buttons[ btnId ].push();
    }
  }

  void playSequense()
  {
    if ( this.curIndexSequense == this.lvl ) // all sequense was played
    {
      this.curIndexSequense = -1 ;
      return ; // player turn
    }
    this.pushButton();
  }

  void checkUserInput() {
  }

  SimonGame nextRandomLevel() // not using state machine
  {
    if ( lvl < 100 )
    {
      println("next lvl : " + lvl );
      lvl++;
      emptySequense();
      createLevelSequense();

      curIndexSequense = 0 ;
    }
    else println("game over");

    return this;
  }
}




class Simon extends StateMachine {

  int MAX_LVL = 100 ;

  int lvl = 0;
  ArrayList<SimonButton> buttons  = new ArrayList();
  ArrayList<SimonButton> sequense = new ArrayList() ;

  SimonButton curButton = null ;
  int curIndexSequense = -1;
  int curPlayerSequense = -1;

  Simon() {
    this.setup() ;
  }

  Simon emptySequense() {
    sequense.clear();
    return this;
  }


  Simon setup()
  {
    this.emptySequense();

    this.buttons.add( new SimonButton ("1", this, 150, 250, 100, 100, color(  0, 0, 255), new Tone(250) ) );
    this.buttons.add( new SimonButton ("2", this, 350, 250, 100, 100, color(  0, 255, 0), new Tone(350) ) );
    this.buttons.add( new SimonButton ("3", this, 150, 500, 100, 100, color(255, 0, 0), new Tone(450) ) );
    this.buttons.add( new SimonButton ("4", this, 350, 500, 100, 100, color(255, 0, 255), new Tone(550) ) );

    Collections.shuffle(this.buttons);
    return this;
  }

  Simon draw()
  {
    for (int i=0; i<this.buttons.size(); i++)
    {
      this.buttons.get(i).draw();
    }
    return this;
  }

  Simon createLevelSequense()
  {
    randomSeed( new Date().getTime() );

    ArrayList<SimonButton> tmp = new ArrayList();

    if ( this.lvl != 1 )
    {
      for (int i=0; i<buttons.size();i++)
      {
        SimonButton btn    = buttons.get(i);
        SimonButton lvlBtn = this.sequense.get(this.lvl - 2);

        if ( btn != lvlBtn )
          tmp.add( btn );
      }
      this.sequense.add( tmp.get((int)random(this.buttons.size()-1)) );
    }
    else this.sequense.add( this.buttons.get((int)random(this.buttons.size())) );

    return this;
  }

  void releaseButton()
  {
    // now increase the button sequese to play the next
    this.curIndexSequense++;

    if ( ! this.isSimonTurn() )
    {
      this.curIndexSequense = -1 ;
      this.curPlayerSequense = 0 ;
    }

    this.curButton=null ;
  }

  void pushButton()
  {
    SimonButton btn = this.sequense.get( this.curIndexSequense );

    if ( ! btn.isPushed() && this.curButton == null )
    {
      println("push btn : " + btn.name + " -> " + btn );
      this.curButton = btn ;
      btn.push();
    }
  }

  void playSequense()
  {
    if ( this.curIndexSequense == this.lvl ) // all sequense was played
    {
      this.curPlayerSequense = 0 ;
      return ; // player turn
    }
    else this.pushButton();
  }

  void checkUserInput() {
  }

  Simon nextRandomLevel() // not using state machine
  {
    if ( lvl < MAX_LVL )
    {
      lvl++;
      curIndexSequense = 0 ;

      println("lvl : " + lvl );
      createLevelSequense();
    }
    else {
      println("game over");
      exit();
    }

    return this;
  }

  boolean isPlayerTurn() {
    return curPlayerSequense != -1 && curPlayerSequense < this.lvl ; // player is playing
  }

  boolean isSimonTurn() {
    return curIndexSequense != -1 && curIndexSequense < this.lvl; // is playing the sequense
  }

  void checkPlayerSequense()
  {
  }
}


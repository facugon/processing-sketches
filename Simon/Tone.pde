
import java.nio.channels.*;
import java.nio.*;
import javax.sound.sampled.*;

public class Tone {

  AudioFormat audioFormat;
  AudioInputStream audioInputStream;
  SourceDataLine sourceDataLine;

  //Allowable 8000,11025,16000,22050,44100  
  float sampleRate = 16000.0F;
  //Allowable 8,16
  int sampleSizeInBits = 16;
  //Allowable 1,2
  int channels = 1;
  //Allowable true,false
  boolean signed = true;
  //Allowable true,false
  boolean bigEndian = true;  

  byte[] audioData = new byte[16000*4]; // two seconds of monaural (one-channel) data or one second of stereo (two-channel) data.

  Tone(double aFreq) {
    new SynGen(aFreq).getSyntheticData(audioData); // like a factory method. get the synsound data
  }

  class SynGen {
    ByteBuffer byteBuffer;
    ShortBuffer shortBuffer;
    int byteLength;
    double freq ;

    SynGen(double aFreq) {
      this.freq = aFreq;
    }

    void getSyntheticData(byte[] synDataBuffer)
    {
      byteBuffer = ByteBuffer.wrap(synDataBuffer);
      shortBuffer = byteBuffer.asShortBuffer();

      byteLength = synDataBuffer.length;

      tones();
      /**
       stereoPanning();
       stereoPingpong();
       fmSweep();
       decayPulse();
       echoPulse();
       waWaPulse();
       */
    } //end getSyntheticData method

    void tones() {
      channels = 1;//Java allows 1 or 2
      int bytesPerSamp = 2;
      sampleRate = 16000.0F;// Allowable 8000,11025,16000,22050,44100

      double modi1 = 1.8 ;
      double modi2 = 1.5 ;
      double time ;
      double sinValue ;

      int sampLength = byteLength/bytesPerSamp;
      for (int cnt = 0; cnt < sampLength; cnt++) {
        time = cnt/sampleRate;
        sinValue = (
        Math.sin(2*Math.PI * freq * time) + 
          Math.sin(2*Math.PI * (freq/modi1) * time) + 
          Math.sin(2*Math.PI * (freq/modi2) * time)
          ) / 3.0;

        shortBuffer.put((short)(16000*sinValue));
      }//end for loop
    }//end method tones
  }//end inner class SynGen
  //=============================================//

  class Player {
    //This is a working buffer used to transfer
    // the data between the AudioInputStream and
    // the SourceDataLine.
    // The size is rather arbitrary.
    byte playBuffer[] = new byte[16384];
    
    void play() {
      try {
        //Open and start the SourceDataLine
        sourceDataLine.open(audioFormat);
        sourceDataLine.start();

        int cnt;
        long startTime = new Date().getTime(); // Get beginning of elapsed time for playback

        // Transfer the audio data to the speakers
        while ( (cnt = audioInputStream.read (playBuffer, 0, playBuffer.length)) != -1) {
          //Keep looping until the input read
          // method returns -1 for empty stream.
          if (cnt > 0) {
            // Write data to the internal buffer of
            // the data line where it will be
            // delivered to the speakers in real
            // time
            sourceDataLine.write(playBuffer, 0, cnt);
          }//end if
        }//end while

        // Block and wait for internal buffer of the SourceDataLine to become empty.
        sourceDataLine.drain();

        //Get and display the elapsed time for the previous playback.
        int elapsedTime = (int)(new Date().getTime() - startTime);
        println("elapsed time " + elapsedTime);

        //Finish with the SourceDataLine
        sourceDataLine.stop();
        sourceDataLine.close();
      }
      catch (Exception e) {
        e.printStackTrace();
        System.exit(0);
      }//end catch
    }
  }

  class ListenThread extends Thread {
    SimonButton listener;
    
    ListenThread addListener(SimonButton btn){
      listener = btn;
      return this;
    }
    
    public void run() {
      new Player().play();
      this.listener.release();
    }//end run
  }//end inner class ListenThread
  //=============================================//

  void play(SimonButton button) { // hardcoded listener
    try {
      InputStream byteArrayInputStream = new ByteArrayInputStream(audioData);

      audioFormat = new AudioFormat(
      sampleRate, 
      sampleSizeInBits, 
      channels, 
      signed, 
      bigEndian);

      audioInputStream = new AudioInputStream(
        byteArrayInputStream, 
        audioFormat, 
        audioData.length/audioFormat.
        getFrameSize()
      );

      DataLine.Info dataLineInfo = new DataLine.Info(SourceDataLine.class, audioFormat);

      //Geta SourceDataLine object
      sourceDataLine = (SourceDataLine) AudioSystem.getLine(dataLineInfo);

      ListenThread lThread = new ListenThread();
      lThread.addListener(button).start();
    } 
    catch (Exception e) {
    }
  }
}


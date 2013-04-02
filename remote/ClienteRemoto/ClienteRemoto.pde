import processing.net.*; 
Client myClient;

String inString;
int dataIn;
byte interesting = 10;

void setup() { 
  size (300, 100);
  background(0); 
  myClient = new Client(this, "127.0.0.1", 10001);
  myClient.write("bigote=hola");
} 

void draw()
{
  if (myClient.available() > 0)
  {
    inString = myClient.readString(); 
    println("[cli] server : " + inString);
  }
}


void keyPressed() {

  if (key >= 'a' && key <= 'z') {
    myClient.write("bigote="+key);
  }
}


void disconnectEvent(Client someClient) {
  
}

void stop()
{
  myClient.write("bigote=chau");
  myClient.stop();
}

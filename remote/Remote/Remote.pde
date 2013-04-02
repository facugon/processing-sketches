import processing.net.*;
Server myServer;

int port=10001;

void setup() {
  size(200, 200);
  background(0);
  
  myServer = new Server(this, port); 
  println("[srv] server started");
}

boolean handshake(String msg)
{
  // msg format : bigote=ble
      if( msg != null && msg.split("=")[0].equals("bigote") )
        return true;
       else return false;
}

void getMsg()
{
   // Get the next available client
  Client aClient = myServer.available();
  
  // If the client is not null, and says something, display what it said
  if (aClient != null)
  {
    String msg = aClient.readString();
    if ( handshake(msg) )
    {
        println("[srv] " + aClient.ip() + " : " + msg);
    }
  }
  checkClients(myServer.clients);
}

void checkClients(Client[] clients)
{
  /* 
  println(clients);
 
  for(Client cli : clients)
  {
    if(cli != null)
     println(cli);
  }
  */
}

void draw() {
      // does not accept more connections. onyl talk to the connected client
    getMsg();    
   
}

void serverEvent(Server aServer, Client aClient)
{
  println("Client connected " + aClient.ip());
/*
mantengo solo una coneccion , porque la mierda de processing
no tiene un puto metodo para desconectar clientes que
cierran la conexion. desconecto los clientes viejos, uso solo el ultimo
*/
  for(Client cli : aServer.clients)
  {
    if(cli != null && cli != aClient)
     aServer.disconnect(cli);
  }
}


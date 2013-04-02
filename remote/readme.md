ProcessingServerClient
======================

Basic Server and Client .

There are two Processing sketchs in this project .

The server accepts one connection, and wait for a client message . 
ignore those messages which does not has the correct handshaking .

If there is a new connection disconnect the current connected client.(until client disconnect detection is implemented)

    The client read keys and send it to the server.

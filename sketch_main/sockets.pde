import processing.net.*;

Client client;
Boolean client_connected = false;

Boolean ConnectClient(){
  if (!client_connected){
    client = new Client(this, "192.168.0.105", 8889);
    client_connected = client.active();
    event_log.Append("Client connected with "+((client_connected)?("Success."):("Failure")));
  }
  return client_connected;
}

Boolean DisconnectClient(){
  if (client.active()){
    client.stop();
    client_connected = client.active();
    event_log.Append("Client disconnected with "+((!client_connected)?("Success."):("Failure")));
  }
  return !client_connected;
}

void clientEvent(Client someClient) {
  String dataIn;
  
  dataIn = someClient.readString();
  event_log.Append("Server :: "+dataIn);
    
}

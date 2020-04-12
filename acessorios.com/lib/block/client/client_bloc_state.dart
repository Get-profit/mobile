enum ClientState {IDLE,LOADING,ERROR,DONE}

class ClientBlocState{

  ClientBlocState(this.state, {this.errorMessage});
  ClientState state;
  String errorMessage;
}
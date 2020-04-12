enum ServiceOrderState {IDLE,LOADING,ERROR,DONE}

class ServiceOrderBlocState{

  ServiceOrderBlocState(this.state, {this.errorMessage});
  ServiceOrderState state;
  String errorMessage;
}
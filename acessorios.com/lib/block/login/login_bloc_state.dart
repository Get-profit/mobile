enum LoginState {IDLE,LOADING,ERROR,DONE}

class LoginBlocState{

  LoginBlocState(this.state, {this.errorMessage});
  LoginState state;
  String errorMessage;
}
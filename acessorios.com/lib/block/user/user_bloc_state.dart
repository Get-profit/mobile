enum UserState {IDLE,LOADING,ERROR,DONE}

class UserBlocState{

    UserBlocState(this.state, {this.errorMessage});
  UserState state;
  String errorMessage;
}
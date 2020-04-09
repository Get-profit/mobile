import 'package:get_profit/block/field_state.dart';
import 'package:get_profit/block/button_state.dart';
import 'package:get_profit/block/login/login_bloc_state.dart';
import 'package:get_profit/validators/login_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with LoginValidator{

  final BehaviorSubject<LoginBlocState> _stateController = BehaviorSubject<LoginBlocState>.seeded(LoginBlocState(LoginState.IDLE));
  final BehaviorSubject<String> _loginController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  Function(String) get changeLogin => _loginController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Stream<LoginBlocState> get outState => _stateController.stream;

  Stream<FieldState> get outLogin => Rx.combineLatest2(_loginController.stream.transform(loginValidator), outState, (a,b){
    a.enabled = b.state != LoginState.LOADING;
    return a;
  });
  Stream<FieldState> get outPassword =>Rx.combineLatest2(_passwordController.stream.transform(passwordValidator), outState, (a,b){
    a.enabled = b.state != LoginState.LOADING;
    return a;
  });

  Stream<ButtonState> get outLoginButton => Rx.combineLatest3(
      outLogin, outPassword, outState, (a,b,c){
      return ButtonState(
        loading: c.state == LoginState.LOADING,
        enabled: a.error == null && b.error == null && c.state != LoginState.LOADING
      );
  }
  );


  void login() async{
    _stateController.add(LoginBlocState(LoginState.LOADING));
    await Future.delayed(Duration(seconds: 3));
    _stateController.add(LoginBlocState(LoginState.DONE));
  }


  void dispose(){
    _stateController.close();
    _loginController.close();
    _passwordController.close();
  }

}
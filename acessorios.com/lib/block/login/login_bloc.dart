import 'package:get_profit/block/field_state.dart';
import 'package:get_profit/validators/login_validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with LoginValidator{

  final BehaviorSubject<String> _loginController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  Function(String) get changeLogin => _loginController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  Stream<FieldState> get outLogin => _loginController.stream.transform(loginValidator);
  Stream<FieldState> get outPassword => _loginController.stream.transform(passwordValidator);
  void dispose(){
    _loginController.close();
    _passwordController.close();
  }

}
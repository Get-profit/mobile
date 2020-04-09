import 'package:get_profit/block/field_state.dart';
import 'package:get_profit/validators/user_validator.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc with UserValidator{

  final BehaviorSubject<String> _loginController = BehaviorSubject<String>();
  final BehaviorSubject<String> _cargoController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  Function(String) get changeLogin => _loginController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeCargo => _loginController.sink.add;


  Stream<FieldState> get outLogin => _loginController.stream.transform(loginValidator);
  Stream<FieldState> get outPassword => _passwordController.stream.transform(passwordValidator);
  Stream<FieldState> get outCargo => _cargoController.stream.transform(cargoValidator);

  void dispose(){
    _loginController.close();
    _passwordController.close();
    _cargoController.close();
  }

}
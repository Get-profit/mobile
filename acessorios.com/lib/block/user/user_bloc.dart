import 'package:get_profit/block/field_state.dart';
import 'package:get_profit/block/user/user_bloc_state.dart';
import 'package:get_profit/http/webclients/client_webclient.dart';
import 'package:get_profit/http/webclients/user_webclient.dart';
import 'package:get_profit/models/usuario.dart';
import 'package:get_profit/validators/user_validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:get_profit/block/button_state.dart';

class UserBloc with UserValidator{


  final BehaviorSubject<UserBlocState> _stateController = BehaviorSubject<UserBlocState>.seeded(UserBlocState(UserState.IDLE));
  final BehaviorSubject<String> _loginController = BehaviorSubject<String>();
  final BehaviorSubject<String> _cargoController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  Function(String) get changeLogin => _loginController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeCargo => _cargoController.sink.add;
  Stream<UserBlocState> get outState => _stateController.stream;

  Stream<FieldState> get outLogin => Rx.combineLatest2(_loginController.stream.transform(loginValidator), outState, (a,b){
    a.enabled = b.state != UserState.LOADING;
    return a;
  });

  Stream<FieldState> get outPassword =>  Rx.combineLatest2(_passwordController.stream.transform(passwordValidator), outState, (a,b){
    a.enabled = b.state != UserState.LOADING;
    return a;
  });
  Stream<FieldState> get outCargo => Rx.combineLatest2(_cargoController.stream.transform(cargoValidator), outState, (a,b){
    a.enabled = b.state != UserState.LOADING;
    return a;
  });

  Stream<ButtonState> get outUserButton => Rx.combineLatest4(
      outLogin, outPassword, outCargo,outState, (a,b,c,d){
    return ButtonState(
        loading: d.state == UserState.LOADING,
        enabled: a.error == null && b.error == null && c.error == null && d.state != UserState.LOADING
    );
  }
  );

  UserWebClient _webClient = UserWebClient();

  void save(User user) async{
    _stateController.add(UserBlocState(UserState.LOADING));
    print("usuarios");
    print(user);
    if(user.id == 0){
      _webClient.save(user).then((users)async {
        if(users != null){
          await Future.delayed(Duration(seconds: 3));
          _stateController.add(UserBlocState(UserState.DONE));
        }else{
          _stateController.add(UserBlocState(UserState.ERROR));
        }
      });
    }else{
      //COLOCAR AQUI METODO ALTERAR
      _stateController.add(UserBlocState(UserState.DONE));
    }

  }

  void dispose(){
    _stateController.close();
    _loginController.close();
    _passwordController.close();
    _cargoController.close();
  }

}
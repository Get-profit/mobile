import 'dart:async';
import 'package:get_profit/block/field_state.dart';

class UserValidator{

  final StreamTransformer<String,FieldState> loginValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (login, sink){
    const Pattern pattern = r"^(?=.*[A-Za-z0-9]$)[A-Za-z][A-Za-z\d.-]{0,19}$";
    final RegExp regex = RegExp(pattern);
    if(login.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }else if(!regex.hasMatch(login))
      sink.add(FieldState(error: "Login inválido"));
    else
      sink.add(FieldState());
  });

  final StreamTransformer<String,FieldState> passwordValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (password, sink){

    if(password.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }
    else
      sink.add(FieldState());
  });


  final StreamTransformer<String,FieldState> cargoValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (cargo, sink){

    if(cargo.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }
    else
      sink.add(FieldState());
  });



}
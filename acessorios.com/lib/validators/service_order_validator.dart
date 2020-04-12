import 'dart:async';
import 'package:get_profit/block/field_state.dart';

class ServiceOrderValidator{

  final StreamTransformer<String,FieldState> clienteValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (nome, sink){
    const Pattern pattern = r"^[aA-zZ]+((\s[aA-zZ]+)+)?$";
    final RegExp regex = RegExp(pattern);
    if(nome.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }else if(!regex.hasMatch(nome))
      sink.add(FieldState(error: "Nome inválido"));
    else
      sink.add(FieldState());
  });

  final StreamTransformer<String,FieldState> generalValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (general, sink){
    if(general.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }
    else
      sink.add(FieldState());
  });






}
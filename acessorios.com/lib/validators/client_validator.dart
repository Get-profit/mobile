import 'dart:async';
import 'package:get_profit/block/field_state.dart';

class ClientValidator{

  final StreamTransformer<String,FieldState> nomeValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (nome, sink){
    const Pattern pattern = r"^[aA-zZ]+((\s[aA-zZ]+)+)?$";
    final RegExp regex = RegExp(pattern);
    if(nome.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }else if(!regex.hasMatch(nome))
      sink.add(FieldState(error: "Nome inválido"));
    else
      sink.add(FieldState());
  });

  final StreamTransformer<String,FieldState> cepValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (cep, sink){

    if(cep.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }else if(cep.length <10){
      sink.add(FieldState(error: "CEP Inválido"));
    }
    else
      sink.add(FieldState());
  });

  final StreamTransformer<String,FieldState> emailValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (email, sink){
    const Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    if(email.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }else if(!regex.hasMatch(email))
      sink.add(FieldState(error: "Email inválido"));
    else
      sink.add(FieldState());
  });

  final StreamTransformer<String,FieldState> cpfValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (cpf, sink){
    if(cpf.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }else if(cpf.length < 14)
      sink.add(FieldState(error: "CPF inválido"));
    else
      sink.add(FieldState());
  });

  final StreamTransformer<String,FieldState> rgValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (rg, sink){
    if(rg.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }else if(rg.length > 8)
      sink.add(FieldState(error: "RG inválido"));
    else
      sink.add(FieldState());
  });
  final StreamTransformer<String,FieldState> telefoneValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (telefone, sink){
    const Pattern pattern = r'^(\(?\d{2}\)?\s)?(\d{4,5}\-\d{4})';
    final RegExp regex = RegExp(pattern);
    if(telefone.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }else if(!regex.hasMatch(telefone))
      sink.add(FieldState(error: "Telefone inválido"));
    else
      sink.add(FieldState());
  });

  final StreamTransformer<String,FieldState> numeroValidator = StreamTransformer<String,FieldState>.fromHandlers(handleData: (numero, sink){
    if(numero.isEmpty){
      sink.add(FieldState(error: "Campo Obrigatório"));
    }
    else
      sink.add(FieldState());
  });






}
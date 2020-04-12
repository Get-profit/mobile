import 'package:get_profit/block/client/client_bloc_state.dart';
import 'package:get_profit/block/field_state.dart';
import 'package:get_profit/block/user/user_bloc_state.dart';
import 'package:get_profit/http/webclients/client_webclient.dart';
import 'package:get_profit/http/webclients/user_webclient.dart';
import 'package:get_profit/models/cliente.dart';
import 'package:get_profit/models/usuario.dart';
import 'package:get_profit/validators/client_validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get_profit/block/button_state.dart';
import 'package:get_profit/block/cep_bloc.dart';

class ClientBloc with ClientValidator{


  final BehaviorSubject<ClientBlocState> _stateController = BehaviorSubject<ClientBlocState>.seeded(ClientBlocState(ClientState.IDLE));
  final BehaviorSubject<String> _nomeController = BehaviorSubject<String>();
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _cpfController = BehaviorSubject<String>();
  final BehaviorSubject<String> _telefoneController = BehaviorSubject<String>();
  final BehaviorSubject<String> _rgController = BehaviorSubject<String>();
  final BehaviorSubject<String> _numeroController = BehaviorSubject<String>();


  Function(String) get changeNome => _nomeController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeCPF => _cpfController.sink.add;
  Function(String) get changeRG => _rgController.sink.add;
  Function(String) get changeNumero => _numeroController.sink.add;
  Function(String) get changeTelefone => _telefoneController.sink.add;
  Stream<ClientBlocState> get outState => _stateController.stream;

  Stream<FieldState> get outNome => Rx.combineLatest2(_nomeController.stream.transform(nomeValidator), outState, (a,b){
    a.enabled = b.state != UserState.LOADING;
    return a;
  });

  Stream<FieldState> get outEmail=>  Rx.combineLatest2(_emailController.stream.transform(emailValidator), outState, (a,b){
    a.enabled = b.state != UserState.LOADING;
    return a;
  });
  Stream<FieldState> get outCPF => Rx.combineLatest2(_cpfController.stream.transform(cpfValidator), outState, (a,b){
    a.enabled = b.state != UserState.LOADING;
    return a;
  });

  Stream<FieldState> get outRG => Rx.combineLatest2(_rgController.stream.transform(rgValidator), outState, (a,b){
    a.enabled = b.state != UserState.LOADING;
    return a;
  });

  Stream<FieldState> get outTelefone => Rx.combineLatest2(_telefoneController.stream.transform(telefoneValidator), outState, (a,b){
    a.enabled = b.state != UserState.LOADING;
    return a;
  });

  Stream<FieldState> get outNumero => Rx.combineLatest2(_numeroController.stream.transform(numeroValidator), outState, (a,b){
    a.enabled = b.state != UserState.LOADING;
    return a;
  });


  Stream<ButtonState> get outClientButton => Rx.combineLatest7(
      outNome, outEmail, outCPF,outRG,outNumero,outTelefone,outState, (a,b,c,d,e,f,g){
    return ButtonState(
        loading: g.state == UserState.LOADING,
        enabled: a.error == null && b.error == null && c.error == null && d.error == null && e.error == null && f.error == null && g.state != UserState.LOADING
    );
  }
  );

  ClienteWebClient _webClient = ClienteWebClient();

  void save(Cliente client) async{
    _stateController.add(ClientBlocState(ClientState.LOADING));
    await Future.delayed(Duration(seconds: 3));
    if(client == null){
      _webClient.save(client).then((users) {
        if(users != null){
          _stateController.add(ClientBlocState(ClientState.DONE));
        }else{
          _stateController.add(ClientBlocState(ClientState.ERROR));
        }
      });
    }else{
      //COLOCAR AQUI METODO ALTERAR
      _stateController.add(ClientBlocState(ClientState.DONE));
    }

  }

  void dispose(){
    _stateController.close();
    _emailController.close();
    _nomeController.close();
    _cpfController.close();
    _telefoneController.close();
    _rgController.close();
    _numeroController.close();
  }

}
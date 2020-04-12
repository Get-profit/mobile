import 'package:get_profit/block/client/client_bloc_state.dart';
import 'package:get_profit/block/field_state.dart';
import 'package:get_profit/block/service/service_bloc_state.dart';
import 'package:get_profit/block/user/user_bloc_state.dart';
import 'package:get_profit/http/webclients/service_webclient.dart';
import 'package:get_profit/models/servico.dart';
import 'package:get_profit/validators/service_order_validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get_profit/block/button_state.dart';

class ServiceOrderBloc with ServiceOrderValidator{


  final BehaviorSubject<ServiceOrderBlocState> _stateController = BehaviorSubject<ServiceOrderBlocState>.seeded(ServiceOrderBlocState(ServiceOrderState.IDLE));
  final BehaviorSubject<String> _clienteController = BehaviorSubject<String>();
  final BehaviorSubject<String> _valorController = BehaviorSubject<String>();
  final BehaviorSubject<String> _marcaController = BehaviorSubject<String>();
  final BehaviorSubject<String> _modeloController = BehaviorSubject<String>();
  final BehaviorSubject<String> _defeitoController = BehaviorSubject<String>();
  final BehaviorSubject<String> _descricaoController = BehaviorSubject<String>();


  Function(String) get changeCliente => _clienteController.sink.add;
  Function(String) get changeValor => _valorController.sink.add;
  Function(String) get changeMarca => _marcaController.sink.add;
  Function(String) get changeModelo => _modeloController.sink.add;
  Function(String) get changeDefeito => _defeitoController.sink.add;
  Function(String) get changeDescricao => _descricaoController.sink.add;
  Stream<ServiceOrderBlocState> get outState => _stateController.stream;

  Stream<FieldState> get outCliente => Rx.combineLatest2(_clienteController.stream.transform(clienteValidator), outState, (a,b){
    a.enabled = b.state != ServiceOrderState.LOADING;
    return a;
  });

  Stream<FieldState> get outValor =>  Rx.combineLatest2(_valorController.stream.transform(generalValidator), outState, (a,b){
    a.enabled = b.state != ServiceOrderState.LOADING;
    return a;
  });
  Stream<FieldState> get outMarca => Rx.combineLatest2(_marcaController.stream.transform(generalValidator), outState, (a,b){
    a.enabled = b.state != ServiceOrderState.LOADING;
    return a;
  });

  Stream<FieldState> get outModelo => Rx.combineLatest2(_modeloController.stream.transform(generalValidator), outState, (a,b){
    a.enabled = b.state != ServiceOrderState.LOADING;
    return a;
  });

  Stream<FieldState> get outDefeito => Rx.combineLatest2(_defeitoController.stream.transform(generalValidator), outState, (a,b){
    a.enabled = b.state != ServiceOrderState.LOADING;
    return a;
  });

  Stream<FieldState> get outDescricao => Rx.combineLatest2(_descricaoController.stream.transform(generalValidator), outState, (a,b){
    a.enabled = b.state != ServiceOrderState.LOADING;
    return a;
  });


  Stream<ButtonState> get outServiceButton => Rx.combineLatest7(
      outCliente, outValor, outMarca,outModelo,outDefeito,outDescricao,outState, (a,b,c,d,e,f,g){
    return ButtonState(
        loading: g.state == ServiceOrderState.LOADING,
        enabled: a.error == null && b.error == null && c.error == null && d.error == null && e.error == null && f.error == null && g.state != ServiceOrderState.LOADING
    );
  }
  );

  ServiceOrderWebClient _webClient = ServiceOrderWebClient();

  void save(ServicesOrder servicesOrder) async{
    _stateController.add(ServiceOrderBlocState(ServiceOrderState.LOADING));
    await Future.delayed(Duration(seconds: 3));
    if(servicesOrder == null){
      _webClient.save(servicesOrder).then((users) {
        if(users != null){
          _stateController.add(ServiceOrderBlocState(ServiceOrderState.DONE));
        }else{
          _stateController.add(ServiceOrderBlocState(ServiceOrderState.ERROR));
        }
      });
    }else{
      //COLOCAR AQUI METODO ALTERAR
      _stateController.add(ServiceOrderBlocState(ServiceOrderState.DONE));
    }

  }

  void dispose(){
    _stateController.close();
    _modeloController.close();
    _descricaoController.close();
    _clienteController.close();
    _valorController.close();
    _defeitoController.close();
    _marcaController.close();
  }

}
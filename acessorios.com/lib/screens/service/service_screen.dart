import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_profit/block/field_state.dart';
import 'package:get_profit/block/service/service_bloc.dart';
import 'package:get_profit/components/input.dart';
import 'package:get_profit/components/service_button.dart';
import 'package:get_profit/models/servico.dart';
import 'package:get_profit/screens/client/cliente_screen.dart';
import 'package:get_profit/screens/user/user_screen.dart';
import 'package:brasil_fields/brasil_fields.dart';

class ServiceScreen extends StatelessWidget {

  ServiceScreen({this.servico});
  final ServicesOrder servico;
  TextEditingController _cliente = TextEditingController();
  TextEditingController _valor = TextEditingController();
  TextEditingController _marca = TextEditingController();
  TextEditingController _modelo = TextEditingController();
  TextEditingController _defeito = TextEditingController();
  TextEditingController _descricao = TextEditingController();
  ServiceOrderBloc _serviceBloc = ServiceOrderBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ORDEM SERVIÇOS", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body:
      ListView(
        padding: EdgeInsets.only(top: 20),
        children: <Widget>[
          Center(
              child: Container(
                  width: 350,
                  child: Card(
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.green),
                    ),
                    elevation: 0,
                    color: Colors.transparent,
                    child: Form(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 12,),
                              StreamBuilder<FieldState>(
                                stream: _serviceBloc.outCliente,
                                initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    decoration:InputDecorationAcessorios().input("NOME",snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    keyboardType: TextInputType.text,
                                    onChanged: _serviceBloc.changeCliente,
                                    enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: _serviceBloc.outValor,
                                  initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _valor,
                                      decoration:InputDecorationAcessorios().input("VALOR",snapshot.data.error),
                                      style: TextStyle(color: Colors.green),
                                      keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly,
                                      RealInputFormatter(),
                                    ],
                                    onChanged: _serviceBloc.changeValor,
                                    enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: _serviceBloc.outMarca,
                                  initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _marca,
                                      decoration:InputDecorationAcessorios().input("MARCA",snapshot.data.error),
                                      style: TextStyle(color: Colors.green),
                                      keyboardType: TextInputType.number,
                                    onChanged: _serviceBloc.changeMarca,
                                    enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: _serviceBloc.outModelo,
                                  initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _modelo,
                                      decoration: InputDecorationAcessorios().input("MODELO",snapshot.data.error),
                                      style: TextStyle(color: Colors.green),
                                      keyboardType: TextInputType.number,
                                      onChanged: _serviceBloc.changeModelo,
                                      enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: _serviceBloc.outDefeito,
                                  initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _defeito,
                                    decoration: InputDecorationAcessorios().input("DEFEITO",snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                    onChanged: _serviceBloc.changeDefeito,
                                    enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: _serviceBloc.outDescricao,
                                  initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _descricao,
                                    decoration: InputDecorationAcessorios().input("DESCRIÇÃO",snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                    onChanged: _serviceBloc.changeDescricao,
                                    enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              ServiceOrderButton(_serviceBloc,servico)
                            ],
                          ),
                        )),
                  ))
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_profit/block/client/client_bloc.dart';
import 'package:get_profit/block/field_state.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:get_profit/components/client_button.dart';
import 'package:get_profit/components/input.dart';
import 'package:get_profit/http/api_postalcode.dart';
import 'package:get_profit/models/address.dart';
import 'package:get_profit/models/cliente.dart';

class ClienteScreen extends StatefulWidget {

  ClienteScreen({this.cliente});
  final Cliente cliente;
  @override
  _ClienteScreenState createState() => _ClienteScreenState();
}

class _ClienteScreenState extends State<ClienteScreen> {

  ClientBloc _clientBloc = ClientBloc();
  Cliente get cliente => widget.cliente;
  TextEditingController _nome = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _telefone = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _rg = TextEditingController();
  TextEditingController _numero = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(cliente == null ? "CADASTRO CLIENTES" : "ALTERAÇÃO CLIENTES", style: TextStyle(color: Colors.white),),
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
          SizedBox(height: 35,),
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
                                stream: _clientBloc.outNome,
                                  initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _nome,
                                    decoration: InputDecorationAcessorios().input(cliente == null ? "NOME" : cliente.nome,snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    keyboardType: TextInputType.text,
                                    onChanged: _clientBloc.changeNome,
                                    enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: _clientBloc.outEmail,
                                  initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _email,
                                      decoration: InputDecorationAcessorios().input(cliente == null ? "EMAIL" : cliente.email,snapshot.data.error),
                                      style: TextStyle(color: Colors.green),
                                      keyboardType: TextInputType.emailAddress,
                                    onChanged: _clientBloc.changeEmail,
                                    enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: _clientBloc.outCPF,
                                  initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _cpf,
                                    decoration: InputDecorationAcessorios().input(cliente == null ? "CPF" : cliente.cpf,snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly,
                                      CpfInputFormatter(),
                                    ],
                                    keyboardType: TextInputType.number,
                                    onChanged: _clientBloc.changeCPF,
                                    enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: _clientBloc.outRG,
                                  initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _rg,
                                    decoration: InputDecorationAcessorios().input(cliente == null ? "RG" : cliente.rg,snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    keyboardType: TextInputType.number,
                                    onChanged: _clientBloc.changeRG,
                                    enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: _clientBloc.outTelefone,
                                  initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _telefone,
                                      decoration: InputDecorationAcessorios().input(cliente == null ? "TELEFONE" : cliente.telefone,snapshot.data.error),
                                      style: TextStyle(color: Colors.green),
                                      keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly,
                                      TelefoneInputFormatter(),

                                    ],
                                    onChanged: _clientBloc.changeTelefone,
                                    enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                  stream: _clientBloc.outCEP,
                                  initialData: FieldState(),
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                      decoration: InputDecorationAcessorios().input(cliente == null ? "CEP" : cliente.numero,snapshot.data.error),
                                      style: TextStyle(color: Colors.green),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter.digitsOnly,
                                        CepInputFormatter(),
                                      ],
                                      onChanged: _clientBloc.changeCEP,
                                      enabled: snapshot.data.enabled,
                                    );
                                  }
                              ),
                              StreamBuilder<FieldState>(
                                stream: _clientBloc.outNumero,
                                initialData: FieldState(),
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _numero,
                                    decoration: InputDecorationAcessorios().input(cliente == null ? "NÚMERO" : cliente.numero,snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    keyboardType: TextInputType.number,
                                    onChanged: _clientBloc.changeNumero,
                                    enabled: snapshot.data.enabled,
                                  );
                                }
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              ClientButton(_clientBloc,cliente)
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





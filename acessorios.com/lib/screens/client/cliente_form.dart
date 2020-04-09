import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_profit/block/field_state.dart';
import 'package:get_profit/components/cep_field.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:get_profit/components/input.dart';
class ClienteUpdate extends StatefulWidget {
  @override
  _ClienteUpdateState createState() => _ClienteUpdateState();
}

class _ClienteUpdateState extends State<ClienteUpdate> {

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
        title: Text("CADASTRO CLIENTES", style: TextStyle(color: Colors.white),),
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
                                stream: null,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _nome,
                                    decoration: InputDecorationAcessorios().input("NOME",snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    keyboardType: TextInputType.text,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                      controller: _email,
                                      decoration: InputDecorationAcessorios().input("EMAIL",snapshot.data.error),
                                      style: TextStyle(color: Colors.green),
                                      keyboardType: TextInputType.emailAddress
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _cpf,
                                    decoration: InputDecorationAcessorios().input("CPF",snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly,
                                      CpfInputFormatter(),
                                    ],
                                    keyboardType: TextInputType.number,

                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _rg,
                                    decoration: InputDecorationAcessorios().input("RG",snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    keyboardType: TextInputType.number,
                                  );
                                }
                              ),
                              StreamBuilder<FieldState>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _telefone,
                                    decoration: InputDecorationAcessorios().input("TELEFONE",snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly,
                                      TelefoneInputFormatter(),
                                    ],
                                  );
                                }
                              ),
                              CepField(
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                  hintText: "CEP",
                                  hintStyle: TextStyle(color: Colors.green),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      (BorderSide(color: Colors.green))),
                                ),
                                style: TextStyle(color: Colors.green),
                              ),
                              StreamBuilder<FieldState>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    controller: _numero,
                                    decoration: InputDecorationAcessorios().input("NÚMERO",snapshot.data.error),
                                    style: TextStyle(color: Colors.green),
                                    keyboardType: TextInputType.number,
                                  );
                                }
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  RaisedButton(
                                    child: Text(
                                      "Alterar",
                                      style: TextStyle(color: Colors.white,fontSize: 18),
                                    ),
                                    color: Colors.lightGreen,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(color: Colors.lightGreen)),
                                    onPressed: () async{

                                      setState(() {

                                      });
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      "Excluir",
                                      style: TextStyle(color: Colors.white,fontSize: 18),
                                    ),
                                    color: Colors.lightGreen,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(color: Colors.lightGreen)),
                                    onPressed: () async{

                                      setState(() {

                                      });
                                    },
                                  ),
                                ],
                              )
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




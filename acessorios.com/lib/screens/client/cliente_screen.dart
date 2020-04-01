import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_profit/components/cep_field.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:get_profit/components/input.dart';
class ClienteScreen extends StatefulWidget {
  @override
  _ClienteScreenState createState() => _ClienteScreenState();
}

class _ClienteScreenState extends State<ClienteScreen> {

  TextEditingController _cep = TextEditingController();
  TextEditingController _nome = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _telefone = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _rg = TextEditingController();
  TextEditingController _cidade = TextEditingController();
  TextEditingController _logradouro = TextEditingController();
  TextEditingController _estado = TextEditingController();
  TextEditingController _numero = TextEditingController();
  TextEditingController _bairro = TextEditingController();




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
                              TextFormField(
                                controller: _nome,
                                decoration: InputDecorationAcessorios().input("NOME"),
                                style: TextStyle(color: Colors.green),
                                keyboardType: TextInputType.text,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: _email,
                                  decoration: InputDecorationAcessorios().input("EMAIL"),
                                  style: TextStyle(color: Colors.green),
                                  keyboardType: TextInputType.emailAddress
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: _cpf,
                                decoration: InputDecorationAcessorios().input("CPF"),
                                style: TextStyle(color: Colors.green),
                                inputFormatters: [
                                  WhitelistingTextInputFormatter.digitsOnly,
                                  CpfInputFormatter(),
                                ],
                                keyboardType: TextInputType.number,

                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: _rg,
                                decoration: InputDecorationAcessorios().input("RG"),
                                style: TextStyle(color: Colors.green),
                                keyboardType: TextInputType.number,
                              ),
                              TextFormField(
                                controller: _telefone,
                                  decoration: InputDecorationAcessorios().input("TELEFONE"),
                                  style: TextStyle(color: Colors.green),
                                  keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  WhitelistingTextInputFormatter.digitsOnly,
                                  TelefoneInputFormatter(),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              CepField(
                                decoration: InputDecorationAcessorios().input("CEP"),
                                style: TextStyle(color: Colors.green)
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: _numero,
                                decoration: InputDecorationAcessorios().input("NÚMERO"),
                                style: TextStyle(color: Colors.green),
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              RaisedButton(
                                child: Text(
                                  "CADASTRAR",
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




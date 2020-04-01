import 'package:flutter/material.dart';
import 'package:get_profit/components/input.dart';

class UsuarioScreen extends StatelessWidget {

  TextEditingController _login = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _cargo = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CADASTRO USUÁRIOS", style: TextStyle(color: Colors.white),),
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
                                controller: _login,
                                decoration: InputDecorationAcessorios().input("LOGIN"),
                                style: TextStyle(color: Colors.green),
                                keyboardType: TextInputType.text
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: _senha,
                                  decoration: InputDecorationAcessorios().input("SENHA"),
                                  obscureText: true,
                                  style: TextStyle(color: Colors.green),
                                  keyboardType: TextInputType.text
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: _cargo,
                                  decoration: InputDecorationAcessorios().input("CARGO"),
                                  style: TextStyle(color: Colors.green),
                                  keyboardType: TextInputType.text
                              ),
                              SizedBox(
                                height: 20,
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
                                onPressed: (){},
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



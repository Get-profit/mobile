import 'package:flutter/material.dart';
import 'package:get_profit/components/input.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController _login = TextEditingController();
  TextEditingController _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.white,
        body:
        ListView(
          padding: EdgeInsets.only(top: 80),
          children: <Widget>[
            Center(
                child: Text("LOGIN",
                    style: TextStyle(
                        color: Colors.green, fontSize: 35, fontWeight: FontWeight.bold))
            ),
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
                                SizedBox(height: 20,),
                                TextFormField(
                                  controller: _login,
                                  decoration: InputDecorationAcessorios().input("USUÁRIO"),
                                  style: TextStyle(color: Colors.green),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  controller: _senha,
                                  decoration: InputDecorationAcessorios().input("SENHA"),
                                  obscureText: true,
                                  style: TextStyle(color: Colors.green),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                RaisedButton(
                                  child: Text(
                                    "ENTRAR",
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



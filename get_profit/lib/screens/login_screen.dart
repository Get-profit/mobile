import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue,
        body:
        ListView(
          padding: EdgeInsets.only(top: 100),
          children: <Widget>[
            Center(
                child: Text("LOGIN",
                    style: TextStyle(
                        color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold))
            ),
            SizedBox(height: 35,),
            Center(
                child: Container(
                    width: 350,
                    child: Card(
                      elevation: 0,
                      color: Colors.black54,
                      child: Form(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 20,),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Usuário",
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.white)))),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Senha",
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.white)))),
                                  obscureText: true,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                RaisedButton(
                                  child: Text(
                                    "ENTRAR",
                                    style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(color: Colors.blue)),
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



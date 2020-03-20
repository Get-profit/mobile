import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                      hintText: "USUÁRIO",
                                      hintStyle: TextStyle(color: Colors.green),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.green)))),
                                  style: TextStyle(color: Colors.green),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                      hintText: "SENHA",
                                      hintStyle: TextStyle(color: Colors.green),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.green)))),
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



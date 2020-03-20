import 'package:flutter/material.dart';

class UsuarioScreen extends StatelessWidget {
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
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                    hintText: "NOME",
                                    hintStyle: TextStyle(color: Colors.green),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        (BorderSide(color: Colors.green)))),
                                style: TextStyle(color: Colors.green),
                                keyboardType: TextInputType.text,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                    hintText: "LOGIN",
                                    hintStyle: TextStyle(color: Colors.green),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        (BorderSide(color: Colors.green)))),
                                style: TextStyle(color: Colors.green),
                                keyboardType: TextInputType.text
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
                                  keyboardType: TextInputType.text
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                      hintText: "EMAIL",
                                      hintStyle: TextStyle(color: Colors.green),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.green)))),
                                  style: TextStyle(color: Colors.green),
                                  keyboardType: TextInputType.text
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                      hintText: "CARGO",
                                      fillColor: Colors.green,
                                      hintStyle: TextStyle(color: Colors.green),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.green)))),
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



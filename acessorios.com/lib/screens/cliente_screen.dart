import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

class ClienteScreen extends StatelessWidget {
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
                                      hintText: "EMAIL",
                                      hintStyle: TextStyle(color: Colors.green),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.green)))),
                                  style: TextStyle(color: Colors.green),
                                  keyboardType: TextInputType.emailAddress
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                maxLength: 11,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                      hintText: "CPF",
                                      hintStyle: TextStyle(color: Colors.green),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.green)))),
                                  style: TextStyle(color: Colors.green),
                                  keyboardType: TextInputType.number,

                              ),
                              TextFormField(
                                maxLength: 11,
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                      hintText: "TELEFONE",
                                      hintStyle: TextStyle(color: Colors.green),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.green)))),
                                  style: TextStyle(color: Colors.green),
                                  keyboardType: TextInputType.phone
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



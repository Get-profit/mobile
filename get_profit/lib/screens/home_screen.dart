import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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

          SizedBox(height: 15,),
          Center(
              child: Container(
                  width: 350,
                  child: Card(
                    elevation: 0,
                    color: Colors.black54,
                    child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              Center(
                                  child: Text("\$",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 50))
                              ),
                              SizedBox(height: 25,),
                              Center(

                                  child: Text("BEM VINDO AO GETPROFIT",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,)
                              ),
                              SizedBox(height: 8,),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text("Aqui você compara os preços e aumenta o seu dinheiro",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18,),
                                  textAlign: TextAlign.center,)
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child:  RaisedButton(
                                  child: Text(
                                    "ENTRAR COMO ADMINISTRADOR",
                                    style: TextStyle(color: Colors.white,fontSize: 15),
                                  ),
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(color: Colors.blue)),
                                  onPressed: (){},
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),

                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child:  RaisedButton(
                                  child: Text(
                                    "COMEÇAR A COMPARAR",
                                    style: TextStyle(color: Colors.white,fontSize: 15),
                                  ),
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(color: Colors.blue)),
                                  onPressed: (){},
                                ),
                              ),
                            ],
                          ),
                        ),
                  ))
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blue,
      body:
      ListView(
        padding: EdgeInsets.only(top: 80),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10),
            child:Align(
                alignment: Alignment.center,
                child: Text("CADASTRAR PRODUTO",
                  style: TextStyle(
                      color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,)
            ),
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
                              SizedBox(height: 12,),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: "MODELO",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        (BorderSide(color: Colors.white)))),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: "VALOR",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        (BorderSide(color: Colors.white)))),
                                obscureText: true,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RaisedButton(
                                child: Text(
                                  "CADASTRAR",
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



import 'package:flutter/material.dart';

class ProviderScreen extends StatelessWidget {
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
                child: Text("CADASTRAR FORNECEDOR",
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 12,),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 1),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150,
                                      child:TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Nome",
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide:
                                                (BorderSide(color: Colors.white)))),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150,
                                      child:TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Tx Adm. %",
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide:
                                                (BorderSide(color: Colors.white)))),
                                        style: TextStyle(color: Colors.white),
                                        keyboardType: TextInputType.number
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25,),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 1),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150,
                                      child:TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Tx Antecipa. %",
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide:
                                                (BorderSide(color: Colors.white)))),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150,
                                      child:TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Mensalidade",
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide:
                                                  (BorderSide(color: Colors.white)))),
                                          style: TextStyle(color: Colors.white),
                                          keyboardType: TextInputType.number
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
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



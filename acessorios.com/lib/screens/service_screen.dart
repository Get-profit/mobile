import 'package:flutter/material.dart';
import 'package:get_profit/screens/cliente_screen.dart';
import 'package:get_profit/screens/user_screen.dart';
import 'package:masked_text/masked_text.dart';


class ServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ORDEM SERVIÇOS", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: Drawer(

        elevation: 1.5,
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  leading:  IconButton(icon: Icon(Icons.person_add),color: Colors.blueAccent,),
                  title: Text('CADASTRO USUÁRIOS', style: TextStyle(color: Colors.grey, fontSize: 15),),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UsuarioScreen()),
                    );
                  },
                ),
                Divider(
                  color: Colors.grey ,
                  height: 5,
                ),
                ListTile(
                  title: Text('CADASTRO CLIENTES', style: TextStyle(color: Colors.grey, fontSize: 15),),
                  leading: IconButton(icon: Icon(Icons.person_add),color: Colors.blueAccent,),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ClienteScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        )
      ),
      backgroundColor: Colors.white,
      body:
      ListView(
        padding: EdgeInsets.only(top: 20),
        children: <Widget>[
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
                                    hintText: "Cliente",
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
                                      hintText: "Valor",
                                      hintStyle: TextStyle(color: Colors.green),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.green)))),
                                  style: TextStyle(color: Colors.green),
                                  keyboardType: TextInputType.number
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                      hintText: "Marca",
                                      hintStyle: TextStyle(color: Colors.green),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.green)))),
                                  style: TextStyle(color: Colors.green),
                                  keyboardType: TextInputType.number
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                      hintText: "Modelo",
                                      hintStyle: TextStyle(color: Colors.green),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                          (BorderSide(color: Colors.green)))),
                                  style: TextStyle(color: Colors.green),
                                  keyboardType: TextInputType.number
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                    hintText: "Defeito",
                                    hintStyle: TextStyle(color: Colors.green),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        (BorderSide(color: Colors.green)))),
                                style: TextStyle(color: Colors.green),
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder( borderSide: BorderSide( color:  Colors.green)),
                                    hintText: "Descrição",
                                    hintStyle: TextStyle(color: Colors.green),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        (BorderSide(color: Colors.green)))),
                                style: TextStyle(color: Colors.green),
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                              ),
                              SizedBox(
                                height: 16,
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



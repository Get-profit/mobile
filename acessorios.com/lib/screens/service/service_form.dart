import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_profit/block/field_state.dart';
import 'package:get_profit/components/input.dart';
import 'package:get_profit/screens/client/cliente_screen.dart';
import 'package:get_profit/screens/user/user_screen.dart';
import 'package:brasil_fields/brasil_fields.dart';


class ServiceUpdate extends StatefulWidget {
  @override
  _ServiceUpdateState createState() => _ServiceUpdateState();
}

class _ServiceUpdateState extends State<ServiceUpdate> {
  TextEditingController _cliente = TextEditingController();
  TextEditingController _valor = TextEditingController();
  TextEditingController _marca = TextEditingController();
  TextEditingController _modelo = TextEditingController();
  TextEditingController _defeito = TextEditingController();
  TextEditingController _descricao = TextEditingController();

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
                              StreamBuilder<FieldState>(
                                  stream: null,
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                      controller: _valor,
                                      decoration:InputDecorationAcessorios().input("VALOR",snapshot.data.error),
                                      style: TextStyle(color: Colors.green),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        WhitelistingTextInputFormatter.digitsOnly,
                                        RealInputFormatter(),
                                      ],
                                    );
                                  }
                              ),
                              StreamBuilder<FieldState>(
                                  stream: null,
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                        controller: _marca,
                                        decoration:InputDecorationAcessorios().input("MARCA",snapshot.data.error),
                                        style: TextStyle(color: Colors.green),
                                        keyboardType: TextInputType.number
                                    );
                                  }
                              ),
                              StreamBuilder<FieldState>(
                                  stream: null,
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                        controller: _modelo,
                                        decoration: InputDecorationAcessorios().input("MODELO",snapshot.data.error),
                                        style: TextStyle(color: Colors.green),
                                        keyboardType: TextInputType.number
                                    );
                                  }
                              ),
                              StreamBuilder<FieldState>(
                                  stream: null,
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                      controller: _defeito,
                                      decoration: InputDecorationAcessorios().input("DEFEITO",snapshot.data.error),
                                      style: TextStyle(color: Colors.green),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                    );
                                  }
                              ),
                              StreamBuilder<FieldState>(
                                  stream: null,
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                      controller: _descricao,
                                      decoration: InputDecorationAcessorios().input("DESCRIÇÃO",snapshot.data.error),
                                      style: TextStyle(color: Colors.green),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                    );
                                  }
                              ),

                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  RaisedButton(
                                    child: Text(
                                      "Alterar",
                                      style: TextStyle(color: Colors.white,fontSize: 18),
                                    ),
                                    color: Colors.lightGreen,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(color: Colors.lightGreen)),
                                    onPressed: (){
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text(
                                      "Excluir",
                                      style: TextStyle(color: Colors.white,fontSize: 18),
                                    ),
                                    color: Colors.lightGreen,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(color: Colors.lightGreen)),
                                    onPressed: (){
                                    },
                                  ),
                                ],
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




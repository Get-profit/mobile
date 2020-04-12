import 'package:flutter/material.dart';
import 'package:get_profit/block/field_state.dart';
import 'package:get_profit/block/user/user_bloc.dart';
import 'package:get_profit/components/input.dart';
import 'package:get_profit/components/user_button.dart';
import 'package:get_profit/models/usuario.dart';

class UsuarioScreen extends StatelessWidget {

  UsuarioScreen({this.user});
  final User user;
  TextEditingController _login = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _cargo = TextEditingController();
  TextEditingController _cep = TextEditingController();

  UserBloc _userBloc = UserBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user == null ? "CADASTRO USUÁRIOS" : "ALTERAÇÃO USUÁRIOS", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 150),
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
                                    StreamBuilder<FieldState>(
                                        stream: _userBloc.outLogin,
                                        initialData: FieldState(),
                                        builder: (context, snapshot) {
                                          return TextFormField(
                                            autocorrect: false,
                                            controller: _login,
                                            decoration: InputDecorationAcessorios().input(user == null ? "LOGIN" : user.apelido,snapshot.data.error),
                                            style: TextStyle(color: Colors.green),
                                            keyboardType: TextInputType.text,
                                            onChanged: _userBloc.changeLogin,
                                            enabled: snapshot.data.enabled,
                                          );
                                        }

                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    StreamBuilder<FieldState>(
                                        stream: _userBloc.outPassword,
                                        initialData: FieldState(),
                                        builder: (context, snapshot) {
                                          return TextFormField(
                                            autocorrect: false,
                                            controller: _senha,
                                            decoration: InputDecorationAcessorios().input(user == null ? "SENHA" : user.senha,snapshot.data.error),
                                            obscureText: user == null ? true : false,
                                            style: TextStyle(color: Colors.green),
                                            keyboardType: TextInputType.text,
                                            onChanged: _userBloc.changePassword,
                                            enabled: snapshot.data.enabled,
                                          );
                                        }
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    StreamBuilder<FieldState>(
                                        stream: _userBloc.outCargo,
                                        initialData: FieldState(),
                                        builder: (context, snapshot) {
                                          return TextFormField(
                                            controller: _cargo,
                                            decoration: InputDecorationAcessorios().input(user == null ? "CARGO" : user.cargo,snapshot.data.error),
                                            style: TextStyle(color: Colors.green),
                                            keyboardType: TextInputType.text,
                                            onChanged: _userBloc.changeCargo,
                                            enabled: snapshot.data.enabled,
                                          );
                                        }
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    UserButton(_userBloc,user)
                                  ],
                                ),
                              )),
                        ))
                ),
              ],
            ),
          )
        ],
      )
     ,
    );
  }
}



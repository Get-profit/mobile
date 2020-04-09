import 'package:flutter/material.dart';
import 'package:get_profit/block/field_state.dart';
import 'package:get_profit/block/login/login_bloc.dart';
import 'package:get_profit/components/input.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _login = TextEditingController();
  TextEditingController _senha = TextEditingController();

  LoginBloc _loginBloc = LoginBloc();
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
                              StreamBuilder<FieldState>(
                                  stream: _loginBloc.outLogin,
                                  initialData: FieldState(),
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                      autocorrect: false,
                                      controller: _login,
                                      decoration: InputDecorationAcessorios().input("USUÁRIO", snapshot.data.error),
                                      style: TextStyle(color: Colors.green),
                                      onChanged: _loginBloc.changeLogin,
                                      enabled: snapshot.data.enabled,
                                    );
                                  }
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              StreamBuilder<FieldState>(
                                  stream: _loginBloc.outPassword,
                                  initialData: FieldState(),
                                  builder: (context, snapshot) {
                                    return TextFormField(
                                      autocorrect: false,
                                      controller: _senha,
                                      decoration: InputDecorationAcessorios().input("SENHA",snapshot.data.error),
                                      obscureText: true,
                                      style: TextStyle(color: Colors.green),
                                      onChanged: _loginBloc.changePassword,
                                      enabled: snapshot.data.enabled,
                                    );
                                  }
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




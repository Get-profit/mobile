import 'package:flutter/material.dart';
import 'package:get_profit/components/input.dart';
import 'package:get_profit/http/webclients/user_webclient.dart';
import 'package:get_profit/screens/service/service_list.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> _keyForm = new GlobalKey();
  bool _validate = false;
  TextEditingController _login = TextEditingController();
  TextEditingController _senha = TextEditingController();
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
                        key: _keyForm,
                        autovalidate: _validate,
                        child: _form()),
                  ))
          ),
        ],
      ),


    );
  }

  Widget _form(){
        return Padding(
            padding: EdgeInsets.all(16),
              child: Column(
              children: <Widget>[
              SizedBox(height: 20,),
              TextFormField(
              autocorrect: false,
              controller: _login,
              decoration: InputDecorationAcessorios().input("USUÁRIO"),
              style: TextStyle(color: Colors.green),
                validator: _validaLogin,
              ),
              SizedBox(
              height: 16,
              ),
              TextFormField(
              autocorrect: false,
              controller: _senha,
              decoration: InputDecorationAcessorios().input("SENHA"),
              obscureText: true,
              style: TextStyle(color: Colors.green),
                validator: _validaSenha,
              ),
              SizedBox(
              height: 20,
              ),
                RaisedButton(
                  elevation: 0,
                  child: Text(
                    "Salvar",
                    style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                  color: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),),
                  onPressed: _sendForm,
                ),

          ],
          ));

      }

  String _validaLogin(String value) {

    if (value.length == 0) {
      return "Informe o login";
    }
    return null;
  }
  String _validaSenha(String value) {

    if (value.length == 0) {
      return "Informe a senha";
    }
    return null;
  }

  _sendForm() {
    if (_keyForm.currentState.validate()) {
      print("Login: " + _login.text.toString());
      print("Senha:" + _senha.text.toString());
      UserWebClient().login(_login.text.trim().toString(),_senha.text.trim().toString()).then((value){
        if(value.id != null){
          Future.delayed(const Duration(milliseconds: 2000), () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ServiceList(),
              ),
            );
          });

        }else{
          print("usuario invalido");
        }

      });
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

}






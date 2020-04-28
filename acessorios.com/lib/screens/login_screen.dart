import 'package:flutter/material.dart';
import 'package:get_profit/components/input.dart';
import 'package:get_profit/http/webclients/user_webclient.dart';
import 'package:get_profit/screens/service/service_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> _keyForm = new GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _showSnackBar(String texto, Color color){
    final snackbar = SnackBar(
      content: Text(texto,style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
      duration: Duration(seconds: 1),
      backgroundColor: color,

    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }
  bool _validate = false;
  TextEditingController _login = TextEditingController();
  TextEditingController _senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                    "ENTRAR",
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
    if (_keyForm.currentState.validate()){
      UserWebClient().login(_login.text.trim().toString(),_senha.text.trim().toString()).then((value) async{
        if(value.id != null){
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("login",value.apelido);
            _showSnackBar("Loading...", Colors.green);
            Future.delayed(const Duration(milliseconds: 1000), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServiceList()),
              );
            });
            print(prefs.getString("login"));

        }else{
          _showSnackBar("Usuário ou Senha Inválidos!", Colors.redAccent);
        }
      });

    } else {
      setState(() {
        _validate = true;
      });
    }
  }

}






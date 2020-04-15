import 'package:flutter/material.dart';
import 'package:get_profit/components/input.dart';
import 'package:get_profit/http/webclients/user_webclient.dart';
import 'package:get_profit/models/usuario.dart';

class UserScreen extends StatefulWidget {


  UserScreen({this.user});
  final User user;
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {


  User get user => widget.user;
  final TextEditingController _login = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  final TextEditingController _cargo = TextEditingController();

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

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
              scrollDirection: Axis.vertical,
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
                                key: _key,
                                autovalidate: _validate,
                                child: _formulario()
                            )))
                ),
              ],
            ),
          )
        ],
      )
      ,

    );


  }

  Widget _formulario(){
    return  Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          SizedBox(height: 12,),
          TextFormField(
            controller: _login,
            decoration: InputDecorationAcessorios().input(user == null ? "LOGIN" : user.apelido),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.text,
            validator: _validaNome,
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _senha,
            decoration: InputDecorationAcessorios().input(user == null ? "SENHA" : user.senha),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: _validaSenha,
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _cargo,
            decoration: InputDecorationAcessorios().input(user == null ? "CARGO" : user.cargo),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.text,
            validator: _validaCargo,
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
          )
        ],
      ),
    );
  }

  String _validaNome(String value) {

    if (value.length == 0) {
      return "Informe o nome";
    }
    return null;
  }

  String _validaCargo(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o cargo";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
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
    if (_key.currentState.validate()) {
      // Sem erros na validação
      //_key.currentState.save();
      print("Login: " + _login.text.toString());
      print("Senha:" + _senha.text.toString());
      print("Cargo:" + _cargo.text.toString());
      if(user != null){
        print("USUARIO");
        print(user.id);
        UserWebClient().update(User(
          id:user.id ,
          apelido: _login.text.trim(),
          senha:_senha.text.trim(),
          cargo: _cargo.text.trim()
        )).then((value){
          if(user!= null){
            print("ALTEROU");
          }
        });
        Navigator.pop(context);
      }else{
        UserWebClient().save(User(
            id: 0 ,
            apelido: _login.text.trim(),
            senha:_senha.text.trim(),
            cargo: _cargo.text.trim()
        )).then((value){
          print("CRIADO");
          print(value);
        });
        Navigator.pop(context);
      }
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }

  @override
  void initState() {
    if(user != null){
      _login.text = user.apelido;
      _senha.text = user.senha;
      _cargo.text = user.cargo;
    }
    super.initState();
  }
}


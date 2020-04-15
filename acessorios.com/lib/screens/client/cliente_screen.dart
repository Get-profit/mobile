import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:get_profit/components/input.dart';
import 'package:get_profit/http/webclients/client_webclient.dart';
import 'package:get_profit/models/cliente.dart';

class ClienteScreen extends StatefulWidget {

  ClienteScreen({this.cliente});
  final Cliente cliente;
  @override
  _ClienteScreenState createState() => _ClienteScreenState();
}

class _ClienteScreenState extends State<ClienteScreen> {

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  Cliente get cliente => widget.cliente;
  TextEditingController _nome = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _logradouro = TextEditingController();
  TextEditingController _telefone = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _rg = TextEditingController();
  TextEditingController _numero = TextEditingController();
  TextEditingController _cep = TextEditingController();
  TextEditingController _cidade= TextEditingController();
  TextEditingController _bairro = TextEditingController();
  TextEditingController _estado = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(cliente == null ? "CADASTRO CLIENTES" : "ALTERAÇÃO CLIENTES", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body:
      ListView(
        padding: EdgeInsets.only(top: 20),
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
          SizedBox(height: 12,),
          TextFormField(
            controller: _nome,
            decoration: InputDecorationAcessorios().input("NOME"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.text,
            validator: _validaNome,
          ),
          TextFormField(
            controller: _email,
            decoration: InputDecorationAcessorios().input("EMAIL"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.emailAddress,
            validator: _validaEmail,
          ),
          TextFormField(
            controller: _cpf,
            decoration: InputDecorationAcessorios().input("CPF"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.number,
            validator: _validaCPF,
          ),
          TextFormField(
            controller: _rg,
            decoration: InputDecorationAcessorios().input("RG"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.number,
            validator: _validaRG,
          ),
          TextFormField(
            controller: _telefone,
            decoration: InputDecorationAcessorios().input("TELEFONE"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.phone,
            validator: _validaTelefone,
          ),
          TextFormField(
            controller: _cep,
            decoration: InputDecorationAcessorios().input("CEP"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.number,
            validator: _validaCEP,
          ),
          TextFormField(
            controller: _cidade,
            decoration: InputDecorationAcessorios().input("CIDADE"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.text,
            validator: _validaCidade,
          ),
          TextFormField(
            controller: _logradouro,
            decoration: InputDecorationAcessorios().input("LOGRADOURO"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.text,
            validator: _validaLogradouro,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 200,
                child: TextFormField(
                  controller: _bairro,
                  decoration: InputDecorationAcessorios().input("BAIRRO"),
                  style: TextStyle(color: Colors.green),
                  keyboardType: TextInputType.text,
                  validator: _validaBairro,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: 100,
                  child: TextFormField(
                    controller: _estado,
                    decoration: InputDecorationAcessorios().input("UF"),
                    style: TextStyle(color: Colors.green),
                    keyboardType: TextInputType.text,
                    validator: _validaEstado,
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            controller: _numero,
            decoration: InputDecorationAcessorios().input("NÚMERO"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.number,
            validator: _validaNumero,
          ),
          SizedBox(
            height: 12,
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
            onPressed: _sendForm
          )
        ],
      ),
    );
 }

  String _validaNome(String value) {
    const Pattern pattern = r"^[aA-zZ]+((\s[aA-zZ]+)+)?$";
    final RegExp regex = RegExp(pattern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if(!regex.hasMatch(value)){
      return "Nome inválido";
    }
    return null;
  }
  String _validaCEP(String cep) {
    if(cep.isEmpty){
      return "Informe o CEP";
    }else if(cep.length != 8){
      return "CEP Inválido";
    }
    else
    return null;
  }
  String _validaEmail(String email) {
    const Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    if(email.isEmpty){
      return "Informe o Email";
    }else if(!regex.hasMatch(email))
     return "Email inválido";
    else
      return null;
  }
  String _validaCPF(String cpf) {
    if(cpf.isEmpty){
      return "Informe o CPF";
    }else if(cpf.length != 11){
      return "CPF Inválido";
    }
    else
      return null;
  }
  String _validaRG(String rg) {
    if(rg.isEmpty){
      return "Informe o RG";
    }else if(rg.length > 8){
      return "RG Inválido";
    }
    else
      return null;
  }
  String _validaTelefone(String telefone) {
    if(telefone.isEmpty){
      return "Informe o Telefone";
    }else if(telefone.length > 11)
      return "Telefone Inválido";
    else
      return null;
  }
  String _validaBairro(String bairro) {
    if(bairro.isEmpty){
      return "Informe o Bairro";
    }
    else
      return null;
  }
  String _validaCidade(String cidade) {
    if(cidade.isEmpty){
      return "Informe a Cidade";
    }
    else
      return null;
  }
  String _validaEstado(String estado) {
    if(estado.isEmpty){
      return "Informe o Estado";
    }else if(estado.length > 2)
      return "Informe a sigla do Estado";
    else
      return null;
  }
  String _validaNumero(String numero) {
    if(numero.isEmpty){
      return "Informe o Numero";
    }else if(numero.length > 5)
      return "O número deve possuir até 5 dígitos";
    else
      return null;
  }
  String _validaLogradouro(String rua) {
    const Pattern pattern = r"^[aA-zZ]+((\s[aA-zZ]+)+)?$";
    final RegExp regex = RegExp(pattern);
    if (rua.length == 0) {
      return "Informe o Logradouro";
    } else if(!regex.hasMatch(rua)){
      return "Logradouro inválido";
    }
    return null;
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      if(cliente != null){
        print("USUARIO");
        print(cliente.id);
        ClienteWebClient().update(Cliente(
          id: cliente.id,
          nome: _nome.text.trim(),
          cpf:_cpf.text.trim().replaceAll('-', '').replaceAll('.', ''),
          rg:_rg.text.trim(),
          telefone:_telefone.text.trim().replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '').replaceAll('-', ''),
          email:_email.text.trim(),
          cep:_cep.text.trim().replaceAll('-', '').replaceAll('.', ''),
          logradouro: _logradouro.text.trim(),
          numero:int.parse(_numero.text.trim()),
          bairro:_bairro.text.trim(),
          cidade:_cidade.text.trim(),
          estado:_estado.text.trim(),
        )).then((value){
          if(value == 200){
            print("ALTEROU");
          }
        });
        Navigator.pop(context);
      }else{
        ClienteWebClient().save(Cliente(
          id: 0,
          nome: _nome.text.trim(),
          cpf:_cpf.text.trim().replaceAll('-', '').replaceAll('.', ''),
          rg:_rg.text.trim(),
          telefone:_telefone.text.trim().replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '').replaceAll('-', ''),
          email:_email.text.trim(),
          cep:_cep.text.trim().replaceAll('-', '').replaceAll('.', ''),
          logradouro: _logradouro.text.trim(),
          numero:int.parse(_numero.text.trim()),
          bairro:_bairro.text.trim(),
          cidade:_cidade.text.trim(),
          estado:_estado.text.trim(),
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
    if(cliente != null){
      _nome.text = cliente.nome;
      _cpf.text = cliente.cpf;
      _rg.text = cliente.rg;
      _telefone.text = cliente.telefone;
      _email.text= cliente.email;
      _cep.text = cliente.cep;
      _numero.text = cliente.numero.toString();
      _logradouro.text = cliente.logradouro;
      _bairro.text =cliente.bairro;
      _cidade.text = cliente.cidade;
      _estado.text = cliente.estado;
    }
    super.initState();
  }



}





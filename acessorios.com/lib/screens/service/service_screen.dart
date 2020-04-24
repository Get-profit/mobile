import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_profit/components/input.dart';
import 'package:get_profit/delegates/client_search.dart';
import 'package:get_profit/http/webclients/service_webclient.dart';
import 'package:get_profit/models/cliente.dart';
import 'package:get_profit/models/servico.dart';
import 'package:date_format/date_format.dart';

class ServiceScreen extends StatefulWidget {
  ServiceScreen({this.servico});
  final ServicesOrder servico;
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  ServicesOrder get servico => widget.servico;
  TextEditingController _cliente = TextEditingController();
  TextEditingController _valor = TextEditingController();
  TextEditingController _marca = TextEditingController();
  TextEditingController _modelo = TextEditingController();
  TextEditingController _defeito = TextEditingController();
  TextEditingController _senhaDesbloqueio = TextEditingController();
  TextEditingController _descricao = TextEditingController();
  TextEditingController _tipo = TextEditingController();
  int idCliente;
  Cliente resultCliente;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
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
      backgroundColor: Colors.white,
      body:
      ListView(
        scrollDirection: Axis.vertical,
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
          Container(
            width: 170,
            child: RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Buscar Cliente", style: TextStyle(color: Colors.white),),
                  Icon(Icons.search,color: Colors.white,)
                ],
              ),
              color: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),),
              onPressed: () async{
                final Cliente resultCliente = await showSearch(context: context, delegate: ClientSearch());
                print(resultCliente);
                if(resultCliente != null){
                  _cliente.text = resultCliente.nome;
                  idCliente = resultCliente.id;
                }

              },
            ),
          ),
          TextFormField(
            controller: _cliente,
            decoration:InputDecorationAcessorios().input("CLIENTE"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.text,
            readOnly:true,
            validator: _validaCampos,
          ),
          TextFormField(
            controller: _valor,
            decoration:InputDecorationAcessorios().input("VALOR"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.number,
            maxLength: 9,
            validator: _validaCampos,
          ),
          TextFormField(
            controller: _tipo,
            decoration:InputDecorationAcessorios().input("TIPO"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.text,
            maxLength: 100,
            validator: _validaCampos,
          ),
          TextFormField(
            controller: _marca,
            decoration:InputDecorationAcessorios().input("MARCA"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.text,
            maxLength: 100,
            validator: _validaCampos,
          ),
          TextFormField(
            controller: _modelo,
            decoration: InputDecorationAcessorios().input("MODELO"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.text,
            maxLength: 100,
            validator: _validaCampos,
          ),
          TextFormField(
            controller: _defeito,
            decoration: InputDecorationAcessorios().input("DEFEITO"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.multiline,
            maxLength: 500,
            maxLines: 3,
            validator: _validaCampos,
          ),
          TextFormField(
            controller: _descricao,
            decoration: InputDecorationAcessorios().input("DESCRIÇÃO"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.multiline,
            maxLength: 500,
            maxLines: 3,
            validator: _validaCampos,
          ),
          TextFormField(
            controller: _senhaDesbloqueio,
            decoration: InputDecorationAcessorios().input("SENHA DE DESBLOQUEIO"),
            style: TextStyle(color: Colors.green),
            keyboardType: TextInputType.text,
            maxLength: 20,
            validator: _validaCampos,
          ),
          SizedBox(
            height: 12,
          ),
          RaisedButton(
            elevation: 0,
            child:  Text(
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

  String _validaCampos(String value) {
    if (value.length == 0) {
      return "Informe o Campo";
    }
    return null;
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      if(servico != null){
        ServiceOrderWebClient().update(ServicesOrder(
            id: servico.id,
            idCliente: idCliente,
            status: servico.status,
            dataEntrada: servico.dataEntrada.substring(0,10),
            tipo: _tipo.text.trim(),
            marca: _marca.text.trim(),
            modelo: _modelo.text.trim(),
            defeito: _defeito.text.trim(),
            descricao: _descricao.text.trim(),
            senhaDesbloqueio: _senhaDesbloqueio.text.trim(),
            valorOrcado: double.parse(_valor.text.trim()),
            dataSaida: servico.dataSaida
        )).then((value){
          if(value == 200){
            print("ALTEROU");
          }
        });
        Navigator.pop(context);
      }else{
        ServiceOrderWebClient().save(ServicesOrder(
            id: 0,
            idCliente: idCliente,
            status: "Aberto",
            dataEntrada: formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]),
            tipo: _tipo.text.trim(),
            marca: _marca.text.trim(),
            modelo: _modelo.text.trim(),
            defeito: _defeito.text.trim(),
            descricao: _descricao.text.trim(),
            idClienteNavigation: resultCliente,
            senhaDesbloqueio: _senhaDesbloqueio.text.trim(),
            valorOrcado: double.parse(_valor.text.trim()),
            dataSaida:null
        )).then((value){
          if(value == 201){
            print("Inseriu!");
          }
        });
        Navigator.pop(context);
      }
    } else {
      setState(() {
        _validate = true;
      });
    }
  }




  @override
  void initState() {
    if(servico != null){
      _cliente.text = servico.idClienteNavigation.nome;
      _descricao.text = servico.descricao;
      _modelo.text = servico.modelo;
      _defeito.text = servico.defeito;
      _marca.text = servico.marca;
      _valor.text = servico.valorOrcado.toString();
      _senhaDesbloqueio.text = servico.senhaDesbloqueio;
      _tipo.text = servico.tipo;
      idCliente = servico.idCliente;
    }
    super.initState();
  }


}


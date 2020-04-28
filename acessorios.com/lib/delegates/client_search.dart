import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_profit/models/cliente.dart';
import 'package:http/http.dart' as http;

class ClientSearch extends SearchDelegate<Cliente>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,progress:transitionAnimation ,),
      onPressed: (){
        close(context,null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).then((_)=>close(context,null));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Container();
    }else{
      return FutureBuilder<List>(
        future: suggestions(query),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return ListView.builder(itemBuilder: (context,index){
              return ListTile(
                title: Text(snapshot.data[index]["nome"]),
                leading: Icon(Icons.account_circle),
                onTap: (){
                  close(context, Cliente.fromJson(snapshot.data[index]));
                },
              );
            },
              itemCount: snapshot.data.length,);
          }
        },
      );
    }
  }


  Future<List> suggestions(String search) async{

    http.Response response = await http.post("http://projeto-acessorios.appspot.com/api/clientes/$search",
        headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    },
    );
    if(response.statusCode == 200){
      return json.decode(response.body).map((v){
        return v;
      }).toList();
    }else{
      throw Exception("Failed to load suggestions");
    }

  }

}
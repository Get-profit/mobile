import 'dart:convert';
import 'package:date_format/date_format.dart';
import 'package:get_profit/http/webclient.dart';
import 'package:get_profit/models/cliente.dart';
import 'package:get_profit/models/servico.dart';
import 'package:http/http.dart';

class ServiceOrderWebClient {

  ////METODO OK
  Future<List<ServicesOrder>> findAll() async {
    final Response response =
    await client.get("https://projeto-acessorios.appspot.com/api/ordemservico/RecuperarTodosAbertos").timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => ServicesOrder.fromJson(json))
        .toList();
  }

////TESTAR
  Future<int> save(ServicesOrder service) async {
    Map serviceJson ={
      'id': service.id,
      'idCliente': service.idCliente,
      'status': service.status,
      'dataEntrada': service.dataEntrada,
      'tipo': service.tipo,
      'marca': service.marca,
      'modelo': service.modelo,
      'defeito': service.defeito,
      'descricao': service.descricao,
      'senhaDesbloqueio': service.senhaDesbloqueio,
      'valorOrcado': service.valorOrcado,
      'dataSaida':null,
    };
    final Response response = await client.post(serviceOrderUrl,
        headers: {
          'Content-type': 'application/json',
        },
        body: jsonEncode(serviceJson));
    return response.statusCode;
  }

////TESTAR
  Future<int> update(ServicesOrder service) async {
    Map serviceJson ={
      'id': service.id,
      'idCliente': service.idCliente,
      'status': service.status,
      'dataEntrada': service.dataEntrada,
      'tipo': service.tipo,
      'marca': service.marca,
      'modelo': service.modelo,
      'defeito': service.defeito,
      'descricao': service.descricao,
      'senhaDesbloqueio': service.senhaDesbloqueio,
      'valorOrcado': service.valorOrcado,
      'dataSaida': service.dataEntrada,
    };
    final Response response = await client.put(serviceOrderUrl,
        headers: {
          'Content-type': 'application/json',
        },
        body: jsonEncode(serviceJson));
    return response.statusCode;
  }


   ////METODO OK
  Future<int> delete(String id) async {
    final Response response = await client.delete("https://projeto-acessorios.appspot.com/api/ordemservico/$id"
      ,
      headers: {
        'Content-type': 'application/json',
      },);

    return response.statusCode;
  }

}

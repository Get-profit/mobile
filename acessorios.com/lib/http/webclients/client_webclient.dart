import 'dart:convert';
import 'package:get_profit/http/webclient.dart';
import 'package:get_profit/models/cliente.dart';
import 'package:http/http.dart';

class ClienteWebClient {

  Future<List<Cliente>> findAll() async {
    final Response response =
    await client.get(clientUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Cliente.fromJson(json))
        .toList();
  }

  Future<Cliente> save(Cliente cliente) async {
    final String clienteJson = jsonEncode(cliente.toJson());

    final Response response = await client.post(clientUrl,
        headers: {
          'Content-type': 'application/json',
        },
        body: clienteJson);

    return Cliente.fromJson(jsonDecode(response.body));
  }

  Future<int> update(Cliente cliente) async {
    final String clientJson = jsonEncode(cliente.toJson());
    final Response response = await client.put(clientUrl,
        headers: {
          'Content-type': 'application/json',
        },
        body: clientJson);
    return response.statusCode;
  }

  Future<int> delete(String id) async {
    final Response response = await client.delete("https://projeto-acessorios.appspot.com/api/clientes/$id"
      ,
      headers: {
        'Content-type': 'application/json',
      },);

    return response.statusCode;
  }



}

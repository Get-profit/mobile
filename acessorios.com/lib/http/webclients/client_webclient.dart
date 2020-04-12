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

}

import 'dart:convert';

import 'package:get_profit/http/webclient.dart';
import 'package:get_profit/models/cliente.dart';
import 'package:get_profit/models/servico.dart';
import 'package:http/http.dart';

class ServiceOrderWebClient {
  Future<List<ServicesOrder>> findAll() async {
    final Response response =
    await client.get(serviceOrderUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => ServicesOrder.fromJson(json))
        .toList();
  }

  Future<ServicesOrder> save(ServicesOrder transaction) async {
    final String serviceJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(serviceOrderUrl,
        headers: {
          'Content-type': 'application/json',
        },
        body: serviceJson);

    return ServicesOrder.fromJson(jsonDecode(response.body));
  }

}

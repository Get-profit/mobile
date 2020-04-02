import 'dart:convert';
import 'package:get_profit/http/webclient.dart';
import 'package:get_profit/models/usuario.dart';
import 'package:http/http.dart';

class UserWebClient {
  Future<List<User>> findAll() async {
    final Response response =
    await client.get(userUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => User.fromJson(json))
        .toList();
  }

  Future<User> save(User user) async {
    final String userJson = jsonEncode(user.toJson());

    final Response response = await client.post(userUrl,
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: userJson);

    return User.fromJson(jsonDecode(response.body));
  }

}

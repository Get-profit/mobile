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
        },
        body: userJson);

    return User.fromJson(jsonDecode(response.body));
  }
  Future<User> update(User user) async {
    final String userJson = jsonEncode(user.toJson());
    final Response response = await client.put(userUrl,
        headers: {
          'Content-type': 'application/json',
        },
        body: userJson);

    return User.fromJson(jsonDecode(response.body));
  }

  Future<User> login(String login,String senha) async {

    Map loginJson ={
        "apelido": login,
        "senha": senha
    };

    print(loginJson);

    final Response response = await client.post("http://35.208.89.16/api/login"
        ,
        headers: {
          'Content-type': 'application/json',
        },
        body: jsonEncode(loginJson));

    return User.fromJson(jsonDecode(response.body));
  }
   Future<int> delete(String id) async {
    final Response response = await client.delete("http://35.208.89.16/api/usuarios/$id"
        ,
        headers: {
          'Content-type': 'application/json',
        },);

    return response.statusCode;
  }

}



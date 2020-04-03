import 'package:flutter/material.dart';
import 'package:get_profit/components/centered_message.dart';
import 'package:get_profit/components/progress.dart';
import 'package:get_profit/http/webclients/user_webclient.dart';
import 'package:get_profit/models/usuario.dart';

class UserList extends StatelessWidget {

  final UserWebClient _webClient = UserWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: FutureBuilder<List<User>>(
        future: _webClient.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if(snapshot.hasData){
                final List<User> usuarios = snapshot.data;
                if (usuarios.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final User user = usuarios[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.monetization_on),
                          title: Text(
                            user.apelido.toString(),
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            user.cargo.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: usuarios.length,
                  );
                }
              }
              return CenteredMessage(
                'Nenhum usuário encontrado!',
                icon: Icons.warning,
              );
              break;
          }

          return CenteredMessage('Unknown error');
        },
      ),
    );
  }
}

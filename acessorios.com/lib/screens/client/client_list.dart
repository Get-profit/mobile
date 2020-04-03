import 'package:flutter/material.dart';
import 'package:get_profit/components/centered_message.dart';
import 'package:get_profit/components/progress.dart';
import 'package:get_profit/http/webclients/client_webclient.dart';
import 'package:get_profit/models/cliente.dart';

class ClientList extends StatelessWidget {

   final ClienteWebClient _webClient = ClienteWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      body: FutureBuilder<List<Cliente>>(
        // future: _webClient.findAll(),
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
                final List<Cliente> clientes = snapshot.data;
                if (clientes.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Cliente cliente = clientes[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.monetization_on),
                          title: Text(
                            cliente.nome.toString(),
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            cliente.cpf.toString() +" - " + cliente.telefone.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: clientes.length,
                  );
                }
              }
              return CenteredMessage(
                'No transactions found',
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

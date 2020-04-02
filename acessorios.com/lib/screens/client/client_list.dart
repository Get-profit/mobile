import 'package:flutter/material.dart';
import 'package:get_profit/components/centered_message.dart';
import 'package:get_profit/components/progress.dart';
import 'package:get_profit/models/cliente.dart';

class ClientList extends StatelessWidget {

  // final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      body: FutureBuilder<List<Client>>(
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
//              if(snapshot.hasData){
//                final List<User> transactions = snapshot.data;
//                if (transactions.isNotEmpty) {
//                  return ListView.builder(
//                    itemBuilder: (context, index) {
//                      final Client transaction = transactions[index];
//                      return Card(
//                        child: ListTile(
//                          leading: Icon(Icons.monetization_on),
//                          title: Text(
//                            transaction.value.toString(),
//                            style: TextStyle(
//                              fontSize: 24.0,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                          subtitle: Text(
//                            transaction.contact.accountNumber.toString(),
//                            style: TextStyle(
//                              fontSize: 16.0,
//                            ),
//                          ),
//                        ),
//                      );
//                    },
//                    itemCount: transactions.length,
//                  );
//                }
//              }
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

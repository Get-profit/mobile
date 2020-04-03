import 'package:flutter/material.dart';
import 'package:get_profit/components/centered_message.dart';
import 'package:get_profit/components/progress.dart';
import 'package:get_profit/http/webclients/service_webclient.dart';
import 'package:get_profit/models/servico.dart';

class ServiceList extends StatelessWidget {

   final ServiceOrderWebClient _webClient = ServiceOrderWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviços'),
      ),
      body: FutureBuilder<List<ServicesOrder>>(
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
                final List<ServicesOrder> servicos = snapshot.data;
                if (servicos.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final ServicesOrder servico = servicos[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.monetization_on),
                          title: Text(
                            servico.idClient.nome.toString(),
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(servico.modelo.toString()+"\n"+
                            servico.valorOrcado.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: servicos.length,
                  );
                }
              }
              return CenteredMessage(
                'Nenhum Serviço Encontrado!',
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

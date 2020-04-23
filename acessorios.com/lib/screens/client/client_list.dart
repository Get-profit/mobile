import 'package:flutter/material.dart';
import 'package:get_profit/components/centered_message.dart';
import 'package:get_profit/components/progress.dart';
import 'package:get_profit/http/webclients/client_webclient.dart';
import 'package:get_profit/models/cliente.dart';
import 'package:get_profit/screens/client/cliente_screen.dart';

class ClientList extends StatefulWidget {
  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  final ClienteWebClient _webClient = ClienteWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIENTES',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Cliente>>(
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
                final List<Cliente> clientes = snapshot.data;
                if (clientes.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Cliente cliente = clientes[index];
                      return Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(right: 60,left: 50),
                          trailing:IconButton(icon:Icon(Icons.delete),
                            onPressed: (){
                              showAlertDialog(context, cliente);
                            },),
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
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ClienteScreen(cliente: cliente,),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    itemCount: clientes.length,
                  );
                }
              }
              return CenteredMessage(
                'Nenhum Cliente foi Encontrado!',
                icon: Icons.warning,
              );
              break;
          }

          return CenteredMessage('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.green,
        onPressed: () {
          setState(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ClienteScreen(),
              ),
            );
          });

        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }


  showAlertDialog(BuildContext context, Cliente cliente) {
    Widget cancelButton = FlatButton(
      child: Text("Cancelar", style: TextStyle(color: Colors.redAccent),),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget acceptButton = FlatButton(
      child: Text("Confirmar", style: TextStyle(color: Colors.green)),
      onPressed:  () {
        Navigator.pop(context);
        ClienteWebClient().delete(cliente.id.toString()).then((value){
          if(value == 204){
            setState(() {

            });
          }
        });
      },
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Deseja Excluir o Cliente?", style: TextStyle(color: Colors.green),),
      actions: [
        acceptButton,
        cancelButton,
      ],
    );
    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    setState(() {

    });
    super.initState();
  }
}


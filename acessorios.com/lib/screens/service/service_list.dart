import 'package:flutter/material.dart';
import 'package:get_profit/components/centered_message.dart';
import 'package:get_profit/components/progress.dart';
import 'package:get_profit/http/webclients/service_webclient.dart';
import 'package:get_profit/models/servico.dart';
import 'package:get_profit/screens/client/client_list.dart';
import 'package:get_profit/screens/login_screen.dart';
import 'package:get_profit/screens/service/service_screen.dart';
import 'package:get_profit/screens/user/user_list.dart';
import 'package:date_format/date_format.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:date_format/date_format.dart';


class ServiceList extends StatefulWidget {
  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {


  @override
  void initState() {
    setState(() {

    });
    super.initState();
  }

  final ServiceOrderWebClient _webClient = ServiceOrderWebClient();
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('SERVIÇOS', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close),
            onPressed: () async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove("login");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },)
        ],
      ),
      drawer: Drawer(
          elevation: 1.5,
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  ListTile(
                    leading:  IconButton(icon: Icon(Icons.person),color: Colors.blueAccent,),
                    title: Text('USUÁRIOS', style: TextStyle(color: Colors.grey, fontSize: 15),),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserList()),
                      );
                    },
                  ),
                  Divider(
                    color: Colors.grey ,
                    height: 5,
                  ),
                  ListTile(
                    title: Text('CLIENTES', style: TextStyle(color: Colors.grey, fontSize: 15),),
                    leading: IconButton(icon: Icon(Icons.person),color: Colors.blueAccent,),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClientList()),
                      );
                    },
                  ),
                ],
              ),
            ],
          )
      ),

      body:
      FutureBuilder<List<ServicesOrder>>(
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
                        child: ExpansionTile(
                          //trailing: IconButton(icon:Icon(Icons.keyboard_arrow_right), onPressed: (){},),
                          title: Text(servico.id.toString() + " - "+
                            servico.idClienteNavigation.nome.toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text("Data de Entrada: "+ formatDate(DateTime.parse(servico.dataEntrada), [dd, '/', mm, '/', yyyy]) + "\n" + "Valor: " +
                              servico.valorOrcado.toString() + "\n" +"${servico.tipo}: " + servico.marca +" - " + servico.modelo
                            ,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text("Concluir Serviço"),
                              trailing: Icon(Icons.done),
                              onTap: (){
                                showAlertDialog(context, servico,"finalizar");
                              },
                            ),
                            ListTile(
                              title: Text("Alterar Serviço"),
                              trailing: Icon(Icons.update),
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ServiceScreen(servico: servico,),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              title: Text("Excluir Serviço"),
                              trailing: Icon(Icons.delete),
                              onTap: (){
                                showAlertDialog(context, servico, "excluir");
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: servicos.length,
                  );
                }
              }
              return CenteredMessage(
                'Nenhum Serviço encontrado!',
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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ServiceScreen(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, ServicesOrder service,String tipo) {
    Widget cancelButton = FlatButton(
      child: Text("Cancelar", style: TextStyle(color: Colors.redAccent),),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget acceptButton = FlatButton(
      child: Text("Confirmar", style: TextStyle(color: Colors.green)),
      onPressed:  () {
        if(tipo == "finalizar"){
          ServiceOrderWebClient().update(ServicesOrder(
              id: service.id,
              idCliente: service.idCliente,
              status: "Finalizado",
              dataEntrada: service.dataEntrada.substring(0,10),
              tipo: service.tipo,
              marca: service.marca,
              modelo: service.modelo,
              defeito: service.defeito,
              descricao: service.descricao,
              senhaDesbloqueio: service.senhaDesbloqueio,
              valorOrcado: service.valorOrcado,
              dataSaida: formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd])
          )).then((value){
            if(value == 200){
              setState(() {
                print("Finalizado");
              });
            }
          });
        }else{
          ServiceOrderWebClient().delete(service.id.toString()).then((value){
            if(value == 204){
              setState(() {

              });
            }
          });
        }
        Navigator.pop(context);
      },
    );
    //configura o AlertDialog


    if(tipo == "finalizar"){
      AlertDialog alert = AlertDialog(
        title: Text("Deseja Finalizar a Ordem de Serviço?", style: TextStyle(color: Colors.green),),
        actions: [
          acceptButton,
          cancelButton,
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }else{
      AlertDialog alert = AlertDialog(
        title: Text("Deseja Excluir a Ordem de Serviço?", style: TextStyle(color: Colors.green),),
        actions: [
          acceptButton,
          cancelButton,
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

  }


}


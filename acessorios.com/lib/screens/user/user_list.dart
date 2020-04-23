import 'package:flutter/material.dart';
import 'package:get_profit/components/centered_message.dart';
import 'package:get_profit/components/progress.dart';
import 'package:get_profit/http/webclients/user_webclient.dart';
import 'package:get_profit/models/usuario.dart';
import 'package:get_profit/screens/user/user_screen.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  final UserWebClient _webClient = UserWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USUÁRIOS',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
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
                          contentPadding: EdgeInsets.only(right: 60,left: 50),
                          trailing:IconButton(icon:Icon(Icons.delete),
                            onPressed: (){
                              showAlertDialog(context, user);
                            },),
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
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UserScreen(user: user,),
                              ),
                            );
                          },
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

      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserScreen(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, User user) {
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
        UserWebClient().delete(user.id.toString()).then((value){
          if(value == 204){
            setState(() {

            });
          }
        });
      },
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Deseja Excluir o Usuário?", style: TextStyle(color: Colors.green),),
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

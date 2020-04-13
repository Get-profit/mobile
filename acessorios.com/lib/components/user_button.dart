import 'package:flutter/material.dart';
import 'package:get_profit/block/button_state.dart';
import 'package:get_profit/block/user/user_bloc.dart';
import 'package:get_profit/block/user/user_bloc_state.dart';
import 'package:get_profit/components/progress.dart';
import 'package:get_profit/models/usuario.dart';


class UserButton extends StatelessWidget {

  UserButton(this.userBloc,this.user);

  final UserBloc userBloc;
  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      child: StreamBuilder<ButtonState>(
          stream: userBloc.outUserButton,
          initialData: ButtonState(enabled: false, loading: false),
          builder: (context, snapshot) {
            return RaisedButton(
              elevation: 0,
              child: snapshot.data.loading ?
              Progress()
                  : Text(
                "Salvar",
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
              color: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),),
              onPressed: snapshot.data.enabled ? (){
                print("USUARIO BOTAO:" + user.id.toString());
                print(user);
                userBloc.save(user);
                Navigator.pop(context);
                //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Dados processados com sucesso')));
              }: null,
            );
          }
      ),
    );
  }
}

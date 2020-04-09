import 'package:flutter/material.dart';
import 'package:get_profit/block/button_state.dart';
import 'package:get_profit/block/user/user_bloc.dart';
import 'package:get_profit/components/progress.dart';


class UserButton extends StatelessWidget {

  UserButton(this.userBloc);

  final UserBloc userBloc;

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
                userBloc.save();
              }: null,
            );
          }
      ),
    );
  }
}

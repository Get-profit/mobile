import 'package:flutter/material.dart';
import 'package:get_profit/block/button_state.dart';
import 'package:get_profit/block/login/login_bloc.dart';
import 'package:get_profit/components/progress.dart';


class LoginButton extends StatelessWidget {

  LoginButton(this.loginBloc);

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      child: StreamBuilder<ButtonState>(
        stream: loginBloc.outLoginButton,
        initialData: ButtonState(enabled: false, loading: false),
        builder: (context, snapshot) {
          return RaisedButton(
            elevation: 0,
            child: snapshot.data.loading ?
            Progress()
                : Text(
              "ENTRAR",
              style: TextStyle(color: Colors.white,fontSize: 18),
            ),
            color: Colors.lightGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),),
            onPressed: snapshot.data.enabled ? (){
              loginBloc.login();
            }: null,
          );
        }
      ),
    );
  }
}

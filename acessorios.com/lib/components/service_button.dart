import 'package:flutter/material.dart';
import 'package:get_profit/block/button_state.dart';
import 'package:get_profit/block/service/service_bloc.dart';
import 'package:get_profit/components/progress.dart';
import 'package:get_profit/models/cliente.dart';
import 'package:get_profit/models/servico.dart';


class ServiceOrderButton extends StatelessWidget {

  ServiceOrderButton(this.serviceOrderBloc,this.servicesOrder);

  final ServiceOrderBloc serviceOrderBloc;
  final ServicesOrder servicesOrder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      child: StreamBuilder<ButtonState>(
          stream: serviceOrderBloc.outServiceButton,
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
                serviceOrderBloc.save(servicesOrder);
                Navigator.pop(context);
                //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Dados processados com sucesso')));
              }: null,
            );
          }
      ),
    );
  }
}

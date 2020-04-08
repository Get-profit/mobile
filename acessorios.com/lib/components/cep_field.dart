import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:get_profit/block/cep_bloc.dart';
import 'package:get_profit/models/address.dart';
import 'package:get_profit/screens/client/cliente_screen.dart';

class CepField extends StatefulWidget {

  CepField({this.decoration, this.style, this.onSaved});
  final InputDecoration decoration;
  final TextStyle style;
  final FormFieldSetter<Address> onSaved;

  @override
  _CepFieldState createState() => _CepFieldState();
}

class _CepFieldState extends State<CepField> {

  InputDecoration get decoration => widget.decoration;

  TextStyle get style => widget.style;

  FormFieldSetter<Address> get onSaved => widget.onSaved;

  CepBloc cepBloc;

  @override
  void initState() {
    super.initState();
    cepBloc = CepBloc();
  }


  @override
  void dispose() {
    cepBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CepBlocState>(
        initialData: CepBlocState(cepFieldState: CepFieldState.INITIALIZING),
        stream: cepBloc.outCep,
        builder: (context, snapshot) {
          if (snapshot.data.cepFieldState == CepFieldState.INITIALIZING)
            return Container();
          return Column(
            children: <Widget>[
              TextFormField(
                initialValue: snapshot.data.cep,
                decoration: decoration,
                style: style,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                onSaved: (c) {
                  print(snapshot.data.address);
                  onSaved(snapshot.data.address);
                },
                onChanged: cepBloc.onChanged,
                validator: (c) {
                  switch (snapshot.data.cepFieldState) {
                    case CepFieldState.INITIALIZING:
                    case CepFieldState.INCOMPLETE:
                    case CepFieldState.INVALID:
                      return "Campo Obrigatório";
                      break;
                    case CepFieldState.VALID:
                      break;
                  }
                  return null;
                },
              ),
              buildInformation(snapshot.data),
            ],
          );
        }
    );
  }


  Widget buildInformation(CepBlocState blocState) {
    switch (blocState.cepFieldState) {
      case CepFieldState.INITIALIZING:
      case CepFieldState.INCOMPLETE:
        return Container();
        break;
      case CepFieldState.INVALID:
        return Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          color: Colors.green.withAlpha(100),
          alignment: Alignment.center,
          child: Text(
            'Cep Inválido',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),

        );
        break;
      case CepFieldState.VALID:
        final _address = blocState.address;
        ClienteScreen(address: _address);
        return Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          color: Colors.green,
          alignment: Alignment.center,
          child: Text(
            'Localização: ${_address.district} - ${_address.city} - ${_address
                .federativeUnit}',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white),),

        );
        break;
    }
  }
}
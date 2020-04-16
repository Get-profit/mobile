import 'package:get_profit/models/cliente.dart';

class ServicesOrder {

  final int id;
  final int idCliente;
  final Cliente idClienteNavigation;
  final String status;
  final String dataEntrada;
  final String tipo;
  final String marca;
  final String modelo;
  final String defeito;
  final String descricao;
  final String senhaDesbloqueio;
  final double valorOrcado;
  final String dataSaida;


  ServicesOrder(
      {
      this.id,
      this.idCliente,
      this.idClienteNavigation,
      this.status,
      this.dataEntrada,
      this.tipo,
      this.marca,
      this.modelo,
      this.defeito,
      this.descricao,
      this.senhaDesbloqueio,
      this.valorOrcado,
      this.dataSaida
      }
      );

  @override
  String toString() {
    return 'Servico{id: $id, idCliente:$idCliente, idClienteNavigation:$idClienteNavigation,'
        ' status: $status,'
        ' dataEntrada: $dataEntrada,'
        ' tipo: $tipo'
        ' marca: $marca'
        ' modelo: $modelo'
        ' defeito: $defeito'
        ' descricao: $descricao'
        ' senhaDesbloqueio: $senhaDesbloqueio'
        ' valorOrcado: $valorOrcado'
        ' dataSaida: $dataSaida'
        '}';
  }

  ServicesOrder.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idCliente = json['idCliente'],
        idClienteNavigation = Cliente.fromJson(json['idClienteNavigation']),
        status = json['status'],
        dataEntrada = json['dataEntrada'],
        tipo = json['tipo'],
        marca = json['marca'],
        modelo = json['modelo'],
        defeito = json['defeito'],
        descricao = json['descricao'],
        senhaDesbloqueio = json['senhaDesbloqueio'],
        valorOrcado = json['valorOrcado'],
        dataSaida = json['dataSaida']
  ;

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'idCliente': idCliente,
        'idClienteNavigation': idClienteNavigation.toJson(),
        'status': status,
        'dataEntrada': dataEntrada,
        'tipo': tipo,
        'marca': marca,
        'modelo': modelo,
        'defeito': defeito,
        'descricao': descricao,
        'senhaDesbloqueio': senhaDesbloqueio,
        'valorOrcado': valorOrcado,
        'dataSaida': dataSaida,
      };
}

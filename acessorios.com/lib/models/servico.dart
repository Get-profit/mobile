import 'package:get_profit/models/cliente.dart';

class ServicesOrder {
  final int id;
  final Client idClient;
  final String status;
  final DateTime dataEntrada;
  final String tipo;
  final String marca;
  final String modelo;
  final String defeito;
  final String descricao;
  final String senhaDesbloqueio;
  final double valorOrcado;
  final DateTime dataSaida;


  ServicesOrder(
      this.id,
      this.idClient,
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
      );

  @override
  String toString() {
    return 'Contact{id: $id, name: ${idClient.nome},'
        ' status: $status,'
        ' dataEntrada: $dataEntrada,'
        ' tipo: $tipo,'
        ' marca: $marca'
        ' modelo: $modelo,'
        ' defeito: $defeito,'
        ' descricao: $descricao,'
        ' senhaDesbloqueio: $senhaDesbloqueio,'
        ' valorOrcado: $valorOrcado,'
        ' dataSaida: $dataSaida,'
        '}';
  }

  ServicesOrder.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idClient = Client.fromJson(json['id']),
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
        'idClient': idClient.toJson(),
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

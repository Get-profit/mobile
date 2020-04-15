class Cliente {
  final int id;
  final String nome;
  final String cpf;
  final String rg;
  final String telefone;
  final String email;
  final String cep;
  final String logradouro;
  final String bairro;
  final String cidade;
  final String estado;
  final int numero;


  Cliente(
      this.id,
      this.nome,
      this.cpf,
      this.rg,
      this.telefone,
      this.email,
      this.cep,
      this.logradouro,
      this.numero,
      this.bairro,
      this.cidade,
      this.estado,
      );

  @override
  String toString() {
    return 'Cliente{id: $id, name: $nome,'
        ' cpf: $cpf,'
        ' rg: $rg,'
        ' telefone: $telefone,'
        ' email: $email'
        ' cep: $cep,'
        ' logradouro: $logradouro,'
        ' bairro: $bairro,'
        ' numero: $numero,'
        '}';
  }

  Cliente.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        cpf = json['cpf'],
        rg = json['rg'],
        telefone = json['telefone'],
        email = json['email'],
        cep = json['cep'],
        logradouro = json['logradouro'],
        numero = json['numero'],
        bairro = json['bairro'],
        cidade = json['cidade'],
        estado = json['estado']
  ;

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'nome': nome,
        'cpf': cpf,
        'rg': rg,
        'telefone': telefone,
        'email': email,
        'cep': cep,
        'logradouro': logradouro,
        'bairro': bairro,
        'cidade': cidade,
        'estado': estado,
        'numero': numero,
      };
}

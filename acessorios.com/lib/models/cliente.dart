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
      this.bairro,
      this.cidade,
      this.estado,
      this.numero,
      );

  @override
  String toString() {
    return 'Contact{id: $id, name: $nome,'
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
        bairro = json['bairro'],
        cidade = json['cidade'],
        estado = json['estado'],
        numero = json['numero']
  ;

  Map<String, dynamic> toJson() =>
      {
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

class User {
  final int id;
  final String apelido;
  final String senha;
  final String cargo;
  User({
      this.id,
      this.apelido,
      this.senha,
      this.cargo,
      }
      );

  @override
  String toString() {
    return 'Usuario{id: $id, apelido: $apelido,'
        ' senha: $senha,'
        ' cargo: $cargo,'
        '}';
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        apelido = json['apelido'],
        senha = json['senha'],
        cargo = json['cargo']
  ;

  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'apelido': apelido,
        'senha': senha,
        'cargo': cargo,
      };
}

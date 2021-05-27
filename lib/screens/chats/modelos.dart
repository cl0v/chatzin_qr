import 'dart:convert';

class Mensagem {
  late String mensagem;
  late String remetente;

  Mensagem({required this.mensagem, required this.remetente});

  Mensagem.fromJson(Map<String, dynamic> json) {
    mensagem = json['mensagem'];
    remetente = json['remetente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mensagem'] = this.mensagem;
    data['remetente'] = this.remetente;
    return data;
  }
}

class Quadro {
  String titulo;
  String mensagem;
  Quadro({
    required this.titulo,
    required this.mensagem,
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'mensagem': mensagem,
    };
  }

  factory Quadro.fromMap(Map<String, dynamic> map) {
    return Quadro(
      titulo: map['titulo'],
      mensagem: map['mensagem'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Quadro.fromJson(String source) => Quadro.fromMap(json.decode(source));
}

class Tribo {
  String nome;
  //Pegar a referencia
  Tribo({
    required this.nome,
  });

  // String

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
    };
  }

  factory Tribo.fromMap(Map<String, dynamic> map) {
    return Tribo(
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tribo.fromJson(String source) => Tribo.fromMap(json.decode(source));

  //TODO: receber por get

}

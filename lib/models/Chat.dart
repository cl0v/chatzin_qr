import 'dart:convert';

enum ChatCategory {
  Tribo,
  Guilda,
}

class Chat {
  String title;
  String desc;
  //TODO: Data de entrada
  //TODO: Data de ultima mensagem
  //TODO: Notificacoes mais recentes(data)
  //enum
  ChatCategory categoria; //Se é guilda ou tribo Se eu achar q precisa, boto um tabview
  //TODO: Provavelmente receber a referencia pra um acesso direto ao chat

  Chat({
    required this.title,
    required this.desc,
    required this.categoria,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
      'categoria': categoria.index,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      title: map['title'],
      desc: map['desc'],
      categoria: ChatCategory.values[map['categoria']],
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) => Chat.fromMap(json.decode(source));
}

import 'dart:async';

import 'package:chatzin_qr/screens/chats/tribo_firestore.dart';

import '../../simple_bloc.dart';
import 'modelos.dart';

final userUID = 'tgAErOQtETQT8AMJQqy9mXx8h6X2';

//https://brasilapi.com.br/api/cep/v1/39890000
// CEP: #39890000

class MensagensBloc extends SimpleBloc<List<Mensagem>> {
  final String triboId;
  late final TriboFirebase tribo;

  MensagensBloc(this.triboId) {
    tribo = TriboFirebase(triboId: '58QGi5tkEyGN2YhaLwTI');
  }

  sendMessage() async {
    await tribo.sendMessage(
        Mensagem(remetente: 'Sei la mano', mensagem: 'Que isso tiu'));
  }

  connect() {
    subscribe(tribo.messages);
  }
}

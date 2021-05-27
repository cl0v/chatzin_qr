import 'package:chatzin_qr/screens/chats/tribo_firestore.dart';
import '../../simple_bloc.dart';
import 'modelos.dart';

final userUID = 'tgAErOQtETQT8AMJQqy9mXx8h6X2';

//https://brasilapi.com.br/api/cep/v1/39890000
// CEP: #39890000

class QuadrosBloc extends SimpleBloc<List<Quadro>> {
  final String triboId;
  late final TriboFirebase tribo;

  QuadrosBloc(this.triboId) {
    tribo = TriboFirebase(triboId: '58QGi5tkEyGN2YhaLwTI');
  }

  save() async {
    await tribo.saveQuadro(Quadro(mensagem: 'Oi', titulo: 'Nossa'));
  }

  connect() {
    subscribe(tribo.quadros);
  }
}

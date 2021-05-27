import 'package:chatzin_qr/screens/chats/tribo_firestore.dart';
import '../../../simple_bloc.dart';
import '../modelos.dart';

final userUID = 'tgAErOQtETQT8AMJQqy9mXx8h6X2';

//https://brasilapi.com.br/api/cep/v1/39890000
// CEP: #39890000

class GuildaBloc extends SimpleBloc<List<Guilda>> {
  final String triboId;
  late final TriboFirebase tribo;

  GuildaBloc(this.triboId) {
    tribo = TriboFirebase(triboId: '58QGi5tkEyGN2YhaLwTI');
  }

  save() async {
    await tribo.createGuilda(Guilda(nome: 'nome', desc: 'desc'));
  }

  connect() {
    subscribe(tribo.guildas);
  }
}

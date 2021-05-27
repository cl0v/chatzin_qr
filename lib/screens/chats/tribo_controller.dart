import 'package:chatzin_qr/screens/chats/blocs/guildas_bloc.dart';
import 'package:chatzin_qr/screens/chats/blocs/quadros_bloc.dart';

import 'blocs/messages_bloc.dart';

class TriboController {
  final messages = MensagensBloc('58QGi5tkEyGN2YhaLwTI');
  final quadros = QuadrosBloc('58QGi5tkEyGN2YhaLwTI');
  final guildas = GuildaBloc('58QGi5tkEyGN2YhaLwTI');
}
//TODO: Criar um bloc de mensagens

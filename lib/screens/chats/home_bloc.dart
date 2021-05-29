import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:chatzin_qr/models/chat.dart';
import 'package:chatzin_qr/models/user.dart';

import '../../simple_bloc.dart';

class HomeBloc extends SimpleBloc<List<Chat>> {
  late final _firestore;
  final User user;

  HomeBloc({required this.user}) {
    _firestore = UserFirestore(reference: user.reference!);
  }

  fetchChats() async {
    try {
      var list = await _firestore.chatStream;
      subscribe(list);
    } catch (e) {}
  }
}

class UserFirestore {
  DocumentReference<Map<String, dynamic>> reference;
  UserFirestore({
    required this.reference,
  });

  Stream<List<Chat>> get chatStream =>
      reference.collection('chats').snapshots().map((query) =>
          query.docs.map((doc) => Chat.fromMap(doc.data())).toList());

  Future<bool> addChat(Chat chat) async {
    try {
      //TODO: Fetch cep by api;
      //TODO: Pegar a resposta e adicionar aq
      reference.collection('chats').add(chat.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}

// class SimpleBloc<T> {
//   final _controller = StreamController<T>();
//   get stream => _controller.stream;

//   add(T obj) {
//     if (!_controller.isClosed) return _controller.sink.add(obj);
//   }

//   addError(Object err) {
//     if (!_controller.isClosed) return _controller.sink.addError(err);
//   }

//   dispose() => _controller.close();
// }

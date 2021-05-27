import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelos.dart';

class TriboFirebase {
  CollectionReference get reference =>
      FirebaseFirestore.instance.collection('tribos');

  TriboFirebase({
    required this.triboId,
  });

  final String triboId;

  Stream<List<Mensagem>> get messages =>
      reference.doc(triboId).collection('messagens').snapshots().map((query) =>
          query.docs.map((doc) => Mensagem.fromJson(doc.data())).toList());

  Future sendMessage(Mensagem mensagem) =>
      reference.doc(triboId).collection('messagens').add(mensagem.toJson());

  Stream<List<Quadro>> get quadros =>
      reference.doc(triboId).collection('quadros').snapshots().map((query) =>
          query.docs.map((doc) => Quadro.fromMap(doc.data())).toList());
  Future saveQuadro(Quadro quadro) =>
      reference.doc(triboId).collection('quadros').add(quadro.toMap());

  Stream<List<Guilda>> get guildas =>
      reference.doc(triboId).collection('guildas').snapshots().map((query) =>
          query.docs.map((doc) => Guilda.fromMap(doc.data())).toList());

  Future createGuilda(Guilda guilda) =>
      reference.doc(triboId).collection('guildas').add(guilda.toMap());
}

class GuildaFirestore {
  DocumentReference<Map<String, dynamic>> reference;
  GuildaFirestore({
    required this.reference,
  });

  Future<bool> join(String password) async {
    //TODO: Ja tem acesso? no, trai agen
    var map = await reference.get();
    if (map.data() != null) {
      return password == map.data()!['senha'];
    }
    return false;
  }

  Stream<List<Mensagem>> get messages =>
      reference.collection('messagens').snapshots().map((query) =>
          query.docs.map((doc) => Mensagem.fromJson(doc.data())).toList());

  Future sendMessage(Mensagem mensagem) =>
      reference.collection('messagens').add(mensagem.toJson());

  Stream<List<Quadro>> get quadros =>
      reference.collection('quadros').snapshots().map((query) =>
          query.docs.map((doc) => Quadro.fromMap(doc.data())).toList());
  Future saveQuadro(Quadro quadro) =>
      reference.collection('quadros').add(quadro.toMap());
}

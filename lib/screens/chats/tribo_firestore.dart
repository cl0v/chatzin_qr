import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelos.dart';

class TriboFirebase {
  final String triboId;

  TriboFirebase({required this.triboId});

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection('tribos');

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
}

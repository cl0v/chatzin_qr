import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String imgUrl;
  DocumentReference<Map<String, dynamic>>? reference;
  User({
    required this.id,
    required this.name,
    required this.imgUrl,
    
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imgUrl': imgUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      imgUrl: map['imgUrl'],
    );
  }

//TODO: save, get, put SharedPrefs usar exp do pedigree_seller

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

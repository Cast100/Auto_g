import 'package:cloud_firestore/cloud_firestore.dart';

class userModels {
  static const Name = "name";
  static const Email = "email";
  static const Id = "id";

  late String _name;
  late String _email;
  late String _id;

  String get name => _name;
  String get email => _email;
  String get id => _id;

  userModels.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.get(Name);
    _email = snapshot.get(Email);
    _id = snapshot.get(Id);
  }
}

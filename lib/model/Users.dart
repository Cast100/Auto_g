import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wazzi/model/users_dt.dart';

class UserService {
  String collection = "users";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> values) {
    String id = values["id"];
    firestore.collection(collection).doc(id).set(values);
  }

  void updateUserData(Map<String, dynamic> values) {
    firestore.collection(collection).doc(values['id']).update(values);
  }

  Future<userModels> getUserById(String id) =>
      firestore.collection(collection).doc(id).get().then((doc) {
        return userModels.fromSnapshot(doc);
      });
}

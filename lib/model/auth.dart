import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:wazzi/model/Users.dart';
import 'package:wazzi/model/users_dt.dart';

enum Status { Uninitialized, Unauthenticated, Authenticating, Authenticated }

class AuthProvider with ChangeNotifier {
  late FirebaseAuth _auth;
  late User _user;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late Status _status = Status.Uninitialized;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  UserService userService = UserService();
  late userModels usermodels;

  Status get status => _status;
  User get user => _user;
  userModels get usermodel => usermodels;

  final formKey = GlobalKey<FormState>();

  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((_onStateChanged) {});
  }

  Future<bool> signUp() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        firestore.collection('users').doc(result.user?.uid).set({
          'first': first.text,
          'last': last.text,
          'email': email.text,
          'id': result.user?.uid
        });
      });

      return true;
    } catch (e) {
      return _onError(e.toString());
    }
  }

  void clearController() {
    first.text = "";
    last.text = "";
    email.text = "";
    password.text = "";
  }

  bool _onError(String error) {
    _status = Status.Unauthenticated;
    notifyListeners();
    print("We got an error:$error");

    return false;
  }

  Future<void> _onStateChanged(User firebaseuser) async {
    if (firebaseuser == null) {
      _status = Status.Uninitialized;
    } else {
      _user = firebaseuser;
      _status = Status.Authenticated;
      usermodels = await userService.getUserById(firebaseuser.uid);
    }
  }

  @override
  notifyListeners();
}

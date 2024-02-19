import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wazzi/Main_page.dart';
import 'package:wazzi/sign_in.dart';

class Sign_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return MainPage();
              } else if (snapshot.hasData) {
                return Center(child: Text('Something Went Wrong'));
              } else {
                return SignIn();
              }
            }),
      );
}

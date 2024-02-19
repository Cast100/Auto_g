import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
//import 'package:waazi/Main_page.dart';
import 'package:wazzi/controller/login_controller.dart';
//import 'package:waazi/controller/opt.dart';
import 'package:wazzi/controller/phone.dart';
//import 'package:waazi/controller/register.dart';
import 'package:wazzi/controller/user_provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserProvider userProvider;

  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;

      /*userProvider.addUserData(
        currentUser: user,
        userEmail: user .email,
        userImage: user.photoURL,
        userName: user.displayName,
      );*/

      return user;
      // ignore: empty_catches
    } catch (e) {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFcecaaa),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 400,
            width: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Sign in To Continue'),
              Text(
                'Waazi',
                style: TextStyle(fontSize: 48, color: Colors.white, shadows: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.green.shade900,
                    offset: const Offset(2, 2),
                  )
                ]),
              ),
              Column(
                children: [
                  /*SignInButton(
                    Buttons.GoogleDark,
                    text: "login with Google",
                    onPressed: () async {
                      await _googleSignUp().then((value) =>
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Mainpage())));
                    },
                  ),*/
                  SignInButton(Buttons.Email, text: "Continue with Email",
                      onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Phone(),
                        ));
                  }),
                  SignInButton(
                    Buttons.Facebook,
                    text: "login with Facebook",
                    onPressed: () {
                      final provider =
                          Provider.of<loginControl>(context, listen: false);
                      provider.facebooklogin();
                    },
                  ),
                ],
              ),
              Column(
                children: const [
                  Text('By clicking on the button you accept our',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text('Terms of service and Privacy policy',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold))
                ],
              ),
            ]),
          )
        ]),
      ),
    );
  }
}

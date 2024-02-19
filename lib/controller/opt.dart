//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wazzi/controller/phone.dart';
import 'package:wazzi/controller/register.dart';

class Opt extends StatefulWidget {
  const Opt({Key? key}) : super(key: key);

  @override
  _OptState createState() => _OptState();
}

class _OptState extends State<Opt> {
  ///final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code = "";

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image.asset(
              'images/waaz.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Phone Verification',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You need to register your phone!!',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Pinput(
              length: 6,
              showCursor: true,
              onChanged: (value) {
                code = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  /*try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: Phone.verify, smsCode: code);
                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => sign_up()));
                  } catch (e) {
                    print('wrong otp');
                  }*/
                },
                child: const Text(
                  'Verify the Code',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            )
          ],
        )),
      ),
    );
  }
}

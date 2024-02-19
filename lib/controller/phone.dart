import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wazzi/controller/opt.dart';

class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);

  static String verify = "";
  @override
  PhoneState createState() => PhoneState();
}

class PhoneState extends State<Phone> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    countrycode.text = "+256";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(right: 25, left: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/waaz.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'sign up, Terms & Conditions and Privacy policy apply',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: 35,
                    child: TextField(
                      controller: countrycode,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
                /*Flexible(
                    child: TextField(
                  controller: countrycode,
                  decoration: InputDecoration(border: InputBorder.none),
                )),*/
                const Text(
                  "|",
                  style: TextStyle(fontSize: 33, color: Colors.grey),
                ),
                const Spacer(),
                Expanded(
                    child: TextFormField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    phone = value;
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "phone"),
                ))
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countrycode.text + phone}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      Phone.verify = verificationId;

                      ////Navigator.pushNamed(context, "opt");
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => Opt()));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );

                  //Navigator.pushNamed(context, "opt");
                },
                child: Text(
                  'Continue',
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

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:wazzi/Main_page.dart';
import 'package:wazzi/model/auth.dart';
import 'package:wazzi/widget/Loading.dart';
import 'package:wazzi/widget/themehelp.dart';

class sign_up extends StatelessWidget {
  final _key = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        key: _key,
        appBar: AppBar(
          leading: const BackButton(),
          backgroundColor: const Color.fromARGB(0, 75, 8, 8),
          elevation: 0,
          title: const Text(
            'Complete details',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.end,
          ),
        ),
        body: authProvider.status == Status.Authenticated
            ? Loading()
            : SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 20, 20, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Please enter your personal details to complete your profile',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: TextFormField(
                                controller: authProvider.first,
                                decoration: ThemeHelp()
                                    .textInputDecoration('First name'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: TextFormField(
                                  controller: authProvider.last,
                                  decoration: ThemeHelp()
                                      .textInputDecoration('Last name')),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: authProvider.email,
                        decoration: ThemeHelp().textInputDecoration('E-mail'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: authProvider.password,
                        decoration: ThemeHelp().textInputDecoration('Password'),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: ThemeHelp().buttonBoxDecoration(context),
                        child: ElevatedButton(
                          style: ThemeHelp().buttonStyle(),
                          onPressed: () async {
                            print("btn clicked");
                            if (!await authProvider.signUp()) {
                              Fluttertoast.showToast(
                                  msg: "Registration failed!!",
                                  gravity: ToastGravity.CENTER);

                              return;
                            }
                            authProvider.clearController();

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainPage()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}

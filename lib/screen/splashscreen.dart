import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wazzi/screen/slider.dart';

class splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => intoslider()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFcecaaa),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                "images/waaz.png",
                width: 180,
                height: 180,
              ),
              padding: const EdgeInsets.only(top: 20),
            )
          ],
        ),
      ),
    );
  }
}

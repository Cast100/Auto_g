import 'package:flutter/material.dart';
import 'package:wazzi/Home.dart';
import 'package:wazzi/Main_page.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        MainPage(),
        MyHome(),
      ],
    );
  }
}

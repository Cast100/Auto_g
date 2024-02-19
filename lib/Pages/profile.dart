// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';

class profile_page extends StatelessWidget {
  final VoidCallback openDrawer;

  const profile_page({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Profile'),
          //leading: buildDrawer(onClicked: openDrawer),
        ),
      );
}

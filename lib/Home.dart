import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:wazzi/Main_page.dart';
import 'package:wazzi/Pages/chat.dart';
import 'package:wazzi/Pages/daily.dart';

class MyHome extends StatefulWidget {
  @override
  myhome createState() => myhome();
}

class myhome extends State<MyHome> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildpage(),
      bottomNavigationBar: buildbottomNavigationBar(),
    );
  }

  Widget buildbottomNavigationBar() {
    return BottomNavyBar(
      selectedIndex: index,
      onItemSelected: (index) => setState(() => this.index = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          textAlign: TextAlign.start,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.timelapse_outlined),
          title: const Text('Daily tips'),
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.chat),
          title: const Text('Chat'),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildpage() {
    switch (index) {
      case 1:
        return tips();
      case 2:
        return chat();
      case 0:
      default:
        return MainPage();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeHelp {
  InputDecoration textInputDecoration(
      [String labelText = "", String hitText = ""]) {
    return InputDecoration(
      labelText: labelText,
      //hintText: hintText,
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.grey)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.red, width: 20.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    );
  }

  BoxDecoration buttonBoxDecoration(BuildContext context,
      [String color1 = "", String color2 = ""]) {
    Color c1 = Theme.of(context).primaryColor;
    Color c2 = Theme.of(context).primaryColor;
    if (color1.isEmpty == false) {
      c1 = HexColor(color1);
    }
    if (color2.isEmpty == false) {
      c2 = HexColor(color2);
    }
    return BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
      ],
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.0, 1.0],
          colors: [c1, c2]),
      color: Colors.red.shade300,
      borderRadius: BorderRadius.circular(30),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        )),
        minimumSize: MaterialStateProperty.all(const Size(50, 50)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent));
  }
}

class LoginFormStyle {}

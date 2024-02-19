// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String> onChanged;
  final int maxLines;

  TextFieldWidget({
    required this.label,
    required this.onChanged,
    required this.text,
    this.maxLines = 1,
  });

  @override
  _textfieldpageState createState() => _textfieldpageState();
}

class _textfieldpageState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLength: widget.maxLines,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      );
}

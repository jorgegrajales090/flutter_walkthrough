import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  final TextInputType type;
  final String description;

  InputTextWidget(this.type, this.description);

  @override
  _InputState createState() => _InputState(this.type, this.description);
}

class _InputState extends State<InputTextWidget> {
  final TextInputType type;
  final String description;

  _InputState(this.type, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
      keyboardType: this.type,
      decoration: InputDecoration(
          labelText: this.description, hintText: "Write a value"),
    ));
  }
}

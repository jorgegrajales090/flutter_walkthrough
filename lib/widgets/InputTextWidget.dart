import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  final TextInputType type;
  final String description;
  final TextEditingController controller;

  InputTextWidget(this.type, this.description, this.controller);

  @override
  _InputState createState() =>
      _InputState(this.type, this.description, this.controller);
}

class _InputState extends State<InputTextWidget> {
  final TextInputType type;
  final String description;
  final TextEditingController controller;

  _InputState(this.type, this.description, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
      controller: this.controller,
      obscureText: TextInputType.visiblePassword == this.type,
      keyboardType: this.type,
      decoration: InputDecoration(
          labelText: this.description, hintText: "Write a value"),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'loginRoute.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(brightness: Brightness.light), home: LoginRoute());
  }
}

class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String selected = "Abogado";
  var elements = ["Abogado", "Medico", "Ingeniero"];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DropdownButton(
            value: selected,
            items: elements.map((String item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChanged: (String value) {
              setState(() {
                selected = value;
              });
            }));
  }
}

class CheckboxInput extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CheckboxInput> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CheckboxListTile(
      title: Text("Acepto terminos y condiciones"),
      value: selected,
      onChanged: (bool value) {
        setState(() {
          selected = value;
        });
      },
    ));
  }
}

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

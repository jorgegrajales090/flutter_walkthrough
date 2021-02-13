import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/homeRoute.dart';

import 'widgets/InputTextWidget.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Profile")), body: LoginWidget());
  }
}

class LoginWidget extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Login", style: TextStyle(fontSize: 20))),
            Center(
                child: Container(
                    padding: EdgeInsets.all(10),
                    width: 90,
                    height: 90,
                    child: Image(
                        image: NetworkImage("http://bit.ly/flutter_tiger")))),
            InputTextWidget(
                TextInputType.emailAddress, "Username", usernameController),
            InputTextWidget(
                TextInputType.visiblePassword, "Password", passwordController),
            TextButton(
                child: Text("Login"),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, primary: Colors.white),
                onPressed: () {
                  login(context);
                })
          ],
        ));
  }

  Future<String> login(BuildContext context) async {
    String endpoint = "http://10.0.2.2:5000/login";
    String parameters = "?username=" +
        usernameController.text +
        "&" +
        "password=" +
        passwordController.text;
    var response = await http.get(endpoint + parameters);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var map = jsonDecode(jsonString);
      var token = map["token"];

      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", token);

      changeRoute(context);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("There was an error: Status code " +
              response.statusCode.toString())));
    }

    return "";
  }

  void changeRoute(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeRoute()));
  }
}

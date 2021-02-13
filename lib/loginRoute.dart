import 'package:flutter/material.dart';
import 'package:flutter_application/homeRoute.dart';

import 'widgets/InputTextWidget.dart';

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
                TextInputType.emailAddress, "Email", usernameController),
            InputTextWidget(
                TextInputType.visiblePassword, "Password", passwordController),
            TextButton(
                child: Text("Login"),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue, primary: Colors.white),
                onPressed: () async {
                  login(context);
                })
          ],
        ));
  }

  void login(BuildContext context) async {}

  void changeRoute(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeRoute()));
  }
}

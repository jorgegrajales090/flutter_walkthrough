import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My app title")),
        drawer: Drawer(
            child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                "Usuario Areamovil",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("Home"),
            ),
            ListTile(title: Text("Actividades"))
          ],
        )),
        body: HomeWidget());
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(children: [
              Container(
                  padding: EdgeInsets.all(10),
                  width: 60,
                  height: 60,
                  child: Image(
                      image: NetworkImage("http://bit.ly/flutter_tiger"))),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Clase de inglés"), Text("8pm")])
            ]),
            Row(children: [
              Container(
                  padding: EdgeInsets.all(10),
                  width: 60,
                  height: 60,
                  child: Image(
                      image: NetworkImage("http://bit.ly/flutter_tiger"))),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Clase de flutter"), Text("8pm")])
            ]),
            Row(children: [
              Container(
                  padding: EdgeInsets.all(10),
                  width: 60,
                  height: 60,
                  child: Image(
                      image: NetworkImage("http://bit.ly/flutter_tiger"))),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Clase de angular"), Text("8pm")])
            ])
          ],
        ));
  }
}

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Colors.blue,
                child: Text("Body", style: TextStyle(fontSize: 30)),
                width: 100.0,
                height: 50.0,
                padding: EdgeInsets.all(5.0)),
            Container(
                color: Colors.red,
                width: 100.0,
                height: 100.0,
                child:
                    Image(image: NetworkImage("http://bit.ly/flutter_tiger"))),
            Container(
                width: 100.0,
                height: 100.0,
                child: Image(image: AssetImage("assets/images.png")))
          ],
        ));
  }
}

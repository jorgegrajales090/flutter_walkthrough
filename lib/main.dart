import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: HomeRoute()
    );
  }
}

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My app title")
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text("Usuario Areamovil", style: TextStyle(fontSize: 20, color: Colors.white),),
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
              ),
              ListTile(
                title: Text("Home"),
              ),
              ListTile(
                title: Text("Profile"),
                onTap: () => changeRoute(context)
              )
            ],
          )
        ),
        body: ColumnWidget()
      );
  }

  void changeRoute(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ProfileRoute()
    ));
  }

}

class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [        
        Container(
          color: Colors.blue,
          child: Text("Body", style: TextStyle(fontSize: 30)),
          width: 100.0,
          height: 50.0,
          padding: EdgeInsets.all(5.0)
        ),
        Container(
          color: Colors.red,
          width: 100.0,
          height: 100.0,
          child: Image(image: NetworkImage("http://bit.ly/flutter_tiger"))
        ),
        Container(
          width: 100.0,
          height: 100.0,
          child: Image(image: AssetImage("assets/images.png"))
        )
      ],
    );
  }
}

class ProfileRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile")
      ),
      body: ColumnFormWidget()
    );
  }
}

class ColumnFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Perfil", style: TextStyle(fontSize: 20)),
          InputTextWidget(TextInputType.text, "Name"),
          InputTextWidget(TextInputType.emailAddress, "Email"),
          InputTextWidget(TextInputType.number, "Phone"),
          SizedBox(height: 20),
          Text("Profesión"),
          DropdownWidget(),
          CheckboxInput(),
          TextButton(
            child: Text("Register"),
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              primary: Colors.white
            ),
            onPressed: () {}
          )
        ],
      )
    );
  }
}

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
          labelText: this.description,
          hintText: "Write a value"
        ),
      )
    );
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
        items: elements.map((String item)
        {
          return DropdownMenuItem(
            value: item,
            child: Text(item)
          );
        }).toList(),
        onChanged: (String value)
        {
          setState(() {
            selected = value;
          });
        }
      )
    );
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
        onChanged: (bool value)
        {
            setState(() {
              selected = value;
            });
        },
      )
    );
  }
}
# Flutter Walkthrough

# Links

Flutter Showcase

https://flutter.dev/showcase

Flutter install

https://flutter.dev/docs/get-started/install

Dart

https://dart.dev/docs

Dart Online

https://dart.dev/#try-dart

Flutter studio (Flutter widget designer)

https://flutterstudio.app

Flutter Widget catalog

https://flutter.dev/docs/development/ui/widgets

Flutter debugging

https://flutter.dev/docs/testing/debugging

Dart packages

https://pub.dev/

Internationalize fluttter apps

https://flutter.dev/docs/development/accessibility-and-localization/internationalization


Add2App
https://github.com/flutter/flutter/wiki/Add-Flutter-to-existing-apps

Cupertino widgets
https://flutter.dev/docs/development/ui/widgets/cupertino

Platform widgets (Writing some widgets to both platforms)
https://pub.dev/packages/flutter_platform_widgets

Publish android app
https://flutter.dev/docs/deployment/android

Publish IOS app
https://flutter.dev/docs/deployment/ios

# Dart

## Main program

```bash
main() {
  print("Hello, World! ");
}
```

## Variables
```bash

//Inferred
var var_name = "Jorge";

//Flexible (Not limited to a single type)
dynamic dyn_name = "Jorge";

//Explicit
String str_name = "Jorge";

main() {
  print("Hello, World! " + var_name);
}

```

## Const and final
```bash
//Final, the value could be known at runtime.
final date = new DateTime.now();

//Const, the value must be known at compile time.
const String date_const = "2021-01-30";

//Error!
const date_const1 = new DateTime.now();

```

## Functions
```bash
//Required and optional parameter
bool isNumberEven(int number, [int number1]) {
  return number % 2 == 0;
}

//With one sentence
bool isNumberEven(int number, [int number2]) => number % 2 == 0;

```
### Function call

```bash
bool isEven = isNumberEven(9);
bool isEven = isNumberEven(9, 2);
  
```

## Conditionals and switch

### Conditionals
```bash

if (isRaining()) {
  you.bringRainCoat();
} else if (isSnowing()) {
  you.wearJacket();
} else {
  car.putTopDown();
}
  
```

### Switch
```bash
switch (command) {
  case 'CLOSED':
    executeClosed();
    break;
  case 'PENDING':
  case 'APPROVED':
    executeApproved();
    break;
  default:
    executeUnknown();
}
  
```

## Loops

### For

```bash
var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(i);
  }
  
  callbacks.forEach((c) => print(c));
  
```
### For through a list
```bash
var numbers = [1, 2, 3];
for (var x in numbers) {
  print(x); // 1 2 3
}
  
```

### While
```bash
while (!isDone()) {
  doSomething();
}
  
```

## Exceptions
```bash

try {
  //Throwing an exception
  throw Exception('Division by zero');
} on Exception catch (e) {
  print('Unknown exception: $e');
} finally {
  print('The end');
}
  
```
## Class
```bash
class Person
{
  //name and lastname have implicit getter and setter
  String name, lastname;
  
  //Default constructor, the class only can have one
  Person()
  {
    name = "Jorge";
    lastname = "Grajales";
  }
  
  //Named constructor
  Person.withNames(String name, String lastname)
  {
    this.name = name;
    this.lastname = lastname;
  }
}

//Creating instances
var person = new Person();
var person = new Person.withNames("Juan", "Velez");

```

### Abstract classes
```bash
abstract class Person
{
  String name, lastname;
  Person()
  {
    this.name = "Julia";
    this.lastname = "Doe";
  }
  
  Person.withNames(String name, String lastname)
  {
    this.name = name;
    this.lastname = lastname;
  }
  
  String getFullName()
  {
    return name + " " + lastname;
  }
}

//Using extends to inherit from a class
class Programmer extends Person
{
  //Using super to connect with the default constructor in base class.
  Programmer() : super();
  
  //Using super.withNames to connect with the withNames constructor in base class.
  Programmer.withNames(String name, String lastname) : super.withNames(name, lastname);    
  
  void getFullPresentation()
  {
    print("I am " + super.getFullName() + " a programmer");
  }
  
}

main() {
  //Creating the instances
  var p1 = new Programmer();
  var p2 = new Programmer.withNames("Juan", "Velez");
  
  p1.getFullPresentation();
  p2.getFullPresentation();
}

```
# Layouts

## Base Layout

```bash
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App title")
        ),
        body: Center(
          child: Text("My app content",
            style: TextStyle(
              fontSize: 24
            )
          )
        )
      )
    );
  }
}

```

## Containers

```bash
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App title")
        ),
        body: RowWidget()
      )
    );
  }
}

class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Container(
              color: Colors.blue,
              child: Text("My app content",
                style: TextStyle(
                  fontSize: 24
                )
              ),
              width: 250.0,
              height: 100.0,
              padding: EdgeInsets.all(10)
            ),
            Container( 
              width: 100.0,
              height: 100.0,
              child: Image (image: NetworkImage('http://bit.ly/flutter_tiger'))
            ),
            Container( 
              width: 100.0,
              height: 100.0,
              child: Image (image: AssetImage('assets/tiger.png'))
            )
          ]
      );
  }
}

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
              color: Colors.blue,
              child: Text("My app content",
                style: TextStyle(
                  fontSize: 18
                )
              ),
              width: 150.0,
              height: 50.0,
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(10)
            ),
        Container( 
              width: 100.0,
              height: 100.0,
              child: Image (image: NetworkImage('http://bit.ly/flutter_tiger'))
            ),
            Container( 
              width: 100.0,
              height: 100.0,
              child: Image (image: AssetImage('assets/tiger.png'))
            )
      ],
    );
  }
}
```
## Layouts de navegacion (Drawer)

```bash
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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

class ProfileRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My App title")
        ),
        body: Container(
          child: Text("Profile route")
        )
    );
  }
}

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My App title")
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text("Jorge Grajales",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
              ),
              ListTile(
                title: Text("Home")
              ),
              ListTile(
                title: Text("Perfil"),
                onTap: () => changeRoute(context),
              )
            ],
          )
        ),
        body: Text("Home route")
      );

      
  }

  void changeRoute(BuildContext context){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ProfileRoute()
        ));
      }
}

```

## Forms

```bash
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

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
        title: Text("Form")
      ),
      body : Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Registro", style: TextStyle(fontSize: 18)),
            InputText(TextInputType.text, "Name"),
            InputText(TextInputType.emailAddress, "Email"),
            InputText(TextInputType.number, "Phone"),
            SizedBox(height: 20),
            Text("Profesión"),
            DropdownInput(),
            CheckboxInput(),
            TextButton(
              child: Text("Register"),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white
              ),
              onPressed: () {},
            )
          ],
        )
      )
    );
  }
}

class InputText extends StatefulWidget {

  final TextInputType type;
  final String description;

  InputText(this.type, this.description);

  @override
  State<StatefulWidget> createState() => InputTextState(this.type, this.description);
  
}

class InputTextState extends State<InputText>
{
  TextInputType inputType;
  String description;

  InputTextState(this.inputType, this.description);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: TextField(
        keyboardType: this.inputType,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: this.description,
          hintText: this.description
        ),
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

class DropdownInput extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropdownInput> {
  var selectedValue = "Médico";

  var elements = <String>[ "Médico", "Abogado", "Ingeniero"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        value: selectedValue,
        onChanged: (String value){
          setState(() {
            selectedValue = value;
          });
        },
        items: elements.map((String item){
          return DropdownMenuItem(
            value: item,
            child: Text(item));
        }).toList()
      )
    );
  }
}

```

### ListView builder

```bash

Widget buildListView(BuildContext context, List<ActivityModel> elements) {
    return ListView.builder(
      itemCount: elements.length,
      itemBuilder: (context, index) {
        return Row(children: [
          Container(
              padding: EdgeInsets.all(10),
              width: 60,
              height: 60,
              child: Image(image: NetworkImage("http://bit.ly/flutter_tiger"))),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(elements[index].description),
            Text(elements[index].description)
          ])
        ]);
      },
    );
  }
  
class ActivityModel {
  String imageUrl;
  String description;
  String dateTime;
}

```

# Asynchronous operations

## Futures

```bash

Future<String> getData() {
  return Future.delayed(Duration(seconds: 8), () => "Delayed by 8 seconds");
}

var response = getData();
response.then((s) {
  //Do some stuff with the future string response
});

```

## Futures nested

```bash

Future<String> getData() {
  return Future.delayed(Duration(seconds: 8), () => "Delayed by 8 seconds");
}

Future<String> getData1() {
  return Future.delayed(Duration(seconds: 10), () => "Delayed by 10 seconds");
}

var response = getData();
response.then((s) {
  //Do some stuff with the future string response
  print(s);
  var response1 = getData1();
  response1.then((s1) {
    print(s1);
  });
});

```

## Futures with async/await with error handling

```bash

Future<String> getData() async {
  return Future.delayed(Duration(seconds: 8), () => "Delayed by 8 seconds");
}

Future<String> getData1() async {
  return Future.delayed(Duration(seconds: 10), () => "Delayed by 10 seconds");
}

void main()
{
  try{
    var response = await getData();
    var response1 = await getData1();
  } catch(e) {}
}

```
## Using http function

### Dependency on pubspec.yaml

```bash

dependencies:
  http: ^0.12.2

```
### Import the package

```bash

import 'package:http/http.dart' as http;

```

### Using the http GET

```bash

var result = await http.get("http://10.0.2.2:5000/login?username=" +
    usernameController.text +
    "&password=" +
    passwordController.text);
if (result.statusCode == 200)
  changeRoute(context);
else {
  Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("There was an error: Status code " +
          result.statusCode.toString())));
}

```

### Using the HttpClient

```bash

Future<List<ActivityModel>> getActivities() async {
    HttpClient client = HttpClient();
    var request =
        await client.getUrl(Uri.parse("http://10.0.2.2:5000/activity"));

    var response = await request.close();

    if (response.statusCode == 200) {
      //For later
      //var responseDecoded = response.transform(utf8.decoder);
    } else {
      var activityList = new List<ActivityModel>();
      var activity = new ActivityModel();
      activity.description = "Empty list";
      activity.dateTime = "Empty list";
      activityList.add(activity);

      return activityList;
    }

    return new List<ActivityModel>();
  }
  
```

### Using a FutureBuilder widget

```bash

Container(
  padding: EdgeInsets.all(10.0),
  child: FutureBuilder<List<ActivityModel>>(
      future: activityList,
      builder: (context, snapshot) {
        return buildListView(context, snapshot.data);
      }
  )
);
            
```

### Model to serialize/deserialize from json

```bash

class ActivityModel {
  String imageUrl;
  String description;
  String dateTime;

  ActivityModel({this.imageUrl, this.description, this.dateTime});

  String toJson() {
    var activityMap = {
      "imageUrl": this.imageUrl,
      "description": this.description,
      "dateTime": this.dateTime
    };

    var json = jsonEncode(activityMap);

    return json;
  }

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
        imageUrl: json["imageUrl"],
        description: json["description"],
        dateTime: json["dateTime"]);
  }
}

```

## Basic token 

```bash

String getAccessToken() {
    var credentials = "user:password";
    var bytes = utf8.encode(credentials);
    var token = base64.encode(bytes);

    return token;
  }

```

## HttpClient with authorization, FutureBuilder

```bash

  @override
  void initState() {
    super.initState();
    activityList = getActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder<List<ActivityModel>>(
            initialData: List<ActivityModel>(),
            future: activityList,
            builder: (context, snapshot) => snapshot.hasData
                ? buildListView(context, snapshot.data)
                : const SizedBox()));
  }

  Future<List<ActivityModel>> getActivities() async {
    HttpClient client = HttpClient();
    var request =
        await client.getUrl(Uri.parse("http://10.0.2.2:5000/activity"));

    request.headers
        .add(HttpHeaders.authorizationHeader, "Basic " + this.getAccessToken());

    var response = await request.close();

    var activityList = new List<ActivityModel>();

    if (response.statusCode == 200) {

      var result = new StringBuffer();
      await for (var contents in response.transform(Utf8Decoder())) {
        result.write(contents);
      }

      var activities = jsonDecode(result.toString()) as List;

      return activities
          .map((activity) => ActivityModel.fromJson(activity))
          .toList();
          
    } else {
      var activity = new ActivityModel();
      activity.description = "Empty list";
      activity.dateTime = "Empty list";
      activityList.add(activity);
    }

    return activityList;
  }
  
```
## Saving data on device

https://pub.dev/packages/shared_preferences

### Adding the dependency

```bash

shared_preferences: "<newest version>"

```

### Saving data

```bash

// obtain shared preferences
final prefs = await SharedPreferences.getInstance();

// set value
prefs.setInt('counter', counter);


```

### Getting data

```bash

final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
final counter = prefs.getInt('counter') ?? 0;


```

### Removing data

```bash

final prefs = await SharedPreferences.getInstance();

prefs.remove('counter');


```
## Pruebas unitarias

### Dependencies

```bash

dev_dependencies:
  test: ^1.15.7
  mockito: ^4.1.4

```

### Creating a mock

```bash

```

## Firebase

Android build.gradle inside dependencies section

```bash

classpath "com.google.gms:google-services:4.3.5"

//At the end
apply plugin: "com.google.gms.google-services"

```

Dependency on pubspec.yaml

```bash

cloud_firestore: ^0.16.0+1

```

### Creating a streamBuilder

```bash

return Container(
        padding: EdgeInsets.all(10.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('activities').snapshots(),
            builder: (context, snapshot) => snapshot.hasData
                ? buildListView(context, snapshot.data.documents)
                : const Text("Loading...")));
                
```

### Which platform is running

```bash

  if(Platform.isAndroid)
  
  if(Platform.isIOS)

```


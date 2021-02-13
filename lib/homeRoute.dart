import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class HomeWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeWidget> {
  Future<List<ActivityModel>> activityFuture;

  @override
  void initState() {
    super.initState();

    activityFuture = getActivities();
  }

  @override
  Widget build(BuildContext context) {
    List<ActivityModel> emptyList = List<ActivityModel>();
    return Container(
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder<List<ActivityModel>>(
            initialData: emptyList,
            future: activityFuture,
            builder: (context, snapshot) => snapshot.hasData
                ? buildListView(context, snapshot.data)
                : buildListView(context, emptyList)));
  }

// buildListView(context, new List<ActivityModel>())

  Widget buildListView(BuildContext context, List<ActivityModel> elements) {
    return ListView.builder(
      itemCount: elements.length,
      itemBuilder: (context, index) {
        return Row(children: [
          Container(
              padding: EdgeInsets.all(10),
              width: 60,
              height: 60,
              child: Image(image: NetworkImage(elements[index].imageUrl))),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(elements[index].description),
            Text(elements[index].dateTime)
          ])
        ]);
      },
    );
  }

  Future<List<ActivityModel>> getActivities() async {
    HttpClient client = HttpClient();

    String endpoint = "http://10.0.2.2:5000/activity";

    var request = await client.getUrl(Uri.parse(endpoint));

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    request.headers.add(HttpHeaders.authorizationHeader, "Basic " + token);

    var response = await request.close();

    var activityList = new List<ActivityModel>();

    if (response.statusCode == 200) {
      var result = StringBuffer();

      await for (var content in response.transform(Utf8Decoder())) {
        result.write(content);
      }

      var jsonString = result.toString();
      var list = jsonDecode(jsonString) as List;

      var activityList = list.map((record) => ActivityModel(record)).toList();

      return activityList;
    } else {
      var activity = new ActivityModel.fromStrings();
      activity.imageUrl = "http://bit.ly/flutter_tiger";
      activity.description = "Empty list";
      activity.dateTime = "Empty list";
      activityList.add(activity);
    }

    return activityList;
  }

  String getAccessToken() {
    var credentials = "user:password";
    var bytes = utf8.encode(credentials);
    var token = base64.encode(bytes);

    return token;
  }
}

class ActivityModel {
  String imageUrl;
  String description;
  String dateTime;

  ActivityModel.fromStrings();

  ActivityModel(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    this.imageUrl = json["imageUrl"];
    this.description = json["description"];
    this.dateTime = json["dateTime"];
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'shopList.dart';

// class Shopping extends StatefulWidget {
//   @override
//   State<Shopping> createState() => _Shopping();
// }
// class _Shopping extends State<Shopping> {
//   Future<List<ShoppingList>> getEvtRequest() async {
//     String url = "http://localhost/item.json";
//     final response = await http.get(Uri.parse(url));
//     var responseData = json.decode(response.body);
//     print(responseData);
//     List<ShoppingList> eventsJsonList = [];
//     for (var singleUser in responseData) {
//       ShoppingList user = ShoppingList(
//              company: singleUser["company"].toString(),
//           name: singleUser["name"].toString()
//       );
//       eventsJsonList.add(user);
//     }
//     return eventsJsonList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Http Get Request."),
//           leading: Icon(  Icons.get_app, ),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(16.0),
//           child: FutureBuilder(
//             future: getEvtRequest(),
//             builder: (BuildContext ctx, AsyncSnapshot snapshot) {
//               if (snapshot.data == null) {
//                 return Container(
//                   child: Center(
//                     child:
//                     CircularProgressIndicator(),
//                   ),
//                 );
//               }
//               else {
//                 return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (ctx, index) =>
//                       ListTile(
//                         title:
//                         Text(snapshot.data[index].name),
//                         subtitle:
//                         Text(snapshot.data[index].company),
//                         contentPadding:
//                         EdgeInsets.only(bottom: 20.0),
//                       ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
 
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});
 
  @override
  State<Shopping> createState() => _Shopping();
}
 
class _Shopping extends State<Shopping> {
  List<User?>? allUserData = [];
  var ct1 = TextEditingController();
  var ct2 = TextEditingController();
 
  _write() async {
    String text = "";
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/user.json');
      text = await file.readAsString();
      var userdata = userFromJson(text);
      userdata!.add(
        User(username: ct1.text.trim(), password: ct2.text.trim()),
      );
      log("USER DATA $userdata");
      file.writeAsString(userToJson(userdata));
      getData();
    } catch (e) {
      print("Couldn't read file $e");
    }
  }
 
  void getData() async {
    final Directory directory = await getApplicationDocumentsDirectory();

    final File file = File('${directory.path}/user.json');
    String text = await file.readAsString();
    setState(() {
      allUserData = userFromJson(text);
    });
  }
 
  @override
  void initState() {
    super.initState();
    getData();
  }
 
  @override
  Widget build(BuildContext context) {
    log("INIT value $allUserData");
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ct1,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ct2,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _write,
              child: Text(
                "Write ",
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allUserData!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    child: ListTile(
                      title: Text("Username: ${allUserData![index]!.username}"),
                      subtitle:
                          Text("Password: ${allUserData![index]!.password}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
List<User?>? userFromJson(String str) => json.decode(str) == null
    ? []
    : List<User?>.from(json.decode(str)!.map((x) => User.fromJson(x)));
 
String userToJson(List<User?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));
 
class User {
  User({
    required this.username,
    required this.password,
  });
 
  String? username;
  String? password;
 
  User copyWith({
    String? username,
    String? password,
  }) =>
      User(
        username: username ?? this.username,
        password: password ?? this.password,
      );
 
  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        password: json["password"],
      );
 
  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
  @override
  String toString() {
    return "{ username : $username, password : $password }";
  }
}
 

import 'package:flutter/material.dart';
import 'package:try_app/BCIIT/Assignment/Login%20and%20NavBar/LoginPage.dart';
import 'package:try_app/BCIIT/Fibonacci.dart';

class Settings extends StatefulWidget{
  const Settings ({super.key});

  @override
  State<Settings> createState() => _Settings();
}

class Options{
final String category;
late final String detail;

  Options(this.category, this.detail);
}

class _Settings extends State<Settings>{
  List<Options> options = [
     Options('Version', '1.2.5'),
     Options('Terms & Conditions', 'Read Carefully'),
     Options('Privacy Policy', 'Your safety is in your own hands'),
     Options('Support', 'Donate'),
     Options('LogOut', 'See You Soon'),
  ];
  @override
  Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("About"),
        ),
       body: ListView.builder(
          itemCount: options.length,
        itemBuilder:((context, index) {
          final option = options[index];

          return Card(
          child: ListTile(
            //leading: const CircleAvatar(
            //radius:28, 
            //backgroundImage: NetworkImage(option.url)
            //),
            title: Text(option.category),
            subtitle: Text(option.detail),
            //trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              if (index == 4){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),),);
              }
            },
          ),
        );
        })
      ),
      ),
      );
  }
}
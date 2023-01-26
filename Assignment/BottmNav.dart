import 'package:flutter/material.dart';
import 'package:try_app/BCIIT/Assignment/ImageContainer.dart';

class Nav extends StatefulWidget{
  const Nav ({super.key});

  @override
  State<Nav> createState() => _Nav();
}

class _Nav extends State<Nav>{
  int currIndex =0;
var txt ="";
  @override
  Widget build(BuildContext context){
      return MaterialApp(
            debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Navigation'),
        ),
       body: const Text("Home page"),
       floatingActionButton: FloatingActionButton.extended(onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => const Cont(),),);
       },
       label: const Text("Image Page"),
       ),

       bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (value) {
          if (value == 0){
            txt = "Home";
          } else if (value == 1){
            txt = "Call";
          } else if (value == 2){
            txt = "Message";
          } else if (value == 3){
            txt = "WhatsApp";
          }
          setState((() => currIndex = value),);
        }, 
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.shifting,
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "CALLS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "MESSAGE",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatsapp),
            label: "WHATSAPP",
          ),
        ],
      ),
       
      ),
      );
  }
}
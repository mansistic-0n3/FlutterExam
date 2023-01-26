import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:try_app/BCIIT/Assignment/Dice%20Game/GameDice.dart';
import 'package:try_app/BCIIT/Assignment/Dice%20Game/GamePlayer.dart';
import 'package:try_app/BCIIT/Assignment/Login%20and%20NavBar/Settings.dart';
import 'package:try_app/BCIIT/Assignment/Login%20and%20NavBar/OrientationPhn.dart';
import 'package:try_app/BCIIT/basicCal.dart';

class Welcome extends StatefulWidget{
  final String title;
  const Welcome ({super.key, required this.title});

  @override
  State<Welcome> createState() => _Welcome();
}

class _Welcome extends State<Welcome>{
TextEditingController msg = TextEditingController();

  int currIndex =0;
  var txt ="";
  @override
  Widget build(BuildContext context){
  ToastContext().init(context);
      return MaterialApp(
            debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
       body: Column(
         children: [
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Welcome \n',
                style: TextStyle(
                  foreground: Paint()
                  ..shader = const LinearGradient(colors: <Color>[
                    Colors.blue,
                    Colors.redAccent,
                  ]).createShader(const Rect.fromLTWH(100, 0, 200, 100)),
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Enter text to get toast message!',
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                  ..shader = const LinearGradient(colors: <Color>[
                    Colors.blue,
                    Colors.redAccent,
                  ]).createShader(const Rect.fromLTWH(100, 0, 200, 100)),
                    ),
                  ),
                ]
              ) ,
              
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(22.0),
             child: TextField(
                  controller: msg,
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  decoration: InputDecoration(
                    labelText: "Message",
                    hintText: "Type a Message",
                    icon: const Icon(Icons.textsms_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
           ),
         ],
       ),
       floatingActionButton: FloatingActionButton.extended(onPressed: () {
        var Message = msg.text;

        if(Message.isEmpty){
          Message = "Hello! Please write a message to display";
        }

        Toast.show("$Message", duration: 2, gravity: 0);
       },
       tooltip: "move",
       icon: const Icon(Icons.notification_add),
       label: const Text("Toast Message"),
       ),

       bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (value) {
          if (value == 0){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome(),),);
            txt = "Home";
          } else if (value == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const OrientationPhn(),),);
            txt = "Features";
          } else if (value == 2){
           Navigator.push(context, MaterialPageRoute(builder: (context) => const Player(),),);
            txt = "Game";
          } else if (value == 3){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings(),),);
            txt = "Settings";
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
            icon: Icon(Icons.star_border),
            label: "Features",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports_outlined),
            label: "GAME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
       
      ),
      );
  }
}
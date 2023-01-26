import 'package:flutter/material.dart';
import 'package:try_app/BCIIT/Assignment/Dice%20Game/GameDice.dart';

class Player extends StatefulWidget{
  const Player ({super.key});

  @override
  State<Player> createState() => _Player();
}

class _Player extends State<Player>{
  TextEditingController player1 = TextEditingController();
  TextEditingController player2 = TextEditingController();
  @override
  Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Game"),
        ),
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [

           Padding(
             padding: const EdgeInsets.all(18.0),
             child: Text("To begin this game, \n Enter Player Names:",
             style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
             ),
             ),
           ),

          Padding(padding: const EdgeInsets.all(20),
        child: TextField(
          controller: player1,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Player 1",
            hintText: "Enter your Name",
            icon: const Icon(Icons.sports_esports_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        ),

        Padding(padding: const EdgeInsets.all(20),
        child: TextField(
          controller: player2,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Player 2",
            hintText: "Enter your Name",
            icon: const Icon(Icons.sports_esports_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        ),

        ElevatedButton(onPressed: (){
          var p1 = player1.text;
          var p2 = player2.text;
          if(p1.isEmpty){
            p1='Player 1';
          }
          if(p2.isEmpty){
            p2='Player 2';
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => Game(player1: '$p1', player2: '$p2',),),);
        }, child: Text('Start Game !',
        style: TextStyle(
          fontSize: 20,
        ),),)
         ],
       ),
      ),
      );
  }
}
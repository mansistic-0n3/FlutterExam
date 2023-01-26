import 'dart:math';

import 'package:flutter/material.dart';
import 'package:try_app/BCIIT/Assignment/Dice%20Game/GamePlayer.dart';

class Game extends StatefulWidget{
  final String player1;
  final String player2;

  const Game ({super.key, required this.player1, required this.player2});

  @override
  State<Game> createState() => _Game();
}

class _Game extends State<Game>{
  int nums = 1;
  int max = 6;
  int min = 1;
  int over = 0;
  int score1 = 0;
  int score2 = 0;
  int maxCount = 0;
  int p = 1;
  
  String win = 'decided when game is finished.';
  Random random = Random();
  @override
  Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Game"),
        ),
       body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              splashColor: Colors.black,
              highlightColor: Colors.blue.withOpacity(0.3),
              child: Container(
                width: 350,
                height: 200,
                alignment: Alignment.center,
                child: Image.asset('images/$nums.png',
                fit: BoxFit.cover,
                ),
              ),
              onTap: () {
                setState(() {

                  // if(nums<6){
                  //   nums+=1;
                  // } else{
                  //   nums=1;
                  // }

                  nums = min + random.nextInt(max - min);

                if(maxCount<10){
                  maxCount++;
                  if(p==1){
                    score1 = score1 + nums;
                    p=2;
                  } else {
                    p=1;
                    score2 = score2 + nums;
                  }
                }

                if(maxCount==10){
                  nums = over;
                  if(score1>score2){
                    String p1 = widget.player1.toString();
                    win = p1;
                  } else if(score1<score2){
                    String p2 = widget.player2.toString();
                    win = p2;
                  } else {
                    win = 'no one. \n It\'s a Draw.';
                  }
                }

                });
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                     Text(widget.player1,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text('$score1',
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(widget.player2,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text('$score2',
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),)
                  ],
                ),
              ],
            ),
          ),

        ElevatedButton(onPressed: () {
          setState(() {
            score1 = 0;
            score2 = 0;
            maxCount = 0;
            nums = 1;
            win = 'decided when game is finished.';
          });
        },
         child: const Text('End Game',
         style: TextStyle(
          fontSize: 20,
         ),),
         ),

         AlertDialog(
          title: Text('Winner is \n $win',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.pink[300],
          ),
          textAlign: TextAlign.center,
          ),
         ),
         FloatingActionButton.extended(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Player(),),);
         },
         icon: Icon(Icons.exit_to_app),
         label: Text('EXIT'),
         ),
        ],
       ),
      ),
      );
  }
}
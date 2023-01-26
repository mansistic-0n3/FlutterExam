import 'package:flutter/material.dart';

class Cont extends StatefulWidget{
  const Cont ({super.key});

  @override
  State<Cont> createState() => _Cont();
}

class _Cont extends State<Cont>{
  @override
  Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container Widget"),
        ),
       body: Stack(
        children: [
          Container(
          child: Image.network('https://media.gettyimages.com/id/1323329363/video/abstract-digital-futuristic-eye.jpg?s=640x640&k=20&c=CbniRC1ERx9zmQXvsoaD3RddHbMJJyZXJ3cRUvevTlA=',
          fit: BoxFit.cover,),
         ),
         Container(
          padding: const EdgeInsets.fromLTRB(125, 50, 0, 0),
          child: const Text('Eyes never lie!',
          textAlign: TextAlign.center,
            style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          backgroundColor: Color.fromARGB(120, 196, 132, 153),
          fontSize: 40,
             ),
            ),
          )
        ],
       ),
      ),
      );
  }
}
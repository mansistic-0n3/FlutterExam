import 'package:flutter/material.dart';

class Drag extends StatefulWidget{
  const Drag ({super.key});

  @override
  State<Drag> createState() => _Drag();
}

class _Drag extends State<Drag>{
  String _target = '';
  int  img = 1;

  @override
  Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Drag"),
        ),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Center(
           child: Column(
            children:[
             Draggable<String>(
              data: "images/$img.png",
              child: Container
              (width: 300, 
             height: 200,
             alignment: Alignment.center,
             color: Colors.blue[100],
             child: Image.asset('images/$img.png'),
             ),
              feedback: Opacity(opacity: 0.4,
              child: Container(
                color: Colors.blue[100],
                alignment: Alignment.center,
                width: 300, 
                height: 200,
                child: Image.asset('images/$img.png',
                fit: BoxFit.cover,
                ),
                ),
                )
                ),

                SizedBox(
                  height: 20,
                ),

                DragTarget<String>(
                  onAccept: (value){
                    setState(() {
                      _target = value;
                      if(img<6)
                      {img+=1;}
                      else
                      {img=1;}
                    });
                  },
                  builder: (_, candidateData, rejectedData){
                    return Container(
                      width: 300,
                      height: 200,
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: _target != null 
                      ?Image.asset(
                        _target,
                        fit: BoxFit.cover,
                      ) :Container(),
                    );
                  },
                ),
            ],
           ),
         ),
       ),
      ),
      );
  }
}
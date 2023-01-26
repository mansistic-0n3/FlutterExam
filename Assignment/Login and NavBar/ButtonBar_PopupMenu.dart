import 'package:flutter/material.dart';
import 'package:try_app/BCIIT/Fibonacci.dart';

class Pop extends StatefulWidget{
  const Pop ({super.key});

  @override
  State<Pop> createState() => _Pop();
}

class Options{
final String category;
late final String detail;

  Options(this.category, this.detail);
}

class TodoMenuItem {
 final String title;
 final Icon icon;
 TodoMenuItem({required this.title, required this.icon});
}


class _Pop extends State<Pop>{
  List<TodoMenuItem> foodMenuList = [
 TodoMenuItem(title: 'Fast Food', icon: Icon(Icons.fastfood)),
 TodoMenuItem(title: 'Remind Me', icon: Icon(Icons.add_alarm)),
 TodoMenuItem(title: 'Flight', icon: Icon(Icons.flight)),
 TodoMenuItem(title: 'Music', icon: Icon(Icons.audiotrack)),
];
  @override
  Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("PopUp Menu and ButtonBar"),
        ),
       body: 
            Column(
              children: [
                PopupMenuButton<TodoMenuItem>(
                  icon: Icon(Icons.view_list),
                  onSelected: ((valueSelected) {
                  print('valueSelected: ${valueSelected.title}');
                  }),
                  itemBuilder: (BuildContext context) {
                  return foodMenuList.map((TodoMenuItem todoMenuItem) {
                  return PopupMenuItem<TodoMenuItem>(
                  value: todoMenuItem,
                  child: Row(
                  children: <Widget>[
                  Icon(todoMenuItem.icon.icon),
                  Padding(padding: EdgeInsets.all(8.0),),
                  Text(todoMenuItem.title),
                  
                  ],
 
                ));
        })
        .toList();
       }
      ),
      
        Container(
          color: Colors.white,
          child: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.airport_shuttle),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.brush),
            onPressed: () {},
          ),
        ],
          ),
          ),
        ],
       ),
      ),
      );
  }
}



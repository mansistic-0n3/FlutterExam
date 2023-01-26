import 'package:flutter/material.dart';
import 'package:try_app/BCIIT/Assignment/Login%20and%20NavBar/Welcome.dart';

class OrientationPhn extends StatefulWidget{
  const OrientationPhn ({super.key});

  @override
  State<OrientationPhn> createState() => _OrientationPhn();
}

class _OrientationPhn extends State<OrientationPhn>{
   @override
 Widget build(BuildContext context) {
  Orientation _orientation = MediaQuery.of(context).orientation;

  return Scaffold(
    appBar: AppBar(title: Text('orientation'),
    leading: IconButton(
      icon : Icon(Icons.arrow_back), 
      onPressed: () { 
        Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome(title: 'Admin')));
       },),
      ),
  
 
 body:
    _orientation == Orientation.portrait
    ? Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.pink, Colors.white])
    ),
    child: Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: <Widget>[
        Icon(
          Icons.school,
          size: 48.0,
        ),
    ],),
  )
  : Row(
    mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.school,
          size: 48.0,
        ),
        Icon(
          Icons.brush,
          size: 48.0,
        ),
      ],
  ),
  
    );
  }
}
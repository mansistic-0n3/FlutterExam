import 'package:flutter/material.dart';
import 'package:try_app/BCIIT/Assignment/Login%20and%20NavBar/LoginPage.dart';

class Fail extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(child: 
      TextButton(
        onPressed: (() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
      }) ,
        child: const Text('Invalid Credentials, \nGo back to Login Page',
      style: TextStyle(
        fontSize: 30,
      ),
      textAlign: TextAlign.center,),
      ),
      ),
    );
  }
}
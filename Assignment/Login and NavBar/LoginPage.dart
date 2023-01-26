import 'package:flutter/material.dart';
import 'package:try_app/BCIIT/Assignment/ImageContainer.dart';
import 'package:try_app/BCIIT/Assignment/Login%20and%20NavBar/LoginFailed.dart';
import 'package:try_app/BCIIT/Assignment/Login%20and%20NavBar/Welcome.dart';

class LoginPage extends StatefulWidget{
  const LoginPage ({super.key});
  
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
TextEditingController userIDCtrl = TextEditingController();
TextEditingController pwdCtrl = TextEditingController();

String msg = ''; 

  @override
  Widget build(BuildContext context){
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
          title: const Text("Login"),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
          style: TextStyle(
            fontSize: 35,
            foreground: Paint()
            ..shader = const LinearGradient(colors: <Color>[
                    Colors.blue,
                    Colors.redAccent,
                  ]).createShader(const Rect.fromLTWH(100, 0, 200, 100)),
            fontWeight: FontWeight.bold,
            
          ),
          ),
          
          Padding(padding: const EdgeInsets.all(10),
          child: TextField(
            controller: userIDCtrl,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter Email Id",
              icon: const Icon(Icons.email),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          ),

          Padding(padding: const EdgeInsets.all(10),
          child: TextField(
            controller: pwdCtrl,
            keyboardType: TextInputType.text,
            obscureText: true,
            maxLength: 6,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter Password",
              icon: const Icon(Icons.password),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          ),

          Padding(padding: const EdgeInsets.all(10),
          child: Center(
            child: ElevatedButton(onPressed: () {
              var uid = userIDCtrl.text;
              var pass = pwdCtrl.text;
              if(uid == 'Admin' && pass=='12345'){
              // setState(() {
              //   msg = "ID : $uid\n Password : $pass";
              // });
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Welcome(title: "Welcome $uid"),
                ),);
                } else {
                   Navigator.push(context, MaterialPageRoute(
                builder: (context) => Fail(),
                ),);
                }
            },
            
             child: const Text("LOGIN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),),),

            )
          ),

          Padding(padding: const EdgeInsets.all(10),
          child: Text(msg),)
        ],
      ),
    ),
    );
  }
}
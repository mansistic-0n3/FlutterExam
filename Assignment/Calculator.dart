import 'package:flutter/material.dart';

class Cal extends StatefulWidget{
  const Cal ({super.key});

  @override
  State<Cal> createState() => _Cal();
}

class _Cal extends State<Cal>{

  late int first, second;
  late String res, text = "";
  late String opp;
  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "x") {
        res = (first * second).toString();
      }
      if (opp == "/") {
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }
    setState(() {
      text = res;
    });
  }

  @override
  Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
         
        ),
         backgroundColor: Colors.blueGrey[900],
       body:
       Padding(
         padding: const EdgeInsets.all(5.0),
         child: Container(
          child: Column(
            children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    text,
                    style:const TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  customOutlineButton("9"),
                  customOutlineButton("8"),
                  customOutlineButton("7"),
                  customOutlineButton("+"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  customOutlineButton("6"),
                  customOutlineButton("5"),
                  customOutlineButton("4"),
                  customOutlineButton("-"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  customOutlineButton("3"),
                  customOutlineButton("2"),
                  customOutlineButton("1"),
                  customOutlineButton("x"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  customOutlineButton("C"),
                  customOutlineButton("0"),
                  customOutlineButton("="),
                  customOutlineButton("/"),
                ],
              ),
            ],
          ),
      ),
       ),
      ),
    );
  }
  Widget customOutlineButton(String val) {
     return  Container(
                margin: EdgeInsets.all(5),
                child: SizedBox(
                   width: 70,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () => btnClicked(val),
                    child: Text(val,
                    style: TextStyle(fontSize: 28,),),
                  ),
                  ),
              );
  }
  
}

import 'package:flutter/material.dart';

class UserInputOp extends StatefulWidget {
  const UserInputOp({ Key? key }) : super(key: key);

  @override
  _UserInputOpState createState() => _UserInputOpState();
}

class _UserInputOpState extends State<UserInputOp> {
 var ct1 = TextEditingController();
  var ct2 = TextEditingController();
 
  String difference = "";
  String product = "";
  String quotient = "";
 
  void compute() {
    try {
      setState(() {
        difference =
            "Difference : ${int.parse(ct1.text) - int.parse(ct2.text)}";
        product = "Product : ${int.parse(ct1.text) * int.parse(ct2.text)}";
        quotient = "Quotient : ${int.parse(ct1.text) / int.parse(ct2.text)}";
      });
    } catch (e) {
      print("Error computing $e");
    }
  }
 
  Widget myText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 21,
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  controller: ct1,
                  decoration: const InputDecoration(
                    labelText: "First Number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  controller: ct2,
                  decoration: const InputDecoration(
                    labelText: "Second Number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myText(difference),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myText(product),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myText(quotient),
              ),
              ElevatedButton(
                onPressed: compute,
                child: Text(
                  "COMPUTE",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({ Key? key }) : super(key: key);

  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  var ct1 = TextEditingController();
 
  String celsicus = "";
  String farh = "";
 
  void toCelcius() {
    try {
      setState(() {
        celsicus = "Celsicus = ${(int.parse(ct1.text) - 32) * 5 / 9}";
        farh = '';
      });
    } catch (e) {
      print("Error computing $e");
    }
  }
 
  void toFarhn() {
    try {
      setState(() {
        farh = "Fahrenheit = ${(int.parse(ct1.text) * (9 / 5)) + 32}";
        celsicus = '';
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
                padding: const EdgeInsets.all(50.0),
                child: TextField(
                  controller: ct1,
                  decoration: const InputDecoration(
                    labelText: "Temperature",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              myText(celsicus),
              myText(farh),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: toCelcius,
                  child: Text(
                    "Convert to Celcius",
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: toFarhn,
                child: Text(
                  "Convert to Fahrenheit",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

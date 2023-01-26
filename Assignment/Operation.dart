import 'dart:math';
import 'package:flutter/material.dart';
class Operation extends StatefulWidget {
  const Operation({ Key? key }) : super(key: key);

  @override
  _OperationState createState() => _OperationState();
}

class _OperationState extends State<Operation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  String operationString = "";
  String operationString2 = "";
 
  void increment() {
    setState(() {
      counter++;
    });
  }
 
  void decrement() {
    setState(() {
      counter--;
    });
  }
 
  void square() {
    setState(() {
      operationString = "Your have tried to check the SQUARE of the counter";
      operationString2 = "Square of your number is ${counter * counter}";
    });
  }
 
  void reset() {
    setState(() {
      counter = 0;
      operationString = "";
      operationString2 = "";
    });
  }
 
  void prime() {
    bool isPrime(int number) {
      if (number <= 1) {
        return false;
      }
      int limit = sqrt(number).floor();
      for (int i = 2; i <= limit; i++) {
        if (number % i == 0) {
          return false;
        }
      }
      return true;
    }
 
    setState(() {
      operationString = "Your have tried to check the PRIME of the counter";
      operationString2 =
          isPrime(counter) ? "$counter is PRIME" : "$counter is not PRIME";
    });
  }
 
  void evenOdd() {
    setState(() {
      operationString = "Your have tried to check the Even/Odd of the counter";
      operationString2 =
          counter % 2 == 0 ? "$counter is EVEN" : "$counter is ODD";
    });
  }
 
  void palindrome() {
    bool isPalindrome(int num) {
      String original = num.toString();
      String reversed = original.split('').reversed.join();
      return original == reversed;
    }
 
    setState(() {
      operationString =
          "Your have tried to check the PALINDROME of the counter";
      operationString2 = isPalindrome(counter)
          ? "$counter is PALINDROME"
          : "$counter is NOT PALINDROME";
    });
  }
 
  void factorial() {
    int fact(int num) {
      int result = 1;
      for (int i = 1; i <= num; i++) {
        result *= i;
      }
      return result;
    }
 
    setState(() {
      operationString =
          "Your have tried to check the PALINDROME of the counter";
      operationString2 = "Factorial of $counter is ${fact(counter)}";
    });
  }
 
  Widget myText(String text) {
    return FittedBox(
      child: Text(text),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Operations"),
      ),
      body: SizedBox(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your have pushed the button this many times:"),
              Text(
                counter.toString(),
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: Text(operationString),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Text(
                operationString2,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FloatingActionButton(
                            onPressed: increment,
                            child: myText("+"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FloatingActionButton(
                            onPressed: decrement,
                            child: myText("-"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FloatingActionButton(
                            onPressed: square,
                            child: myText("Square"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FloatingActionButton(
                            onPressed: reset,
                            child: myText("Reset"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FloatingActionButton(
                            onPressed: prime,
                            child: myText("Prime"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FloatingActionButton(
                            onPressed: evenOdd,
                            child: myText("Even/Odd"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FloatingActionButton(
                          onPressed: palindrome,
                          child: myText("Palindrome"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FloatingActionButton(
                          onPressed: factorial,
                          child: myText("Factorial"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
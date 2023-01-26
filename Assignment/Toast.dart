import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ToastMsg extends StatefulWidget {
  const ToastMsg({ Key? key }) : super(key: key);

  @override
  _ToastState createState() => _ToastState();
}

class _ToastState extends State<ToastMsg> {
  TextEditingController msg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
      return MaterialApp(
            debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Toast'),
        ),
       body: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(22.0),
             child: TextField(
                  controller: msg,
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  decoration: InputDecoration(
                    labelText: "Message",
                    hintText: "Type a Message",
                    icon: const Icon(Icons.textsms_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
           ),
         ],
       ),
       floatingActionButton: FloatingActionButton.extended(onPressed: () {
        var Message = msg.text;

        if(Message.isEmpty){
          Message = "Hello! Please write a message to display";
        }

        Toast.show("$Message", duration: 5, gravity: 0);
       },
       tooltip: "move",
       icon: const Icon(Icons.notification_add),
       label: const Text("Toast Message"),
       ),
       
      ),
      );
  }
}
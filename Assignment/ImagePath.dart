import 'package:flutter/material.dart';

class Img extends StatefulWidget{
  const Img ({super.key});

  @override
  State<Img> createState() => _Img();
}

class _Img extends State<Img>{
  TextEditingController userURL = TextEditingController();
 late String url = '';
  @override
  Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Scenery"),
          backgroundColor: Colors.teal,
        ),
       body: 
       Padding(
         padding: const EdgeInsets.all(15.0),
         child: ListView(
           children: [
            Padding(padding: const EdgeInsets.all(10),
          child: TextField(
            controller: userURL,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Upload Your Scenery",
              hintText: "Enter Image URL",
              icon: const Icon(Icons.upload),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          ),
          ElevatedButton
          (onPressed: () {
            url = userURL.text;
          print(url);
          },
           child:const Text("Upload"),
           ),
          SizedBox(
            child: Image.network(url),
          ),
          
           // Image(image: NetworkImage('https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?cs=srgb&dl=pexels-pixabay-206359.jpg&fm=jpg'),),
           ],
         ),
       ),
      ),
      );
  }
}
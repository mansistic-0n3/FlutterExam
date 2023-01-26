import 'dart:core';

import 'package:flutter/material.dart';

class HeroDemoState extends StatefulWidget {
  const HeroDemoState({super.key});

  @override
  State<HeroDemoState> createState() => _HeroDemoStateState();
}

class _HeroDemoStateState extends State<HeroDemoState> {
  final List<Map<String, dynamic>> _images = [
    {"id": 'i1', 'title': 'Tom and Jerry', 'url': 'images/tomjerry.jpg'},
    {"id": 'i2', 'title': 'Bob the Builder', 'url': 'images/bob.jpg'},
    {"id": 'i3', 'title': 'Noddy', 'url': 'images/noddy.jpg'},
    {"id": 'i4', 'title': 'Power Puff Girls', 'url': 'images/powerpuff.png'},
    {"id": 'i5', 'title': 'Oswald', 'url': 'images/oswald.jpg'},
    {"id": 'i6', 'title': 'Phineas and Ferb', 'url': 'images/phineasferb.png'},
    {"id": 'i7', 'title': 'Shinchan', 'url': 'images/shinchan.png'},
    {"id": 'i8', 'title': 'Doraemon', 'url': 'images/doraemon.jpg'},
    {"id": 'i9', 'title': 'We Bare Bears', 'url': 'images/bear.png'},
    {"id": 'i10', 'title': 'Mr. Bean', 'url': 'images/mrbean.jpg'},
    {"id": 'i11', 'title': 'Thomas and Friends', 'url': 'images/thomas.jpg'},
    {"id": 'i12', 'title': 'Mickey Mouse', 'url': 'images/mickey.png'},
    {"id": 'i13', 'title': 'Spongebob Square Pants', 'url': 'images/spongebob.jpg'},
    {"id": 'i14', 'title': 'Ben Ten', 'url': 'images/benten.jpg'},
    {"id": 'i15', 'title': 'Pokemon', 'url': 'images/pokemon.jpg'},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 40, 40),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('90\'s Cartoons'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: _images.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              key: ValueKey(_images[index]["id"]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => DetailPage(_images[index]))));
              },
              child: Hero(
                  tag: _images[index]["id"],
                  child: Image.asset(
                    _images[index]["url"],
                    fit: BoxFit.cover,
                  )),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map image;

  const DetailPage(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(image['title']),
        
      ),
      body: Center(
          child: Hero(tag: image["id"], child: Image.asset(image["url"]))),
    );
  }
}

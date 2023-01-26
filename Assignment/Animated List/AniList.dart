import 'package:flutter/material.dart';
import 'package:try_app/BCIIT/Assignment/Animated%20List/item_widget.dart';

class AniList extends StatefulWidget{
  const AniList ({super.key});

  @override
  State<AniList> createState() => _AniList();
}


class _AniList extends State<AniList> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 4000,
      ),
    );

    animation = Tween<double>(
      begin: 0.0,
      end: 1.0
    ).animate(_controller);

    animation.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final key = GlobalKey<AnimatedListState>();
  static final List<String>StuList=[
    'Mansi',
    'Akash',
    'Ashray',
    'Bhavini',
    'Kashish',
    'Abishek',
    'Swastik',
    'Inderpreet'
  ];

  @override
  Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 16, 22, 30),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 28, 40, 52),
          title: const Text('Attandance List'),
        ),
       body: Column(
        children: [
          Expanded(
            child: AnimatedList(
            key: key,
            initialItemCount: StuList.length,
            itemBuilder: (context, index, animation) => ListWidget(
              item: StuList[index],
              animation: animation, 
              onClicked: () {
                absent(index);
              }
              ), 
          ),
          ),
        ],
       ),
      ),
      );
  }
  
  void absent(int index) {
    final stu = StuList[index];
    StuList.removeAt(index);
    key.currentState!.removeItem(index, (context, animation) => 
    ListWidget(item: stu, 
    animation: animation, 
    onClicked: (){},),
    );
  }
}
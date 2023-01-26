import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final String item;
  final Animation<double> animation;
  final VoidCallback onClicked;

  const ListWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizeTransition(
        sizeFactor: animation,
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:  Color.fromARGB(218, 45, 61, 77),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            title: Text(item, style:const TextStyle(fontSize: 16, color: Colors.white)),
            onTap: onClicked,
          ),
        ),
      );
}
import 'package:flutter/material.dart';
import 'dart:io';

Future<void> showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String defaultAcionText,
  required final VoidCallback onOkPressed
}) async{
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: <Widget>[
      ElevatedButton(onPressed: () => onOkPressed(), child: Text(defaultAcionText)),
    ],
   ));
}
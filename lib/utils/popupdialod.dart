import 'package:flutter/material.dart';

Future<String?> popUpDialog(context, String title, String subtitle) {
  return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            content: Text(subtitle),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ));
}

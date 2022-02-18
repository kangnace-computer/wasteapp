import 'package:flutter/material.dart';

Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Image.asset('assets/images/getstudentimage.jpg'),
        title: Text(
          'Normal Dialog',
          style: TextStyle(
            color: Colors.red.shade700,
            fontWeight: FontWeight.bold),
        ),
        subtitle: Text(string),
      ),
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

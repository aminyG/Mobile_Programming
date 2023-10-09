import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text(
        'This is Text Widget',
      ),
    );
  }
}

void main(List<String> args) {
  runApp(MyApp());
}

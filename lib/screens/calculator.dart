import 'package:calculator/components/display.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Display('123.45'),
          Text('Keyboard'),
        ],
      ),
    );
  }
}

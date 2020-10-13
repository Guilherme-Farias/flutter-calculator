import 'package:calculator/components/display.dart';
import 'package:calculator/components/keyboard.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  _onPressed(String text) {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Display('123.45'),
          Keyboard(_onPressed),
        ],
      ),
    );
  }
}

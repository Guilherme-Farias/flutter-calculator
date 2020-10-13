import 'package:calculator/components/button.dart';
import 'package:calculator/components/button_row.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) cb;
  Keyboard(this.cb);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          ButtonRow(
            [
              Button.dark(text: 'AC', cb: cb),
              Button.dark(text: '+/-', cb: cb),
              Button.dark(text: '%', cb: cb),
              Button.operation(text: '/', cb: cb),
            ],
          ),
          ButtonRow(
            [
              Button(text: '7', cb: cb),
              Button(text: '8', cb: cb),
              Button(text: '9', cb: cb),
              Button.operation(text: 'x', cb: cb),
            ],
          ),
          ButtonRow(
            [
              Button(text: '4', cb: cb),
              Button(text: '5', cb: cb),
              Button(text: '6', cb: cb),
              Button.operation(text: '-', cb: cb),
            ],
          ),
          ButtonRow(
            [
              Button(text: '1', cb: cb),
              Button(text: '2', cb: cb),
              Button(text: '3', cb: cb),
              Button.operation(text: '+', cb: cb),
            ],
          ),
          ButtonRow(
            [
              Button.big(text: '0', cb: cb),
              Button(text: '.', cb: cb),
              Button.operation(text: '=', cb: cb),
            ],
          ),
        ],
      ),
    );
  }
}

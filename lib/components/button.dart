import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final bool big;
  final Color color;

  const Button({@required this.text, this.big = false, this.color = DEFAULT});
  const Button.big(
      {@required this.text, this.big = true, this.color = DEFAULT});
  const Button.operation(
      {@required this.text, this.big = false, this.color = OPERATION});
  const Button.dark({@required this.text, this.big = false, this.color = DARK});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: RaisedButton(
        color: this.color,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w200,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
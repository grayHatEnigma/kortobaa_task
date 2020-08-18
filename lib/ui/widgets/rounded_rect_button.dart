import 'package:flutter/material.dart';

class RoundedRectButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Function onTap;

  const RoundedRectButton(
      {@required this.text, @required this.fontSize, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize, color: Colors.white),
            ),
          )),
    );
  }
}

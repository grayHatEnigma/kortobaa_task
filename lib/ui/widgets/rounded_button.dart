import 'package:flutter/material.dart';

import '../../constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const RoundedButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(top: 10.0, bottom: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).accentColor,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: sizeUtil.size(16)),
        ),
      ),
    );
  }
}

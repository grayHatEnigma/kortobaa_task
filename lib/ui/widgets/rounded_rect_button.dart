import 'package:flutter/material.dart';
import '../../constants.dart';

class RoundedRectButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Function onTap;
  final bool isSelected;

  const RoundedRectButton(
      {@required this.text,
      @required this.fontSize,
      @required this.onTap,
      this.isSelected});
  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? Colors.white : Colors.grey;
    final btnColor = isSelected ? Theme.of(context).accentColor : Colors.white;
    return InkWell(
      onTap: onTap,
      child: Container(
          width: sizeUtil.width(80),
          padding: EdgeInsets.symmetric(vertical: sizeUtil.height(5)),
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize, color: textColor),
            ),
          )),
    );
  }
}

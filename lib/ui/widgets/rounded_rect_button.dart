import 'package:flutter/material.dart';
import '../../constants.dart';

class RoundedRectButton extends StatelessWidget {
  final String text;

  final Function onTap;
  final bool isSelected;

  const RoundedRectButton(
      {@required this.text, @required this.onTap, this.isSelected = true});
  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? Colors.white : Colors.grey;
    final btnColor = isSelected ? Theme.of(context).accentColor : Colors.white;
    return InkWell(
      onTap: onTap,
      child: Container(
          width: sizeUtil.width(100),
          padding: EdgeInsets.symmetric(vertical: sizeUtil.height(5)),
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: sizeUtil.size(14.5),
                  color: textColor,
                  fontWeight: FontWeight.w600),
            ),
          )),
    );
  }
}

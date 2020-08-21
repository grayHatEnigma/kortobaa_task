import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';

import '../../constants.dart';

class ProfileButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final String text;

  const ProfileButton(
      {@required this.icon, @required this.onTap, @required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(sizeUtil.size(10)),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: sizeUtil.width(24),
            ),
          ),
          sizeUtil.sizedBoxWithHeight(5),
          Text(
            FlutterI18n.translate(context, text),
            style: TextStyle(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }
}

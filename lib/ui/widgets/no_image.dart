import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';

import '../../constants.dart';

class NoImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: sizeUtil.width(20), vertical: sizeUtil.height(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.error,
            color: Colors.white,
          ),
          sizeUtil.sizedBoxWithHeight(8.0),
          Text(
            FlutterI18n.translate(context, kNoImage),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: sizeUtil.size(15),
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

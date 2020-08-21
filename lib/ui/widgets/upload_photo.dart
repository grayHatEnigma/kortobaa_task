import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import '../../constants.dart';

class UploadPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: sizeUtil.height(150),
        width: sizeUtil.screenWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              size: sizeUtil.size(60),
              color: Colors.grey[400],
            ),
            Text(
              FlutterI18n.translate(context, kUploadPhoto),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ));
  }
}

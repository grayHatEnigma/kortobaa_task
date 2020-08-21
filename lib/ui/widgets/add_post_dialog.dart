/*

TextField(
              decoration: InputDecoration(
                  labelText:
                      FlutterI18n.translate(context, kTitleTextFieldHint)),
              controller: titleController,
              maxLength: 25,
            ),

*/

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:kortobaa_task/ui/widgets/rounded_rect_button.dart';
import '../widgets/upload_photo.dart';
import '../../constants.dart';

class AddPostDialog extends StatefulWidget {
  @override
  _AddPostDialogState createState() => _AddPostDialogState();
}

class _AddPostDialogState extends State<AddPostDialog> {
  TextEditingController textController;
  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      insetPadding: EdgeInsets.all(
        sizeUtil.width(20.0),
      ),
      titlePadding: EdgeInsets.all(
        sizeUtil.width(8.0),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      title: UploadPhoto(),
      content: TextField(
        decoration: InputDecoration(
          labelText: FlutterI18n.translate(context, kTextHint),
          labelStyle: TextStyle(fontSize: 13),
        ),
        textAlign: TextAlign.justify,
        controller: textController,
        maxLines: 2,
        maxLength: 125,
      ),
      actions: [
        RoundedRectButton(
            text: FlutterI18n.translate(context, kCancel),
            fontSize: 13,
            isSelected: false,
            onTap: () {
              Navigator.pop(context);
            }),
        RoundedRectButton(
            text: FlutterI18n.translate(context, kPublish),
            fontSize: 13,
            isSelected: true,
            onTap: () {})
      ],
    );
  }
}

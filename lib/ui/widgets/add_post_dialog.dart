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
      insetPadding: EdgeInsets.all(
        sizeUtil.width(20.0),
      ),
      titlePadding: EdgeInsets.only(
        top: sizeUtil.height(8.0),
        right: sizeUtil.width(8.0),
        left: sizeUtil.width(8.0),
      ),
      contentPadding: EdgeInsets.only(
        bottom: sizeUtil.height(8.0),
        right: sizeUtil.width(15.0),
        left: sizeUtil.width(15.0),
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
          labelStyle: TextStyle(fontSize: 15),
        ),
        textAlign: TextAlign.justify,
        controller: textController,
        maxLines: 2,
        maxLength: 120,
      ),
      actions: [
        RoundedRectButton(
            text: FlutterI18n.translate(context, kCancel),
            isSelected: false,
            onTap: () {
              Navigator.pop(context);
            }),
        RoundedRectButton(
            text: FlutterI18n.translate(context, kPublish),
            isSelected: true,
            onTap: () {})
      ],
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}

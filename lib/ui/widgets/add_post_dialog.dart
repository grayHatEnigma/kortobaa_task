import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/rounded_rect_button.dart';
import '../widgets/upload_photo.dart';
import '../../constants.dart';
import '../../models/post.dart';
import '../../blocs/post/post_bloc.dart';

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
            onTap: () {
              // Create a post object
              final Post post = Post(
                  body: 'LOVE ANIME',
                  imageUrl:
                      'https://occ-0-1722-1723.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABeV0Af4XqVIi8qSUEeV_llbkH9B-TyiTGukOX7pSFxAuAyoc9q-e--ErSFvK4dLjE7tYDAr1L0PXAja28cDsLWwGdA_A.jpg',
                  userName: 'Mohamed Salama',
                  userId: '0',
                  date: DateTime.now());

              // ADD THE POST
              BlocProvider.of<PostBloc>(context).add(AddPost(post));

              Navigator.pop(context);
            })
      ],
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}

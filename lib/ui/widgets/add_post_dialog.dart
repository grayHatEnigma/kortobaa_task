import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa_task/models/user.dart';
import 'package:uuid/uuid.dart';

import '../widgets/rounded_rect_button.dart';
import '../widgets/upload_photo.dart';
import '../../constants.dart';
import '../../models/post.dart';
import '../../blocs/post/post_bloc.dart';

class AddPostDialog extends StatefulWidget {
  final User user;

  AddPostDialog({this.user});
  @override
  _AddPostDialogState createState() => _AddPostDialogState();
}

class _AddPostDialogState extends State<AddPostDialog> {
  TextEditingController textController;

  File _imageFile;
  String _imageUrl;

  bool isUploading = false;
  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AlertDialog(
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
          title: UploadPhoto(
            chosenImage: (chosenImage) {
              _imageFile = chosenImage;
            },
          ),
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
                onTap: () async {
                  // Upload Image
                  if (_imageFile != null) {
                    //
                    _imageUrl = await uploadImage(_imageFile);
                  }
                  // Create a post object
                  final Post post = Post(
                      body: textController.text,
                      imageUrl: _imageUrl,
                      userName: widget.user.name,
                      userId: widget.user.userId,
                      userImageUrl: widget.user.imageUrl,
                      date: DateTime.now());

                  // ADD THE POST
                  BlocProvider.of<PostBloc>(context).add(AddPost(post));

                  Navigator.pop(context);
                })
          ],
        ),
        if (isUploading)
          Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }

  Future<String> uploadImage(imageFile) async {
    var uuid = Uuid().v1();
    StorageReference storageRef =
        FirebaseStorage.instance.ref().child("posts/post_$uuid.jpg");

    setState(() {
      isUploading = true;
    });
    StorageUploadTask uploadTask = storageRef.putFile(imageFile);

    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    isUploading = false;
    return downloadUrl;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}

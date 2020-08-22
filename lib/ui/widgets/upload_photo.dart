import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants.dart';

class UploadPhoto extends StatefulWidget {
  final Function(File) chosenImage;

  const UploadPhoto({this.chosenImage});

  @override
  _UploadPhotoState createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _getImage();
      },
      child: Container(
          height: sizeUtil.height(150),
          width: sizeUtil.screenWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _image == null ? Colors.grey[300] : Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image != null
                  ? Expanded(
                      child: Image.file(
                        _image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                  : Icon(
                      Icons.camera_alt,
                      size: sizeUtil.size(60),
                      color: Colors.grey[400],
                    ),
              if (_image == null)
                Text(
                  FlutterI18n.translate(context, kUploadPhoto),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )
            ],
          )),
    );
  }

  // This method is for  getting post image from gallery
  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      widget.chosenImage(_image);
    });
  }

  // TODO Later : Implement image commpression to reduce traffic / storage usage

  // // Compress and Upload Image functions
  // compressImage() async {
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //   Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
  //   final compressedImageFile = File('$path/img_$postId.jpg')
  //     ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
  //   setState(() {
  //     file = compressedImageFile;
  //   });
  // }

}

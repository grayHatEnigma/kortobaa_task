import 'package:flutter/material.dart';

import '../data/providers/database_provider.dart';
import 'dart:io' as Io;
import 'dart:convert';

class Post {
  int postId;
  int userId;
  Image image;
  String text;

  Post({
    this.userId,
    this.postId,
    this.image,
    this.text,
  });
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnUserId: userId,
      columnPostText: text,
      // encode the Image object into a string
    };
    if (postId != null) {
      map[columnPostId] = postId;
    }
    return map;
  }

  Post.fromMap(Map<String, dynamic> map) {
    postId = map[columnPostId];
    userId = map[columnUserId];
    text = map[columnPostText];
    // decode the Image object from a string
  }
}

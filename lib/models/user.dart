import 'package:flutter/material.dart';

import '../data/providers/database_provider.dart';
import 'dart:io' as Io;
import 'dart:convert';

class User {
  int userId;
  String name;
  String email;
  Image profileImage;
  User({
    this.userId,
    this.name,
    this.email,
    this.profileImage,
  });

  Map<String, dynamic> toMap() {
    // encode the Image object into a string

    var map = <String, dynamic>{
      columnUserId: userId,
      columnUserName: name,
      columnUserEmail: email,
    };
    if (userId != null) {
      map[columnUserId] = userId;
    }
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    userId = map[columnUserId];
    name = map[columnUserName];
    email = map[columnUserEmail];
    // decode the Image object from a string
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ui/app/app.dart';

void main() {
  runApp(App());
  // Initialize Firebase instance to be used accross the entire app
  Firebase.initializeApp();
}

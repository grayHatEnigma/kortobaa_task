import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kortobaa_task/utilities/device_info_utility.dart';
import 'ui/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // force the app to stay in portrait mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(App());

  // This to get deviceToken which I use as a register toekn
  DeviceInfo().getId();
  // Initialize Firebase instance to be used accross the entire app
  Firebase.initializeApp();
}

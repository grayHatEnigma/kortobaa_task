import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kortobaa_task/utilities/device_info_utility.dart';
import 'package:device_preview/device_preview.dart' as dvp;
import 'ui/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // force the app to stay in portrait mode
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    dvp.DevicePreview(
      builder: (contex) => App(),
      enabled: false, // !kReleaseMode,
    ),
  );

  // This to get deviceToken which I use as a register toekn
  DeviceInfo().getId();
  // Initialize Firebase instance to be used accross the entire app
  Firebase.initializeApp();
}

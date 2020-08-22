import 'dart:io';

import 'package:device_info/device_info.dart';

// *** This Class is to Provide a unique id for each device using the app ***

// I Know it is extreamly dangerous to use this id as a user identifier in the firestore
// but for the purpose of this task I think it's okay

class DeviceInfo {
  static Future<String> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
}

import 'package:flutter/material.dart';

import '../../constants.dart';

class AppTheme extends StatelessWidget {
  final navigator;

  const AppTheme({Key key, this.navigator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Font  family based on locale
    var fontFamily =
        Localizations.localeOf(context) == Locale('ar') ? 'Cairo' : 'Poppins';
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xffb2dfdb),
        accentColor: const Color(0xff39796b),
        fontFamily: fontFamily,
        textTheme: TextTheme(
          headline6:
              TextStyle(fontFamily: fontFamily, fontSize: sizeUtil.size(15.0)),
        ),
      ),
      child: navigator,
    );
  }
}

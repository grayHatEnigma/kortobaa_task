import 'package:flutter/material.dart';

class AppTheme extends StatelessWidget {
  final navigator;

  const AppTheme({Key key, this.navigator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xffb2dfdb),
        accentColor: const Color(0xff39796b),
        fontFamily: Localizations.localeOf(context) == Locale('ar')
            ? 'Cairo'
            : 'Poppins',
      ),
      child: navigator,
    );
  }
}

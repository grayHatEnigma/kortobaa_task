import 'package:flutter/material.dart';
import 'theme.dart';
import 'routes.dart';
import '../screens/splash_screen.dart';
import '../../constants.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, navigator) {
        // Get Actual Device Screen Size
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        // Update Screen Dimensions
        sizeUtil.updateScreenDimensions(height: height, width: width);
        return AppTheme(
          navigator: navigator,
        );
      },
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}

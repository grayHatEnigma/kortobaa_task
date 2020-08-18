import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';
import 'routes.dart';
import '../screens/splash_screen.dart';
import '../../constants.dart';
import '../../blocs/title_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => TitleBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

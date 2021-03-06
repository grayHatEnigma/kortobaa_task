import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'theme.dart';
import 'routes.dart';
import '../screens/splash_screen.dart';
import '../../constants.dart';
import '../../managers/localization_manager.dart';
import '../../blocs/post/post_bloc.dart';
import '../../blocs/user/user_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This also can be used to 'provide' a 'BlocProvider' ( Flexi Angelov 's Package) cause they both
    // depends on Remi 's Provider package underneath
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocalizationManager(),
        ),
        BlocProvider(
          create: (_) => UserBloc(),
        ),
        BlocProvider(
          create: (_) => PostBloc(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Consumer<LocalizationManager>(
            builder: (_, localeManager, __) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: localeManager.locale,
                localizationsDelegates: [
                  FlutterI18nDelegate(
                    translationLoader: FileTranslationLoader(
                      useCountryCode: false,
                      fallbackFile: 'en',
                      decodeStrategies: [JsonDecodeStrategy()],
                    ),
                  ),
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                supportedLocales: [
                  const Locale('en'),
                  const Locale('ar'),
                ],
                builder: (context, navigator) {
                  // Get Actual Device Screen Size
                  double height = MediaQuery.of(context).size.height;
                  double width = MediaQuery.of(context).size.width;
                  // Update Screen Dimensions in SizeUtil class
                  sizeUtil.updateScreenDimensions(height: height, width: width);
                  return AppTheme(
                    navigator: navigator,
                  );
                },
                routes: routes,
                initialRoute: SplashScreen.routeName,
              );
            },
          );
        },
      ),
    );
  }
}

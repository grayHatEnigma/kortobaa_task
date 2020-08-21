import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'theme.dart';
import 'routes.dart';
import '../screens/splash_screen.dart';
import '../../constants.dart';
import '../../blocs/page_bloc.dart';
import '../../blocs/localization_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This also can be used to 'provide' a 'BlocProvider' ( Flexi Angelov 's Package) cause they both
    // depends on Remi 's Provider package underneath
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => PageBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider(
          create: (_) => LocalizationBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final localizationBloc = Provider.of<LocalizationBloc>(context);

          return StreamBuilder<Locale>(
            stream: localizationBloc.selectedLocale,
            builder: (context, snapshot) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: snapshot.data,
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

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa_task/ui/screens/decision_screen.dart';

import 'package:provider/provider.dart';

import '../screens/splash_screen.dart';
import '../screens/user_data_screen.dart';
import '../screens/home_screen.dart';
import '../../blocs/post_list/post_list_bloc.dart';
import '../../blocs/post/post_bloc.dart';
import '../../blocs/page_bloc.dart';
import '../../blocs/data_validation_bloc.dart';

final routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  DecisionScreen.routeName: (context) => DecisionScreen(),
  UserDataScreen.routeName: (context) => Provider(
        create: (_) => DataValidationBloc(),
        dispose: (_, bloc) => bloc.dispose(),
        child: UserDataScreen(),
      ),
  HomeScreen.routeName: (context) => MultiProvider(providers: [
        BlocProvider(
          create: (context) => PostListBloc(),
        ),
        BlocProvider(
          create: (context) => PostBloc(),
        ),
        Provider(
          create: (_) => PageBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ], child: HomeScreen()),
};

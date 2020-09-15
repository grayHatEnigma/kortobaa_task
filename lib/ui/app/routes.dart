import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import 'package:provider/provider.dart';

import '../screens/splash_screen.dart';
import '../screens/user_data_screen.dart';
import '../screens/home_screen.dart';
import '../screens/decision_screen.dart';
import '../../managers/post_list/post_list_manager.dart';
import '../../blocs/post/post_bloc.dart';
import '../../managers/page_manager.dart';
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
        StateNotifierProvider<PostListManager, PostListState>(
          create: (context) => PostListManager(),
        ),
        BlocProvider(
          create: (context) => PostBloc(),
        ),
        ChangeNotifierProvider(
          create: (_) => PageManager(),
        ),
      ], child: HomeScreen()),
};

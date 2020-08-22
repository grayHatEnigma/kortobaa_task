import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';
import '../../blocs/post_list/post_list_bloc.dart';
import '../../blocs/post/post_bloc.dart';

final routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => PostListBloc(),
        ),
        BlocProvider(
          create: (context) => PostBloc(),
        ),
      ], child: HomeScreen()),
};

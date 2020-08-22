import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';
import 'user_data_screen.dart';
import '../../blocs/user/user_bloc.dart';
import '../../utilities/device_info_utility.dart';

/// Sole purpose of this screen is to decide where to go next
/// if user is already registered on the cloud navigate to Home
/// else Navigate to UserData Screen to fetch data

class DecisionScreen extends StatelessWidget {
  static final routeName = 'decision';

  _checkUser(context) {
    BlocProvider.of<UserBloc>(context).add(CheckUser(DeviceInfo().deviceToken));
  }

  @override
  Widget build(BuildContext context) {
    _checkUser(context);
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserFound) {
            _redirectToHome(context);
          }
          if (state is UserNotFound) {
            _redirectToUserData(context);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void _redirectToHome(context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  void _redirectToUserData(context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, UserDataScreen.routeName);
    });
  }
}

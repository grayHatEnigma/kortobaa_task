import 'package:flutter/material.dart';
import 'package:kortobaa_task/constants.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  static final routeName = 'splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  final duration = const Duration(milliseconds: 3500);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller);

    controller.forward();

    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).accentColor),
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.5,
          child: Container(
            decoration: ShapeDecoration(
              color: Theme.of(context).primaryColor,
              shape: CircleBorder(),
            ),
            child: FadeTransition(
              opacity: animation,
              child: Image.asset(
                'assets/images/kortobaa.png',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'decision_screen.dart';

class SplashScreen extends StatefulWidget {
  static final routeName = 'splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final duration = const Duration(milliseconds: 2500);
  String animationName = 'loading';
  @override
  void initState() {
    Future.delayed(duration).whenComplete(
      () {
        setState(() {
          animationName = 'success';
        });
        Future.delayed(Duration(milliseconds: 1100)).whenComplete(() =>
            Navigator.pushReplacementNamed(context, DecisionScreen.routeName));
      },
    );
    super.initState();
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
          child: GestureDetector(
            onTap: () {},
            child: FlareActor(
              'assets/animations/loading_success_error.flr',
              animation: animationName,
            ),
          ),
        ),
      ),
    );
  }
}

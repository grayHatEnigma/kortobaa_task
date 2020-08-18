import 'package:flutter/material.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: sizeUtil.size(20), color: Colors.grey),
        ),
      ),
    );
  }
}

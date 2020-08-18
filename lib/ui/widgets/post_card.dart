import 'package:flutter/material.dart';
import '../../constants.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: sizeUtil.width(20), vertical: sizeUtil.height(10)),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 1.0, // soften the shadow
            spreadRadius: 0.5, //extend the shadow
            offset: Offset(
              0.0, // Move to right horizontally
              3.0, // Move to bottom Vertically
            ),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: sizeUtil.size(20), color: Colors.grey),
        ),
      ),
    );
  }
}

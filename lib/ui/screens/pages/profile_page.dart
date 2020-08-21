import 'package:flutter/material.dart';
import 'package:kortobaa_task/models/user.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../blocs/page_bloc.dart';
import '../../widgets/profile_button.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Change app bar title according to the current viewed tab,
    Provider.of<PageBloc>(context)..changePage(MyPage.profile);

    // Profile Image Size
    double profileSize = 55;

    // User Object should be passed from constructor
    final user = User(name: 'grayHatEnigma', email: 'salama92work@gmail.com');

    return Column(
      children: [
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              height: sizeUtil.size(175),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[600],
                    blurRadius: 0.75, // soften the shadow
                    spreadRadius: 0.25, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right horizontally
                      2.0, // Move to bottom Vertically
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -sizeUtil.height(profileSize),
              right: sizeUtil.screenWidth / 2 - sizeUtil.width(profileSize),
              child: CircleAvatar(
                radius: sizeUtil.width(profileSize),
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: sizeUtil.size(50),
                ),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        sizeUtil.sizedBoxWithHeight(profileSize),
        Text(
          user.name,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          user.email,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),

        sizeUtil.sizedBoxWithHeight(profileSize),
        // Profile Buttons Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ProfileButton(icon: Icons.star, onTap: null, text: kFavorites),
            ProfileButton(icon: Icons.settings, onTap: null, text: kSettings),
            ProfileButton(icon: Icons.edit, onTap: null, text: kEditProfile)
          ],
        ),
      ],
    );
  }
}

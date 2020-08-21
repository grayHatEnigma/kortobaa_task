import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../blocs/page_bloc.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Change app bar title according to the current viewed tab,
    Provider.of<PageBloc>(context)..changePage(MyPage.profile);
    return Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: sizeUtil.size(20), color: Colors.grey),
      ),
    );
  }
}

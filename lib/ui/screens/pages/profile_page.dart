import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../blocs/title_bloc.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Change app bar title according to the current viewed tab,
    final titleBloc = Provider.of<TitleBloc>(context);
    // FIXME : there is a strange behaviour here that some time the build is not called ?!
    titleBloc.changeTitle(AppTitle.profile);
    return Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: sizeUtil.size(20), color: Colors.grey),
      ),
    );
  }
}

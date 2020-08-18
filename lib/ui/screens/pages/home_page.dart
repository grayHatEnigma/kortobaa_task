import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:kortobaa_task/ui/widgets/post_card.dart';
import '../../../blocs/title_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Change app bar title according to the current viewed tab,
    final titleBloc = Provider.of<TitleBloc>(context);
    titleBloc.changeTitle(AppTitle.home);
    return Container(
      child: PostCard(),
    );
  }
}

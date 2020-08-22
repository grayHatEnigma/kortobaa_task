import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import '../widgets/add_post_dialog.dart';
import '../../constants.dart';
import '../../blocs/page_bloc.dart';
import '../../blocs/localization_bloc.dart';
import '../../blocs/user/user_bloc.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    // BLoCs
    final pageBloc = Provider.of<PageBloc>(context);
    final localeBloc = Provider.of<LocalizationBloc>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: StreamBuilder<String>(
              stream: pageBloc.page,
              initialData: kHomeTitle,
              builder: (context, snapshot) {
                return Text(
                  FlutterI18n.translate(context, snapshot.data),
                  style: TextStyle(
                      color: Colors.white, fontSize: sizeUtil.size(17.5)),
                );
              }),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {
                Localizations.localeOf(context) == Locale('en')
                    ? localeBloc.setLocale(LocalizationEvent.Ar)
                    : localeBloc.setLocale(LocalizationEvent.En);
              },
              icon: Icon(Icons.language),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
            unselectedLabelStyle: Theme.of(context).textTheme.headline6,
            tabs: <Widget>[
              Tab(
                text: FlutterI18n.translate(context, kHomeTitle),
              ),
              Tab(
                text: FlutterI18n.translate(context, kProfileTitle),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserFound) {
                  return ProfilePage(user: state.user);
                }
                return Container();
              },
            ),
          ],
        ),
        floatingActionButton: StreamBuilder<String>(
            stream: pageBloc.page,
            builder: (context, snapshot) {
              if (snapshot.data == kHomeTitle) {
                return BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    return FloatingActionButton(
                      onPressed: state is UserFound
                          ? () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    AddPostDialog(user: state.user),
                              );
                            }
                          : null,
                      child: Icon(Icons.add),
                    );
                  },
                );
              }
              return Container(width: 0.0, height: 0.0);
            }),
      ),
    );
  }
}

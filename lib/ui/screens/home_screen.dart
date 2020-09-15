import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import '../widgets/add_post_dialog.dart';
import '../../constants.dart';
import '../../managers/page_manager.dart';
import '../../managers/localization_manager.dart';
import '../../blocs/user/user_bloc.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<PageManager>(builder: (_, pageManager, __) {
            return Text(
              FlutterI18n.translate(context, pageManager.pageTitle),
              style:
                  TextStyle(color: Colors.white, fontSize: sizeUtil.size(17.5)),
            );
          }),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {
                Localizations.localeOf(context) == Locale('en')
                    ? context
                        .read<LocalizationManager>()
                        .setLocale(Localization.Ar)
                    : context
                        .read<LocalizationManager>()
                        .setLocale(Localization.En);
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
        floatingActionButton:
            Consumer<PageManager>(builder: (_, pageManeger, __) {
          if (pageManeger.pageTitle == kHomeTitle) {
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

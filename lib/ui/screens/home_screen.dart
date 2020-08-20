import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import '../../constants.dart';
import '../../blocs/title_bloc.dart';
import '../../blocs/localization_bloc.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final titleBloc = Provider.of<TitleBloc>(context);
    final localeBloc = Provider.of<LocalizationBloc>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: StreamBuilder<String>(
              stream: titleBloc.title,
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
          children: <Widget>[
            HomePage(),
            ProfilePage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

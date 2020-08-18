import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import '../../constants.dart';
import '../../blocs/title_bloc.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final titleBloc = Provider.of<TitleBloc>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: StreamBuilder<Object>(
                stream: titleBloc.title,
                initialData: kHomeTitle,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data,
                    style: TextStyle(color: Colors.white),
                  );
                }),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              labelStyle: TextStyle(
                  fontSize: sizeUtil.size(19), fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              tabs: <Widget>[
                Tab(
                  text: kHomeTitle,
                ),
                Tab(
                  text: kProfileTitle,
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    HomePage(),
                    ProfilePage(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

/*


import 'package:flutter/material.dart';

import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../resources/data.dart';
import '../../../../constants.dart';
import '../../widgets/tabs_views.dart';
import '../../widgets/top_tabs_bar.dart';
import '../../widgets/order_card.dart';
import '../../../models/order.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // This is the number of tabs in Orders Page

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TopTabsBar(
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Tab(
                    text: FlutterI18n.translate(context, kCurrentOrders),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Tab(
                    text: FlutterI18n.translate(context, kPreviousOrders),
                  ),
                ),
              ],
              titleSize: sizeUtil.size(18),
              boldTitle: false,
            ),
            Expanded(
              child: TabsViews(
                views: <Widget>[
                  OrdersList(
                    orders: currentOrders,
                  ),
                  OrdersList(
                    orders: previousOrders,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class OrdersList extends StatelessWidget {
  final List<Order> orders;

  const OrdersList({this.orders});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderCard(order: orders[index]);
        });
  }
}


*/

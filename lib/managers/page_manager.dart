import 'package:flutter/foundation.dart';
import 'package:kortobaa_task/constants.dart';

// *** This Manager is responsible of changing app bar title / hiding FAB according to the selected tab ***

class PageManager with ChangeNotifier {
  String _pageTitle = kHomeTitle;
  String get pageTitle => _pageTitle;

  void changePage(MyPage page) {
    if (page == MyPage.home) {
      _pageTitle = kHomeTitle;
    } else if (page == MyPage.profile) {
      _pageTitle = kProfileTitle;
    }
    notifyListeners();
  }
}

// *** Page Enum ***
enum MyPage { home, profile }

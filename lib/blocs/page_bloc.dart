import 'dart:async';
import 'package:kortobaa_task/constants.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_base.dart';

// Here I used The Rx-Stream approach in implementing the bloc pattern
// maybe I will replace this approach with the new Cubit concept from bloc_package
// but for now I will keep do this

// *** This Bloc is responsible of changing app bar title / hiding FAB according to the selected tab ***
// it may seem an over-kill to use bloc here as this could easily be done with setState
// but I think it is necessary for future use cases to reduce the number of rebuilds in the entire screen.

class PageBloc implements BlocBase {
// *** Controllers ***
  final _stateController = BehaviorSubject<String>();
  Stream<String> get page => _stateController.stream;

  final _eventsController = PublishSubject<MyPage>();
  Function(MyPage) get changePage => _eventsController.sink.add;

// *** BLoC Constructor ***
  PageBloc() {
    //supscripe to the incoming stream events
    _eventsController.stream.listen(_mapEventToState);
  }

// *** Map Event To State ***
  void _mapEventToState(event) {
    switch (event) {
      case MyPage.home:
        _stateController.sink.add(kHomeTitle);
        break;
      case MyPage.profile:
        _stateController.sink.add(kProfileTitle);
        break;
    }
  }

// *** Dispose ***
  @override
  void dispose() {
    _stateController.close();
    _eventsController.close();
  }
}

// *** Events Enum ***
enum MyPage { home, profile }

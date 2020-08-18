import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kortobaa_task/constants.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_base.dart';

/// Here I used The Rx-Stream approach in implementing the bloc pattern

// *** This Bloc is responsible of changing app bar title according to the tab ***
// it may seem an over-kill to use bloc here as this could easily be done with setState
// but I think it is necessary for future use cases to reduce the number of rebuilds

class TitleBloc implements BlocBase {
// *** Controllers ***
  final _stateController = BehaviorSubject<String>();
  Stream<String> get title => _stateController.stream;

  final _eventsController = PublishSubject<AppTitle>();
  Function(AppTitle) get changeTitle => _eventsController.sink.add;

// *** BLoC Constructor ***
  TitleBloc() {
    //supscripe to the incoming stream events
    _eventsController.stream.listen(_mapEventToState);
  }

// *** Map Event To State ***
  void _mapEventToState(event) {
    switch (event) {
      case AppTitle.home:
        _stateController.sink.add(kHomeTitle);
        break;
      case AppTitle.profile:
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
enum AppTitle { home, profile }

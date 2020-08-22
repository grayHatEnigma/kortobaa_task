import 'dart:async';
import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

import 'bloc_base.dart';

/// * This bloc will be responsible of changing and preserve app localization ( selected language ) state across the entire app. *
class LocalizationBloc extends BlocBase {
  // *** State ***
  Locale _locale;

  // *** Controllers ***

  final _stateController = PublishSubject<Locale>();
  Stream<Locale> get selectedLocale => _stateController.stream;

  final _eventsController = PublishSubject<LocalizationEvent>();
  Function(LocalizationEvent) get setLocale => _eventsController.sink.add;

  // *** BLoC Constructor ***
  static final instance = LocalizationBloc._();
  LocalizationBloc._() {
    _eventsController.stream.listen(_mapEventsToState);
  }
  factory LocalizationBloc() => instance;

  // *** Map Event To State ***
  void _mapEventsToState(event) {
    if (event == LocalizationEvent.Ar) {
      print('Arabic is selected');
      _locale = Locale('ar');
      _stateController.sink.add(_locale);
    } else if (event == LocalizationEvent.En) {
      print('English is selected');
      _locale = Locale('en');
      _stateController.sink.add(_locale);
    }
  }

  // *** Dispose ***
  @override
  void dispose() {
    _stateController.close();
    _eventsController.close();
  }
}

// *** Events Classes ***
enum LocalizationEvent {
  Ar,
  En,
}

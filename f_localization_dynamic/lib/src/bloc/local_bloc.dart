import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LocalBloc {
  final List<Locale> supportList = const [
    Locale('en', 'US'),
    Locale('ta', 'IN'),
  ];

  final BehaviorSubject<Locale> _activeLocal =
      BehaviorSubject<Locale>.seeded(const Locale('en', 'US'));

  Stream<Locale> get activeLocal => _activeLocal.stream;

  bool changeLanguage(int langIndex) {
    if (langIndex >= supportList.length) {
      return false;
    }
    Locale userLang = supportList[langIndex];
    if (_activeLocal.value == userLang) {
      return true;
    }

    _activeLocal.sink.add(userLang);
    return true;
  }

  void dispose() {
    _activeLocal.close();
  }
}

final LocalBloc localBloc = LocalBloc();

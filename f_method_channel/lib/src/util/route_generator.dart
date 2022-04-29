import 'package:f_method_channel/src/screen/home_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String homeRoute = '/home';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    //final args = settings.arguments;
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}

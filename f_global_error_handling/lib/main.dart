import 'package:flutter/material.dart';
import 'dart:async';
import 'package:f_global_error_handling/src/myapp.dart';

void main() {
  runZonedGuarded(() async {
    //runZonedGuarded -> Errors not caught by Flutter
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails details) {
      //FlutterError.onError->Errors caught by Flutter
      FlutterError.presentError(
          details); //FlutterError.presentError dumpErrorToConsole
    };

    // Pass all uncaught errors from the framework to Crashlytics.
    //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(const MyApp());
  }, (Object error, StackTrace stack) {
    //to store the error
    //FirebaseCrashlytics.instance.recordError(error, stack);
  });
}

import 'package:f_localization_dynamic/src/bloc/local_bloc.dart';
import 'package:f_localization_dynamic/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Locale>(
        stream: localBloc.activeLocal,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Localizations Sample App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            locale: snapshot.data,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ta', 'IN'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const HomeScreen(),
          );
        });
  }

  //
  getActiveLocale() {}
  //
}

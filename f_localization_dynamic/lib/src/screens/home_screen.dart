import 'package:f_localization_dynamic/src/bloc/local_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    localBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.app_title)),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        localBloc.changeLanguage(0);
                      },
                      child: const Text('English')),
                  ElevatedButton(
                      onPressed: () {
                        localBloc.changeLanguage(1);
                      },
                      child: const Text('Tamil')),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(AppLocalizations.of(context)!.welcome_string),
            ],
          ),
        ),
      ),
    );
  }
}

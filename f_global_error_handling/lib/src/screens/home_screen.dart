import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _localErrorButton() {
    try {
      int num1 = 5;
      int num2 = 0;
      int result = _calculation(num1, num2);
      snackBarShow(context, '$num1 / $num2 = $result');
      // ignore: unused_catch_stack
    } catch (error, stack) {
      snackBarShow(context, 'Error Ocurred');
      rethrow;
    }
  }

  int _calculation(int num1, int num2) {
    return num1 ~/ num2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Error Handling'),
      ),
      body: SizedBox.expand(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _localErrorButton,
            child: const Text('Local Error'),
          ),
        ],
      )),
    );
  }

  //
  snackBarShow(BuildContext context, String displayString) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(displayString),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

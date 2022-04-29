import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const batteryChannel = MethodChannel('com.murali.flutter/andexternal');
  String batteryLevel = 'No Data';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Method Channel')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              batteryLevel,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('Get Battery level'),
            )
          ],
        ),
      ),
    );
  }

//
  Future<void> _getBatteryLevel() async {
    String resultStr = '';

    try {
      final int result = await batteryChannel.invokeMethod('getBatteryLevel');
      resultStr = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      resultStr = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      batteryLevel = resultStr;
    });
  }
  //
}

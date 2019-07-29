import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return MyPageState();
  }

}

class MyPageState extends State<MyPage> {


  static const platform = const MethodChannel("samples.flutter.io/battery");
  String _batteryLevel = "Unknown battery level.";

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      print("dart -_getBatteryLevel");
//      在通道上调用此方法
      final int result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      print("dart -setState");
      _batteryLevel = batteryLevel;
    });
  }
  int num = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("电量")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("当前的电量是:"),
            Text(_batteryLevel, style: TextStyle(fontSize: 32))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add)
          , onPressed: _getBatteryLevel,
      )
    );
  }
}

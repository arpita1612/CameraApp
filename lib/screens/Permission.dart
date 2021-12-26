import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetPermission extends StatefulWidget {
  const SetPermission({Key key}) : super(key: key);

  @override
  _SetPermissionState createState() => _SetPermissionState();
}

class _SetPermissionState extends State<SetPermission> {
  bool result;
  bool camSwitch;
  bool storageSwitch;
  // static MethodChannel camplatform;

  @override
  void initState() {
    // camplatform = const MethodChannel('samples.flutter.dev/battery');
    result = false;
    camSwitch = false;
    storageSwitch = false;
    super.initState();
  }

  // String _batteryLevel = 'Unknown battery level.';
  //
  // Future<void> _getBatteryLevel() async {
  //   String batteryLevel;
  //   try {
  //     final int result = await camplatform.invokeMethod('getBatteryLevel');
  //     batteryLevel = 'Battery level at $result % .';
  //   } on PlatformException catch (e) {
  //     batteryLevel = "Failed to get battery level: '${e.message}'.";
  //   }
  //
  //   setState(() {
  //     _batteryLevel = batteryLevel;
  //   });
  // }

  // Future<void> getPermission() async {
  //   bool camData;
  //   try {
  //     final bool result = await camplatform.invokeMethod('getCamPermission');
  //     setState(() {
  //       camSwitch = result;
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }

  //   setState(() {
  //     result = camData;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink[300],
          title: Text(
            'Set Permission.',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 7.0),
            Card(
              color: Colors.pink[50],
              child: Row(
                children: [
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 30.0,
                  ),
                  Text(
                    ' Enable camera ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(width: 150.0),
                  Switch(
                    value: camSwitch,
                    onChanged: (value) {
                      if (Platform.isAndroid) {}
                      // _getBatteryLevel();
                      // getPermission();
                      // setState(() {
                      //   camSwitch = value;
                      //   print(camSwitch);
                      // });
                    },
                    activeTrackColor: Colors.green[300],
                    activeColor: Colors.green[600],
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.pink[50],
              child: Row(
                children: [
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 30.0,
                  ),
                  Text(
                    ' Enable Storage access ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(width: 80.0),
                  Switch(
                    value: storageSwitch,
                    onChanged: (value) {
                      setState(() {
                        storageSwitch = value;
                        print(storageSwitch);
                      });
                    },
                    activeTrackColor: Colors.green[300],
                    activeColor: Colors.green[600],
                  ),
                ],
              ),
            ),
            // Text(_batteryLevel),
          ],
        ));
  }
}

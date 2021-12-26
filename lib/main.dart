import 'package:camera/camera.dart';
import 'package:camera_app/routeFile/generateroute.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   cameras = await availableCameras();
  //
  // } on CameraException catch (e) {
  //   print('${e.code}, ${e.description}');
  // }

  runApp(MaterialApp(
    home : MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      onGenerateRoute: DynamicRoute.generateRoute,
    );
  }
}

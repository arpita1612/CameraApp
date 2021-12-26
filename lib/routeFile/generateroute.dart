import 'package:camera_app/screens/Capture.dart';
import 'package:camera_app/screens/Gallery.dart';
import 'package:camera_app/screens/Home.dart';
import 'package:camera_app/screens/Permission.dart';
import 'package:flutter/material.dart';


class DynamicRoute {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;
    switch (settings.name) {
      case '/capture':
        return MaterialPageRoute(builder: (context) => CaptureImage());

      case '/home':
        return MaterialPageRoute(
          builder: (context) => Home(),
        );

      case '/permission':
        return MaterialPageRoute(
          builder: (context) => SetPermission(),
        );

      case '/gallery':
           return MaterialPageRoute(
          builder: (context) => GalleryView(args),
        );
    }
  }
}

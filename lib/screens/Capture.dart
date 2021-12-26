import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../main.dart';

class CaptureImage extends StatefulWidget {
  const CaptureImage({Key key}) : super(key: key);

  @override
  _CaptureImageState createState() => _CaptureImageState();
}

class _CaptureImageState extends State<CaptureImage> {
  CameraController controller;
  bool isInited = false;
  String url;
  @override
  void initState() {
    // getListCam();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }

      setState(() {
        isInited = true;
      });
    });
    print('Hi');
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        (!controller.value.isInitialized)
            ? Center(child: CircularProgressIndicator())
            : Container(
                width: double.infinity,
                height: double.infinity,
                child: CameraPreview(controller)),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 140.0,
              width: MediaQuery.of(context).size.width * 1.0,
              color: Colors.white12,
              child: IconButton(
                icon: Icon(Icons.camera_alt_rounded, color: Colors.white),
                iconSize: 100.0,
                onPressed: () async {
                  try {
                    final path = join((await getTemporaryDirectory()).path,
                        '${DateTime.now()}.png');
                    print(path);
                    await controller.takePicture().then((res) => {
                          setState(() async {
                            await res.saveTo(path);
                            await res.readAsBytes();
                            print(url);
                            // Uint8List imageBytes = await res.readAsBytes();
                            // await File(path).writeAsBytes(imageBytes);
                          })
                        });
                    Navigator.of(context)
                        .pushReplacementNamed('/gallery', arguments: url);
                  } catch (e) {
                    print('Exception : $e');
                  }
                },
                // {
                //
                //   try{
                //     final image = await controller.takePicture();
                //     Navigator.of(context).pushReplacementNamed('/gallery');
                //   }catch(e){
                //     print(e);
                //   }
                // },
              ),
            )),
      ]),
    );
  }
}

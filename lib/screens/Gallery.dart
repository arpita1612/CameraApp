import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GalleryView extends StatefulWidget {
  final String image;

  const GalleryView(this.image) : super();

  @override
  _GalleryViewState createState() => _GalleryViewState(this.image);
}

class _GalleryViewState extends State<GalleryView> {
  String url;
  _GalleryViewState(String image) {
    url = image;
  }
  List imagepath = [
    'assets/img1.jpg',
    'assets/img2.jpg',
    'assets/img3.jpg',
    'assets/img4.jpg',
    'assets/cam4.jpg',
    'assets/cam1.png',
    'assets/cam2.png',
    'assets/cam3.jpg',
  ];
  @override
  void initState() {
    url = imagepath.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.pink[300],
            title: Text(
              'Gallery',
              style: TextStyle(fontSize: 30.0),
            )),
        // The image is stored as a file on the device. Use the `Image.file`
        // constructor with the given path to display the image.
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: url != null
                    ? Image.asset(
                        url,
                      )
                    // ? Image.file(
                    //     File(url),
                    //     height: MediaQuery.of(context).size.height * 1,
                    //     width: 1000,
                    //   )
                    : Container(),
              ),
            ),
            SizedBox(height: 70.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: CarouselSlider(
                options: CarouselOptions(
                    height: 120.0,
                    viewportFraction: 0.2,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false),
                items: imagepath.map((image) {
                  // ignore: deprecated_member_use
                  return RaisedButton(
                    child: Image.asset(image),
                    onPressed: () {
                      setState(() {
                        url = image;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ));
  }
}

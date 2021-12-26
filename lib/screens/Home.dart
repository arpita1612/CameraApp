import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/img4.jpg',
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.dstOver,
            color: Colors.black45,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/cam1.png',
                scale: 2.5,
                colorBlendMode: BlendMode.darken,
              ),
              textWidget(
                  label: 'Capture',
                  fontcolor: Colors.teal[600],
                  fontsize: 40.0,
                  weight: FontWeight.bold,
                  font: 'GoblinOne'),
              textWidget(
                  label: 'Moments',
                  fontcolor: Colors.teal[600],
                  fontsize: 40.0,
                  weight: FontWeight.bold,
                  font: 'GoblinOne'),
              SizedBox(height: 90.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    height: 50.0,
                    minWidth: 150.0,
                    color: Colors.pink[800],
                    splashColor: Colors.teal,
                    textColor: Colors.white,
                    child: Row(
                      children: [
                        Text(
                          'Capture ',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Icon(Icons.camera_alt_outlined),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/capture');
                    },
                  ),
                  MaterialButton(
                    height: 50.0,
                    minWidth: 150.0,
                    color: Colors.pink[800],
                    splashColor: Colors.teal,
                    textColor: Colors.white,
                    child: Row(
                      children: [
                        Text(
                          'Gallery ',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        Icon(Icons.photo_size_select_actual_outlined),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/gallery');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 170.0,
              ),
              Container(
                width: 250.0,
                child: MaterialButton(
                  height: 60.0,
                  color: Colors.pink[800],
                  splashColor: Colors.teal,
                  textColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Set Permission ',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Icon(Icons.settings),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/permission');
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget textWidget(
      {String label,
      double fontsize,
      Color fontcolor,
      String font,
      FontWeight weight}) {
    return Text(
      label,
      style: TextStyle(
          color: fontcolor,
          fontSize: fontsize,
          fontWeight: weight,
          fontFamily: font),
    );
  }
}

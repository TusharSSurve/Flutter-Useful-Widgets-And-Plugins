import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello!!'),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        activeBackgroundColor: Colors.red.shade400,
        children: [
          SpeedDialChild(
              child: Icon(Icons.add_a_photo_rounded),
              label: 'Capture an image',
              onTap: () => print('Capture image')),
          SpeedDialChild(
              child: Icon(Icons.add_location_rounded),
              label: 'Get location',
              onTap: () => print('Get location')),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //Change Navigation Bar & Status Bar Color
    systemNavigationBarColor: Colors.pink, // navigation bar color
    statusBarColor: Colors.red, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linear Gradient Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Linear Gradient Demo',
            style: TextStyle(
                fontSize: 40,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.pink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}

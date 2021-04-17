import 'package:flutter/material.dart';
import 'package:sidebar/sidebar.dart';

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
      appBar: AppBar(
        title: Text(
          'Sidebar Menu',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme:
            IconThemeData(color: Colors.black), // Change Hamburger icon color
      ),
      drawer: SideDrawer(),
      body: Center(
        child: Text('Side Menu'),
      ),
    );
  }
}

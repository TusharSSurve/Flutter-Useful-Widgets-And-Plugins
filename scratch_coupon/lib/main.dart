import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scratch Card Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScratchCoupon(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScratchCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scratchKey = GlobalKey<ScratcherState>();
    return Scaffold(
      body: Scratcher(
        key: scratchKey,
        brushSize: 30,
        threshold: 75,
        color: Colors.grey.shade800,
        onChange: (value) => print("Scratch progress: $value%"),
        onScratchEnd: () {
          Future.delayed(Duration(seconds: 2));
          scratchKey.currentState.reveal(duration: Duration(seconds: 2));
        },
        onThreshold: () => print('object'),
        child: Container(
          height: 300,
          width: 300,
          color: Colors.blue,
        ),
      ),
    );
  }
}

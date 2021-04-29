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
      home: ScratchCoupon(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScratchCoupon extends StatelessWidget {
  Future<void> scratchCardDialog(BuildContext context, scratchKey) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Align(
                alignment: Alignment.center,
                child: Text("You've won a scratch card",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ))),
            content: Scratcher(
              accuracy: ScratchAccuracy.low,
              image: Image.asset(
                'assets/images/outerimage.png',
              ),
              key: scratchKey,
              brushSize: 50,
              threshold: 75,
              onScratchEnd: () {
                scratchKey.currentState.reveal(duration: Duration(seconds: 2));
              },
              child: Container(
                height: 230,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/newimage.png',
                      fit: BoxFit.contain,
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      "You won",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "\$100",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final scratchKey = GlobalKey<ScratcherState>();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Rewards',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () => scratchCardDialog(context, scratchKey),
        child: Container(
          height: width / 2,
          width: width / 2,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/outerimage.png',
                )),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

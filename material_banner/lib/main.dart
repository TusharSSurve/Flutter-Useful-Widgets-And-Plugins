import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isShowBanner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Banner'),
        centerTitle: true,
      ),
      body: Column(
        children: [if (isShowBanner) buildMaterialBanner()],
      ),
    );
  }

  MaterialBanner buildMaterialBanner() {
    return MaterialBanner(
        padding: const EdgeInsets.all(20),
        backgroundColor: Colors.indigo,
        leading: Icon(
          Icons.subscriptions_outlined,
          color: Colors.white,
        ),
        contentTextStyle: TextStyle(color: Colors.white),
        content: Text(
            'Your subscription is about to expire. Renew your subscription.'),
        actions: [
          FlatButton(
              onPressed: () {},
              child: Text(
                'RENEW',
                style: TextStyle(color: Colors.white),
              )),
          FlatButton(
              onPressed: () {
                setState(() {
                  isShowBanner = false;
                });
              },
              child: Text(
                'DISMISS',
                style: TextStyle(color: Colors.white),
              )),
        ]);
  }
}

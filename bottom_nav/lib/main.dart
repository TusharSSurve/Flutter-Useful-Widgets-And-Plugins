import 'package:bottom_nav/pages/chat.dart';
import 'package:bottom_nav/pages/dashboard.dart';
import 'package:bottom_nav/pages/profile.dart';
import 'package:bottom_nav/pages/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red, accentColor: Colors.red),
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
  int currentTab = 0;
  final List<Widget> screens = [Dashboard(), Chat(), Profile(), Setting()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  @override
  Widget build(BuildContext context) {
    double mediaquery = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Container(
        height: 74.0,
        width: 74.0,
        child: FloatingActionButton(
          elevation: 4,
          child: Icon(
            Icons.camera,
            size: 50,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Container(
          height: 65,
          child: Row(
            children: [
              Row(
                children: [
                  MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: mediaquery / 5,
                    onPressed: () {
                      setState(() {
                        currentScreen = Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Icon(Icons.home,
                            color: currentTab == 0
                                ? Colors.red
                                : Colors.grey.shade400),
                        Text(
                          'Home',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? Colors.red
                                  : Colors.grey.shade400),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: mediaquery / 5,
                    onPressed: () {
                      setState(() {
                        currentScreen = Chat();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Icon(Icons.chat,
                            color: currentTab == 1
                                ? Colors.red
                                : Colors.grey.shade400),
                        Text(
                          'Chat',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Colors.red
                                  : Colors.grey.shade400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: mediaquery / 5,
              ),
              Row(
                children: [
                  MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: mediaquery / 5,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Icon(Icons.location_history_rounded,
                            color: currentTab == 2
                                ? Colors.red
                                : Colors.grey.shade400),
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: currentTab == 2
                                  ? Colors.red
                                  : Colors.grey.shade400),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: mediaquery / 5,
                    onPressed: () {
                      setState(() {
                        currentScreen = Setting();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Icon(Icons.settings,
                            color: currentTab == 3
                                ? Colors.red
                                : Colors.grey.shade400),
                        Text(
                          'Setting',
                          style: TextStyle(
                              color: currentTab == 3
                                  ? Colors.red
                                  : Colors.grey.shade400),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bottom_nav_2/pages/chat.dart';
import 'package:bottom_nav_2/pages/dashboard.dart';
import 'package:bottom_nav_2/pages/profile.dart';
import 'package:bottom_nav_2/pages/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
    double mediaquerywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 65,
          child: Row(
            children: [
              Row(
                children: [
                  MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: mediaquerywidth / 5,
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
                    minWidth: mediaquerywidth / 5,
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
              MaterialButton(
                minWidth: mediaquerywidth / 5,
                onPressed: () {},
                color: Colors.red,
                textColor: Colors.white,
                child: Icon(
                  Icons.camera,
                  size: 36,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
              Row(
                children: [
                  MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: mediaquerywidth / 5,
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
                    minWidth: mediaquerywidth / 5,
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

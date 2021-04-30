import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnBoarding Screen Demo',
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        '/': (context) => Home(),
        "first": (context) => OnBoardingScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
              title: 'A reader lives a thousand lives',
              body: 'The man who never reads lives only one.',
              image: Image.asset('assets/images/ebook.png'),
              decoration: PageDecoration(
                  titleTextStyle:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  bodyTextStyle: TextStyle(fontSize: 20),
                  descriptionPadding: EdgeInsets.all(10).copyWith(bottom: 0),
                  imagePadding: EdgeInsets.all(24),
                  pageColor: Colors.white)),
          PageViewModel(
              title: 'Featured Books',
              body: 'Available right at your fingerprints',
              image: Image.asset('assets/images/readingbook.png'),
              decoration: PageDecoration(
                  titleTextStyle:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  bodyTextStyle: TextStyle(fontSize: 20),
                  descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
                  imagePadding: EdgeInsets.all(24),
                  pageColor: Colors.white)),
          PageViewModel(
              title: 'Simple UI',
              body: 'For enhanced reading experience',
              image: Image.asset('assets/images/manthumbs.png'),
              decoration: PageDecoration(
                  titleTextStyle:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  bodyTextStyle: TextStyle(fontSize: 20),
                  descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
                  imagePadding: EdgeInsets.all(24),
                  pageColor: Colors.white)),
          PageViewModel(
              title: 'Today a reader, tomorrow a leader',
              body: 'Start your journey',
              image: Image.asset('assets/images/learn.png'),
              decoration: PageDecoration(
                  titleTextStyle:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  bodyTextStyle: TextStyle(fontSize: 20),
                  descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
                  imagePadding: EdgeInsets.all(24),
                  pageColor: Colors.white)),
        ],
        done: Text(
          'Read',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onDone: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => Home()));
        },
        doneColor: Colors.black,
        skipColor: Colors.black,
        nextColor: Colors.black,
        showNextButton: true,
        next: Icon(Icons.arrow_forward),
        skip: Text('Skip'),
        showSkipButton: true,
        dotsDecorator: DotsDecorator(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello there'),
      ),
    );
  }
}

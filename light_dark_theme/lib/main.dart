import 'package:flutter/material.dart';
import 'package:light_dark_theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Light Dark Theme',
      home: LightDark(),
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LightDark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    Color col = _themeChanger.isDark == true ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Theme',
          style: TextStyle(color: col),
        ),
        iconTheme: IconThemeData(color: col),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(otherAccountsPictures: [
              IconButton(
                  icon: Icon(
                    _themeChanger.isDark == true
                        ? Icons.wb_sunny
                        : Icons.nights_stay_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _themeChanger.isDark == true
                        ? _themeChanger.setTheme(ThemeData.light())
                        : _themeChanger.setTheme(ThemeData.dark());
                  })
            ], accountName: Text(''), accountEmail: Text('')),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text(
                'Home',
                style: TextStyle(color: col),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('About', style: TextStyle(color: col)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

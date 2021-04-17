import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/chris.jpg'),
                  maxRadius: 50,
                ),
                Text(
                  'Chris Hemsworth',
                  style: TextStyle(fontSize: 20),
                )
              ],
            )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.help_outlined),
              title: Text('Help'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Invite Friend'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Rate the app'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Divider(),
            ListTile(
              trailing: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: Text('Sign Out'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
    );
  }
}

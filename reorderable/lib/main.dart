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
  List<String> names = ['Madara', 'Itachi', 'Senku', 'Kageyama', 'Levi'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Re-Orderable List View'),
      ),
      body: ReorderableListView(
          children: getListItems(),
          onReorder: (int oldIndex, int newIndex) {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            setState(() {
              String name = names[oldIndex];
              names.removeAt(oldIndex);
              names.insert(newIndex, name);
            });
          }),
    );
  }

  List<ListTile> getListItems() => names
      .asMap()
      .map((index, name) => MapEntry(index, buildListTile(name, index)))
      .values
      .toList();

  ListTile buildListTile(String name, int index) {
    return ListTile(
      key: ValueKey(name),
      title: Text(name),
      leading: Text('${index + 1}'),
    );
  }
}

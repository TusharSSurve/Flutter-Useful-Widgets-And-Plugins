import 'package:flutter/material.dart';
import 'package:shimmer_effect/data/chibis.dart';
import 'package:shimmer_effect/model/chibi.dart';
import 'package:shimmer_effect/widgets/normal_list_tile.dart';
import 'package:shimmer_effect/widgets/shimmer_list_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer Effect Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Chibi> chibi = [];
  var _isLoading = false;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future loadData() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 3));
    chibi = List.of(chibis);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer Effect'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return _isLoading ? ShimmerListTile() : NormalListTile(chibi[index]);
        },
        itemCount: 3,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer_effect/model/chibi.dart';

class NormalListTile extends StatelessWidget {
  final Chibi c;

  const NormalListTile(this.c);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage(c.imageUrl),
      ),
      title: Text(c.title, style: TextStyle(fontSize: 16)),
      subtitle: Text(
        c.description,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}

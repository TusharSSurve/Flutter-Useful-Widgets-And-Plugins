import 'package:flutter/material.dart';
import 'package:shimmer_effect/widgets/shimmer_widget.dart';

class ShimmerListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ShimmerWidget.circular(width: 64, height: 64),
      title: Align(
        alignment: Alignment.centerLeft,
        child: ShimmerWidget.rectangular(
          height: 16,
          width: MediaQuery.of(context).size.width / 3,
        ),
      ),
      subtitle: ShimmerWidget.rectangular(height: 14),
    );
  }
}

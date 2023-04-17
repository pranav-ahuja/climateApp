import 'package:flutter/material.dart';

class ReuseContainer extends StatelessWidget {
  ReuseContainer({required this.widgetUsed});

  final widgetUsed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: widgetUsed,
    );
  }
}

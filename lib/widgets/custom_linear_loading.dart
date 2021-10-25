import 'package:flutter/material.dart';

class CustomLinearLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(color),
          minHeight: 20,
        ),
      ),
    );
  }
}

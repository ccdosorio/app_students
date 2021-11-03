import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  String title;

  LoadingScreen(this.title);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

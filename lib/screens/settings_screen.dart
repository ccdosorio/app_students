import 'package:flutter/material.dart';

import 'package:app_students/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraciones'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Settings'),
      ),
      drawer: MenuDrawer(),
    );
  }
}

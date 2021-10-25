import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(color: color),
          ),
          ListTile(
            leading: Icon(Icons.home, color: color),
            title: Text('Inicio'),
            onTap: () => Navigator.pushReplacementNamed(context, 'menu'),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: color),
            title: Text('Configuraciones'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'settings');
            },
          )
        ],
      ),
    );
  }
}

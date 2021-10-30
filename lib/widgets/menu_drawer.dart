import 'package:app_students/screens/screens.dart';
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
           /* onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TabsScreen()),
              );
            },*/
          ),
          ListTile(
            leading: Icon(Icons.task, color: color),
            title: Text('Tareas'),
            onTap: () {},
            /*onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityHomeworkScreen()),
              );
            },*/
          ),
          ListTile(
            leading: Icon(Icons.description, color: color),
            title: Text("Hojas de trabajo"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

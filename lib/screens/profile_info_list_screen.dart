import 'package:app_students/screens/screens.dart';
import 'package:flutter/material.dart';

class ProfileInfoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 70.0,
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
      ),
      child: Card(
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text('Detalle personal'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ProfileFormScreen()),
              );
            },
          ),
      ),
    );
  }
}

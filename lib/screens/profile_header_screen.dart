import 'package:app_students/models/models.dart';
import 'package:app_students/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileHeaderScreen extends StatelessWidget {
  List<Profile> profile;

  ProfileHeaderScreen(this.profile);

  @override
  Widget build(BuildContext context) {

    final title = Text(
      this.profile[0].nombre,
      style: TextStyle(
        fontFamily: 'Lato',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    );

    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 50.0,
      ),
      child: Column(
        children: [
          Row(
            children: [title],
          ),
          UserInfo(this.profile),
          ButtonsBar()
        ],
      ),
    );
  }
}

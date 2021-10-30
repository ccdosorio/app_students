import 'package:app_students/models/models.dart';
import 'package:app_students/screens/screens.dart';
import 'package:app_students/services/services.dart';
import 'package:flutter/material.dart';

import 'package:app_students/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var profileService;

  @override
  void initState() {
    super.initState();
    profileService = new ProfileService();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Profile>>(
        stream: profileService.streamController.stream,
        builder: (BuildContext context, AsyncSnapshot<List<Profile>> snapshot) {
          if (!snapshot.hasData) {
            return LoadingScreen();
          }

          return Scaffold(
            appBar: CustomAppBar(
              title: 'Mi Perfil',
            ),
            body: Stack(
              children: [
                ProfileBackground(),
                ListView(
                  children: [
                    ProfileHeaderScreen(profileService.profile),
                    ProfileInfoListScreen(profileService.profile),
                  ],
                )
              ],
            ),
          );
        });
  }
}

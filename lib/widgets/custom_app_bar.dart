import 'package:app_students/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;

  CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(this.title),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.login_outlined),
          iconSize: 28.0,
          onPressed: () async {
            await authService.logout();
            await Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

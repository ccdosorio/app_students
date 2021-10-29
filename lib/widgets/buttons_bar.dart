import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_students/services/services.dart';
import 'package:app_students/widgets/widgets.dart';

class ButtonsBar extends StatelessWidget {
  // UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // userBloc = BlocProvider.of(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: [
            //Cerrar Sesión
            CircleButton(
              true,
              Icons.exit_to_app,
              20.0,
              Color.fromRGBO(255, 255, 255, 0.6),
              () => {
                authService.logout(),
                Navigator.pushReplacementNamed(context, 'login')
              },
            ),
          ],
        ));
  }
}

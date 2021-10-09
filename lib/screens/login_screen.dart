import 'package:flutter/material.dart';

import 'package:app_students/ui/input_decorations.dart';
import 'package:app_students/widgets/widgets.dart';
import 'package:app_students/ui/input_decorations.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBrackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250),
            CardContainer(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text("Login", style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: 20),
                  _LoginForm()
                ],
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Crear una nueva cuenta",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'usuario@gmail.com',
              labelText: 'Correo electrónico',
              prefixIcon: Icons.alternate_email_rounded,
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: '******',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_outline,
            ),
          ),
          SizedBox(height: 30),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Color.fromRGBO(40, 116, 166, 1),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text('Ingresar', style: TextStyle(color: Colors.white)),
            ),
            onPressed: () {},
          )
        ],
      )),
    );
  }
}

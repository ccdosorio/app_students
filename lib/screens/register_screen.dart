// import 'package:app_students/ui/alert_dialogs.dart';
import 'package:app_students/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_students/providers/register_form_provider.dart';
// import 'package:app_students/services/services.dart';
import 'package:app_students/ui/input_decorations.dart';
import 'package:app_students/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
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
                    Text("Crear cuenta",
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 20),
                    ChangeNotifierProvider(
                      create: (_) => RegisterFormProvider(),
                      child: _RegisterForm(),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'login'),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Color.fromRGBO(40, 116, 166, 1).withOpacity(0.1)),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: Text(
                  "¿Ya tienes una cuenta?",
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);

    return Container(
      child: Form(
        key: registerForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Carnet',
                labelText: 'Carnet',
                prefixIcon: Icons.person_outline_rounded,
              ),
              onChanged: (value) => registerForm.carnet = value,
              validator: (value) {
                if (value != null && value.length == 9) return null;
                return 'El carnet debe ser de 9 caracteres';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'usuario@galileo.edu',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_rounded,
              ),
              onChanged: (value) => registerForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';
              },
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
              onChanged: (value) => registerForm.password = value,
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'La contraseña debe ser de 6 caracteres';
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Theme.of(context).primaryColor,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  registerForm.isLoading ? 'Espere...' : 'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: registerForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();

                      final authService =
                          Provider.of<AuthService>(context, listen: false);

                      if (!registerForm.isValidForm()) return;

                      registerForm.isLoading = true;

                      final String? errorMessage = await authService.signup(
                          registerForm.email,
                          registerForm.password,
                          registerForm.carnet);

                      // if (errorMessage == null) {
                      //   Navigator.pushReplacementNamed(context, 'login');
                      // } else {
                      //   String messageDescription =
                      //       'Por favor, vuelva a intentarlo';
                      //   showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return AlertDialogs.showAlertLogin(
                      //           context: context,
                      //           message: errorMessage,
                      //           description: messageDescription,
                      //         );
                      //       });
                      //   registerForm.isLoading = false;
                      // }
                    },
            )
          ],
        ),
      ),
    );
  }
}

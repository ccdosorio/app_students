// import 'package:app_students/ui/alert_dialogs.dart';

import 'dart:io';

import 'package:app_students/services/services.dart';
import 'package:app_students/ui/alert_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_students/providers/register_form_provider.dart';
// import 'package:app_students/services/services.dart';
import 'package:app_students/ui/input_decorations.dart';
import 'package:app_students/widgets/widgets.dart';
import 'package:select_form_field/select_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static List<Map<String, dynamic>>? items2;

  @override
  Widget build(BuildContext context) {
    //List<Map<String, dynamic>> items2 = [];
    _createItemsCarrera(context).then((value) {
      items2 = value;
    });

    sleep(Duration(seconds: 5));

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

    List<Map<String, dynamic>>? _items = RegisterScreen.items2;

    /*[
      {
        'value': '1',
        'label': 'Estudiantes',
        'icon': Icon(Icons.person_outlined),
        'textStyle': TextStyle(color: Colors.blue),
      },
      {
        'value': '2',
        'label': 'Catedratico',
        'icon': Icon(Icons.person_outlined),
        'textStyle': TextStyle(color: Colors.blue),
      },
    ];*/

    print('RegisterScreen.items2');

    print(RegisterScreen.items2);

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
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Nombre',
                labelText: 'Nombre',
                prefixIcon: Icons.person_pin,
              ),
              onChanged: (value) => registerForm.name = value,
              validator: (value) {
                if (value != null && value.length > 0) return null;
                return 'El nombre es obligatorio';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Apellido',
                labelText: 'Apellido',
                prefixIcon: Icons.person_pin_rounded,
              ),
              onChanged: (value) => registerForm.surname = value,
              validator: (value) {
                if (value != null && value.length > 0) return null;
                return 'El apellido es obligatorio';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Username',
                labelText: 'Username',
                prefixIcon: Icons.person_pin_outlined,
              ),
              onChanged: (value) => registerForm.username = value,
              validator: (value) {
                if (value != null && value.length > 0) return null;
                return 'El username es obligatorio';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Carrera',
                labelText: 'Carrera',
                prefixIcon: Icons.personal_injury,
              ),
              onChanged: (value) => {registerForm.carrer = value},
              validator: (value) {
                if (value != null && value.length > 0) return null;
                return 'La carrera es obligatoria';
              },
            ),
            SizedBox(height: 30),
            SelectFormField(
              keyboardType: TextInputType.text,
              type: SelectFormFieldType.dropdown, // or can be dialog
              icon: Icon(Icons.person_outlined),
              labelText: 'Tipo',
              items: _items, //_items,
              onChanged: (value) => {print(value), registerForm.type = value},
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

                      print(registerForm.type);

                      final String? errorMessage = await authService.signup(
                          registerForm.name,
                          registerForm.surname,
                          registerForm.username,
                          registerForm.carrer,
                          registerForm.type,
                          registerForm.email,
                          registerForm.password,
                          registerForm.carnet);

                      if (errorMessage == null) {
                        Navigator.pushReplacementNamed(context, 'login');
                      } else {
                        String messageDescription =
                            'Por favor, vuelva a intentarlo';
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialogs.showAlertLogin(
                                context: context,
                                message: errorMessage,
                                description: messageDescription,
                              );
                            });
                        registerForm.isLoading = false;
                      }
                    },
            )
          ],
        ),
      ),
    );
  }
}

Future<List<Map<String, dynamic>>> _createItemsCarrera(
    BuildContext context) async {
  List<Map<String, dynamic>> items = [];
  final authService = Provider.of<AuthService>(context, listen: false);

  final List<dynamic> carreras = await authService.getCarreras();
  print('_crearItemsCarrera');
  print(carreras);

  carreras.forEach((opt) {
    final listTemp = {
      'value': opt['idc'],
      'label': opt['carrera'],
      'icon': Icon(Icons.person_outlined),
      'textStyle': TextStyle(color: Colors.blue),
    };
    items.add(listTemp);
  });
  print(items);
  return (items);
}

import 'package:app_students/models/models.dart';
import 'package:app_students/screens/profile_screen.dart';
import 'package:app_students/services/services.dart';
import 'package:app_students/ui/alert_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_students/providers/register_form_provider.dart';
import 'package:app_students/ui/input_decorations.dart';
import 'package:app_students/widgets/widgets.dart';
import 'package:select_form_field/select_form_field.dart';

class ProfileFormScreen extends StatefulWidget {
  List<Profile> _profile;

  ProfileFormScreen(this._profile);

  @override
  State<ProfileFormScreen> createState() => _ProfileFormScreenState(_profile);
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  List<Profile> _profile;

  _ProfileFormScreenState(this._profile);

  static List<Map<String, dynamic>> items2TempCarreras = [];
  static List<Map<String, dynamic>> items3TempCarreras = [];
  static List<Map<String, dynamic>> items2TempTypes = [];
  static List<Map<String, dynamic>> items3TempTypes = [];

  @override
  Widget build(BuildContext context) {
    print(_profile[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Editar perfil"),
      ),
      body: AuthBrackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    /*Text("Editar Perfil",
                        style: Theme.of(context).textTheme.headline4),*/
                    SizedBox(height: 20),
                    ChangeNotifierProvider(
                      create: (_) => RegisterFormProvider(),
                      child: _RegisterForm(),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              /*TextButton(
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
              ),*/
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );

    /*return Scaffold(
      
      body: Center(
        child: Text("Aqui debe ir el formulario"),
        ),
    );*/
  }
}

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);

    List<Map<String, dynamic>>? _itemsCarreras =
        _ProfileFormScreenState.items2TempCarreras;
    List<Map<String, dynamic>>? _itemsTipos =
        _ProfileFormScreenState.items2TempTypes;

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
                if (value != null && value.length == 8) return null;
                return 'El carnet debe ser de 8 caracteres';
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
            /*SelectFormField(
              keyboardType: TextInputType.text,
              type: SelectFormFieldType.dropdown, // or can be dialog
              icon: Icon(
                Icons.personal_injury,
                color: Colors.blue,
              ),
              labelText: 'Carrera',
              items: _itemsCarreras, //_items,
              onChanged: (value) => {print(value), registerForm.carrer = value},
            ),
            SizedBox(height: 30),*/
            /*SelectFormField(
              keyboardType: TextInputType.text,
              type: SelectFormFieldType.dropdown, // or can be dialog
              icon: Icon(
                Icons.person_outlined,
                color: Colors.blue,
              ),
              labelText: 'Tipo',
              items: _itemsTipos, //_items,
              onChanged: (value) => {print(value), registerForm.type = value},
            ),
            SizedBox(height: 30),*/
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
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Text(
                  registerForm.isLoading ? 'Espere...' : 'Guardar Cambios',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: registerForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();

                      //final profileService =
                      //    Provider.of<ProfileService>(context, listen: false);

                      if (!registerForm.isValidForm()) return;

                      //registerForm.isLoading = true;

                      print(registerForm.type);

                      final String? errorMessage =
                          await ProfileService.saveChanges(
                              registerForm.name,
                              registerForm.surname,
                              registerForm.username,
                              //"4",
                              //"1",
                              registerForm.email,
                              registerForm.password,
                              registerForm.carnet);

                      //null;

                      //final String? prueba =

                      if (errorMessage == null) {
                        //Navigator.pushReplacementNamed(context, 'profile');
                        String messageDescription =
                            "Se actualizaron los valores en este formulario.";
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialogs.showAlertLogin(
                                context: context,
                                message: 'Usuario editado!',
                                description: messageDescription,
                              );
                            });
                        registerForm.isLoading = false;
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

Future<List<Map<String, dynamic>>> _createItemsTypes(
    BuildContext context) async {
  List<Map<String, dynamic>> items = [];
  final authService = Provider.of<AuthService>(context, listen: false);

  final List<dynamic> carreras = await authService.getTypes();

  carreras.forEach((opt) {
    final listTemp = {
      'value': opt['codigot'],
      'label': opt['nombre'],
      'icon': Icon(Icons.person_outlined),
      'textStyle': TextStyle(color: Colors.blue),
    };
    items.add(listTemp);
  });

  return (items);
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

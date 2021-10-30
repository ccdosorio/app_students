import 'package:app_students/models/models.dart';
import 'package:app_students/screens/profile_form_screen.dart';
import 'package:app_students/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileInfoListScreen extends StatefulWidget {
  List<Profile> _profile;

  ProfileInfoListScreen(this._profile);

  @override
  State<ProfileInfoListScreen> createState() =>
      _ProfileInfoListScreenState(_profile);
}

class _ProfileInfoListScreenState extends State<ProfileInfoListScreen> {
  List<Profile> _profile;

  _ProfileInfoListScreenState(this._profile);

  static String carreraTemp2 = "";
  static String carreraTemp3 = "";
  static String tipoTemp2 = "";
  static String tipoTemp3 = "";

  @override
  Widget build(BuildContext context) {
    getCarrera(context, _profile[0].idc).then((value) {
      carreraTemp2 = value;
    }).whenComplete(() {
      setState(() {
        carreraTemp3 = carreraTemp2;
      });
    });

    getTipo(context, _profile[0].codigot).then((value) {
      tipoTemp2 = value;
    }).whenComplete(() {
      setState(() {
        tipoTemp3 = tipoTemp2;
      });
    });

    return Container(
      margin: EdgeInsets.only(
        top: 70.0,
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
      ),
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text('Editar perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileFormScreen()),
                );
              },
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Card(
            child: Column(
              children:
                  _infoList(context, widget._profile, carreraTemp3, tipoTemp3),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> _infoList(BuildContext context, List<Profile> profile,
    String carreraTemp3, String tipoTemp3) {
  return [
    ListTile(
      leading: const Icon(Icons.person),
      title: Text('Carnet'),
      subtitle: Text(profile[0].carnet.toString()),
    ),
    ListTile(
      leading: const Icon(Icons.person),
      title: Text('Nombre'),
      subtitle: Text(profile[0].nombre),
    ),
    ListTile(
      leading: const Icon(Icons.person),
      title: Text('Apellido'),
      subtitle: Text(profile[0].apellido),
    ),
    ListTile(
      leading: const Icon(Icons.person),
      title: Text('Carrera'),
      subtitle: Text(carreraTemp3),
    ),
    ListTile(
      leading: const Icon(Icons.person),
      title: Text('Tipo de usuario'),
      subtitle: Text(tipoTemp3),
    ),
  ];
}

Future<String> getCarrera(BuildContext context, int idc) async {
  List<dynamic> carrera = await ProfileService.getCarrera();
  String res = "No tiene carrera asignada";
  //print(idc);

  carrera.forEach((opt) {
    //print(opt['idc'].toString() + ' = ' + idc.toString());
    if (opt['idc'].toString() == idc.toString()) {
      res = opt['carrera'];
    }
  });

  return res;
}

Future<String> getTipo(BuildContext context, int codigot) async {
  List<dynamic> carrera = await ProfileService.getTipo();
  String res = "No tiene un tipo asignada";

  carrera.forEach((opt) {
    //print(opt['codigot'].toString() + ' = ' + codigot.toString());
    if (opt['codigot'].toString() == codigot.toString()) {
      res = opt['nombre'];
    }
  });

  return res;
}

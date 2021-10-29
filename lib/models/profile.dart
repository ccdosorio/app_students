import 'dart:convert';

class Profile {
  Profile({
    required this.codigou,
    required this.carnet,
    required this.nombre,
    required this.apellido,
    required this.user,
    required this.idc,
    required this.codigot,
    required this.password,
    required this.email,
  });

  int codigou;
  int carnet;
  String nombre;
  String apellido;
  String user;
  int idc;
  int codigot;
  String password;
  String email;

  factory Profile.fromJson(String str) => Profile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
    codigou: json["codigou"],
    carnet: json["carnet"],
    nombre: json["nombre"],
    apellido: json["apellido"],
    user: json["USER"],
    idc: json["idc"],
    codigot: json["codigot"],
    password: json["PASSWORD"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "codigou": codigou,
    "carnet": carnet,
    "nombre": nombre,
    "apellido": apellido,
    "USER": user,
    "idc": idc,
    "codigot": codigot,
    "PASSWORD": password,
    "email": email,
  };
}

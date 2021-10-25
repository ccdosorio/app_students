import 'dart:convert';

class Course {
  Course({
    required this.id,
    required this.nombre,
    required this.carrera,
  });

  int id;
  String nombre;
  String carrera;

  factory Course.fromJson(String str) => Course.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Course.fromMap(Map<String, dynamic> json) => Course(
        id: json["id"],
        nombre: json["nombre"],
        carrera: json["carrera"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "carrera": carrera,
      };
}

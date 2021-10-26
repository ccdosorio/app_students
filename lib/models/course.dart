import 'dart:convert';

class Course {
  Course(
      {required this.codigoa,
      required this.codigou,
      required this.codigoc,
      required this.alumno,
      required this.carnet,
      required this.curso});

  int codigoa;
  int codigou;
  int codigoc;
  String alumno;
  int carnet;
  String curso;

  factory Course.fromJson(String str) => Course.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Course.fromMap(Map<String, dynamic> json) => Course(
        codigoa: json["codigoa"],
        codigou: json["codigou"],
        codigoc: json["codigoc"],
        alumno: json["alumno"],
        carnet: json["carnet"],
        curso: json["curso"],
      );

  Map<String, dynamic> toMap() => {
        "codigoa": codigoa,
        "codigou": codigou,
        "codigoc": codigoc,
        "alumno": alumno,
        "carnet": carnet,
        "curso": curso,
      };
}

import 'dart:convert';

class Career {
  Career({
    required this.idc,
    required this.carrera,
  });

  int idc;
  String carrera;

  factory Career.fromJson(String str) => Career.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Career.fromMap(Map<String, dynamic> json) => Career(
        idc: json["idc"],
        carrera: json["carrera"],
      );

  Map<String, dynamic> toMap() => {
        "idc": idc,
        "carrera": carrera,
      };
}

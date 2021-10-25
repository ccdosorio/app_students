// To parse this JSON data, do
//
//     final careerResponse = careerResponseFromMap(jsonString);

import 'dart:convert';

import 'package:app_students/models/models.dart';

class CareerResponse {
  CareerResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<Career> data;

  factory CareerResponse.fromJson(String str) =>
      CareerResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CareerResponse.fromMap(Map<String, dynamic> json) => CareerResponse(
        status: json["status"],
        message: json["message"],
        data: List<Career>.from(json["data"].map((x) => Career.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

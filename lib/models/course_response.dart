// To parse this JSON data, do
//
//     final courseResponse = courseResponseFromMap(jsonString);

import 'dart:convert';

import 'package:app_students/models/models.dart';

class CourseResponse {
  CourseResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Course> data;

  factory CourseResponse.fromJson(String str) =>
      CourseResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CourseResponse.fromMap(Map<String, dynamic> json) => CourseResponse(
        status: json["status"],
        message: json["message"],
        data: List<Course>.from(json["data"].map((x) => Course.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

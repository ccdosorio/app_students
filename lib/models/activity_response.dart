// To parse this JSON data, do
//
//     final activityResponse = activityResponseFromMap(jsonString);

import 'dart:convert';

import 'package:app_students/models/models.dart';

class ActivityResponse {
  ActivityResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Activity data;

  factory ActivityResponse.fromJson(String str) => ActivityResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ActivityResponse.fromMap(Map<String, dynamic> json) => ActivityResponse(
    status: json["status"],
    message: json["message"],
    data: Activity.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data.toMap(),
  };
}



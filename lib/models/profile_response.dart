// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromMap(jsonString);

import 'dart:convert';

import 'package:app_students/models/models.dart';

class ProfileResponse {
  ProfileResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<Profile> data;

  factory ProfileResponse.fromJson(String str) => ProfileResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileResponse.fromMap(Map<String, dynamic> json) => ProfileResponse(
    status: json["status"],
    message: json["message"],
    data: List<Profile>.from(json["data"].map((x) => Profile.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

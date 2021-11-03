import 'dart:convert';

import 'package:app_students/models/models.dart';

class Activity {
  Activity({
    required this.course,
    required this.modules,
  });

  String course;
  List<Module> modules;

  factory Activity.fromJson(String str) => Activity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Activity.fromMap(Map<String, dynamic> json) => Activity(
    course: json["course"],
    modules: List<Module>.from(json["modules"].map((x) => Module.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "course": course,
    "modules": List<dynamic>.from(modules.map((x) => x.toMap())),
  };
}
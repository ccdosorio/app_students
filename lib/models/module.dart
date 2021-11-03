import 'dart:convert';

import 'package:app_students/models/task.dart';

class Module {
  Module({
    required this.module,
    required this.tasks,
  });

  String module;
  List<Task> tasks;

  factory Module.fromJson(String str) => Module.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Module.fromMap(Map<String, dynamic> json) => Module(
    module: json["module"],
    tasks: List<Task>.from(json["tasks"].map((x) => Task.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "module": module,
    "tasks": List<dynamic>.from(tasks.map((x) => x.toMap())),
  };
}
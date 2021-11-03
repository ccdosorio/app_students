import 'dart:convert';

class Task {
  Task({
    required this.title,
    required this.description,
    required this.points,
    required this.date,
    required this.deadline,
    this.path,
  });

  String title;
  String description;
  int points;
  DateTime date;
  DateTime deadline;
  dynamic? path;

  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
    title: json["title"],
    description: json["description"],
    points: json["points"],
    date: DateTime.parse(json["date"]),
    deadline: DateTime.parse(json["deadline"]),
    path: json["path"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "description": description,
    "points": points,
    "date": date.toIso8601String(),
    "deadline": deadline.toIso8601String(),
    "path": path,
  };
}
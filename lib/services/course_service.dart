import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:app_students/models/models.dart';

class CourseService {
  final String _baseURL = 'apistudentsnodejs.herokuapp.com';
  final storage = new FlutterSecureStorage();

  StreamController<List<Course>> _streamController = new StreamController();
  StreamController<List<Course>> get streamController => _streamController;

  List<Course> courses = [];

  CourseService() {
    this.loadCourses();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.http(_baseURL, endpoint);

    final res = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": await storage.read(key: 'token') ?? ''
      },
    );
    return res.body;
  }

  loadCourses() async {
    final idUser = await storage.read(key: 'iduser');

    final jsonData = await _getJsonData('/asignaciones/$idUser');
    final courseResponse = CourseResponse.fromJson(jsonData);

    this.courses = courseResponse.data;

    _streamController.sink.add(this.courses);
  }

  dispose() {
    _streamController.close();
  }
}

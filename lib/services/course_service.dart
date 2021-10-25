import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:app_students/models/models.dart';

class CourseService extends ChangeNotifier {
  final String _baseURL = '24f5-181-174-106-175.ngrok.io';
  List<Course> courses = [];
  bool isLoading = true;

  CourseService() {
    this.loadCourses();
  }

  Future<String> _getJsonData(String endpoint) async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.http(_baseURL, endpoint);
    final res = await http.get(url);
    return res.body;
  }

  loadCourses() async {
    final jsonData = await _getJsonData('/cursos');
    final courseResponse = CourseResponse.fromJson(jsonData);
    this.courses = courseResponse.data;
    this.isLoading = false;
    notifyListeners();
  }
}
